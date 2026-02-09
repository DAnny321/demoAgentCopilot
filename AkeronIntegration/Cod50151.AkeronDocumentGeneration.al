codeunit 50151 "Akeron Document Generation"
{
    procedure GenerateDocuments()
    var
        StagingSalesDoc: Record "Staging Sales Documents Akeron";
        TempCodMovimento: Text[30];
        CodMovimentoList: List of [Text];
    begin
        // Get distinct COD_MOVIMENTO_CONTABILE values with status "Controlli effettuati"
        StagingSalesDoc.Reset();
        StagingSalesDoc.SetRange(Status, StagingSalesDoc.Status::"Controlli effettuati");
        if StagingSalesDoc.FindSet() then
            repeat
                if not CodMovimentoList.Contains(StagingSalesDoc.COD_MOVIMENTO_CONTABILE) then
                    CodMovimentoList.Add(StagingSalesDoc.COD_MOVIMENTO_CONTABILE);
            until StagingSalesDoc.Next() = 0;

        // Process each distinct COD_MOVIMENTO_CONTABILE
        foreach TempCodMovimento in CodMovimentoList do
            CreateSalesDocument(TempCodMovimento);
    end;

    local procedure CreateSalesDocument(CodMovimento: Text[30])
    var
        StagingSalesDoc: Record "Staging Sales Documents Akeron";
        CodConto: Text[30];
        DareAvere: Text[1];
        DataRegistrazione: Date;
        NumeroProtocollo: Decimal;
        DataScadenza: Date;
        CodValuta: Text[30];
        CodModalitaPagamento: Text[30];
        Importo: Decimal;
    begin
        // Get header information from CLI line
        StagingSalesDoc.Reset();
        StagingSalesDoc.SetRange(COD_MOVIMENTO_CONTABILE, CodMovimento);
        StagingSalesDoc.SetRange(TIPO_RIGA_CONTABILE, 'CLI');
        StagingSalesDoc.SetRange(Status, StagingSalesDoc.Status::"Controlli effettuati");
        if not StagingSalesDoc.FindFirst() then
            exit;

        CodConto := StagingSalesDoc.COD_CONTO;
        DareAvere := StagingSalesDoc.DARE_AVERE;
        DataRegistrazione := DT2Date(StagingSalesDoc.DATA_REGISTRAZIONE);
        NumeroProtocollo := StagingSalesDoc.NUMERO_PROTOCOLLO;
        DataScadenza := DT2Date(StagingSalesDoc.DATA_SCADENZA);
        CodValuta := StagingSalesDoc.COD_VALUTA;
        CodModalitaPagamento := StagingSalesDoc.COD_MODALITA_PAGAMENTO;
        Importo := StagingSalesDoc.IMPORTO;

        // Try to create the document, catch any errors
        if not TryCreateDocument(CodMovimento, CodConto, DareAvere, DataRegistrazione, NumeroProtocollo, DataScadenza, CodValuta, CodModalitaPagamento, Importo) then begin
            SetErrorForDocument(CodMovimento, GetLastErrorText());
        end;
    end;

    [TryFunction]
    local procedure TryCreateDocument(CodMovimento: Text[30]; CodConto: Text[30]; DareAvere: Text[1]; DataRegistrazione: Date; NumeroProtocollo: Decimal; DataScadenza: Date; CodValuta: Text[30]; CodModalitaPagamento: Text[30]; Importo: Decimal)
    var
        StagingSalesDoc: Record "Staging Sales Documents Akeron";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        SalesSetup: Record "Sales & Receivables Setup";
        TotalLineAmount: Decimal;
        RoundingDifference: Decimal;
        LineNo: Integer;
    begin
        // Create Sales Header
        SalesHeader.Init();
        if DareAvere = 'D' then
            SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice
        else
            SalesHeader."Document Type" := SalesHeader."Document Type"::"Credit Memo";

        SalesHeader."No." := '';
        SalesHeader.Insert(true);

        SalesHeader.Validate("Sell-to Customer No.", CodConto);
        SalesHeader.Validate("Posting Date", DataRegistrazione);
        if NumeroProtocollo <> 0 then
            SalesHeader."External Document No." := Format(NumeroProtocollo);
        if DataScadenza <> 0D then
            SalesHeader."Due Date" := DataScadenza;

        if CodValuta = 'EUR' then
            SalesHeader.Validate("Currency Code", '')
        else
            SalesHeader.Validate("Currency Code", CodValuta);

        SalesHeader.Validate("Payment Method Code", CodModalitaPagamento);
        SalesHeader."TotalAmountAkeron" := Importo;
        SalesHeader."Document Akeron" := true;
        SalesHeader."Akeron Cod Movimento" := CodMovimento;
        SalesHeader.Modify(true);

        // Create Sales Lines
        LineNo := 10000;
        StagingSalesDoc.Reset();
        StagingSalesDoc.SetRange(COD_MOVIMENTO_CONTABILE, CodMovimento);
        StagingSalesDoc.SetRange(TIPO_RIGA_CONTABILE, 'GEN');
        StagingSalesDoc.SetRange(Status, StagingSalesDoc.Status::"Controlli effettuati");
        if StagingSalesDoc.FindSet() then
            repeat
                SalesLine.Init();
                SalesLine."Document Type" := SalesHeader."Document Type";
                SalesLine."Document No." := SalesHeader."No.";
                SalesLine."Line No." := LineNo;
                SalesLine.Insert(true);

                SalesLine.Validate(Type, SalesLine.Type::"G/L Account");
                SalesLine.Validate("No.", StagingSalesDoc.COD_CONTO);
                SalesLine.Validate(Quantity, 1);

                // Calculate line amount based on DARE_AVERE
                if ((StagingSalesDoc.DARE_AVERE = 'A') and (SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice)) or
                   ((StagingSalesDoc.DARE_AVERE = 'D') and (SalesHeader."Document Type" = SalesHeader."Document Type"::"Credit Memo")) then
                    SalesLine.Validate("Line Amount", StagingSalesDoc.IMPORTO)
                else
                    SalesLine.Validate("Line Amount", -StagingSalesDoc.IMPORTO);

                // Set competence dates if they exist
                if StagingSalesDoc.DATA_INIZIO_COMPETENZA <> 0DT then
                    SalesLine."ATC Competence Starting Date" := DT2Date(StagingSalesDoc.DATA_INIZIO_COMPETENZA);
                if StagingSalesDoc.DATA_FINE_COMPETENZA <> 0DT then
                    SalesLine."ATC Competence Ending Date" := DT2Date(StagingSalesDoc.DATA_FINE_COMPETENZA);

                SalesLine.Validate("VAT Prod. Posting Group", StagingSalesDoc.COD_IVA);

                // Set dimension if configured
                if StagingSalesDoc.COD_CDC <> '' then
                    SetLineDimension(SalesLine, StagingSalesDoc.COD_CDC);

                SalesLine.Modify(true);
                LineNo += 10000;
            until StagingSalesDoc.Next() = 0;

        // Check for rounding
        SalesHeader.CalcFields("Amount Including VAT");
        TotalLineAmount := SalesHeader."Amount Including VAT";

        if SalesHeader."TotalAmountAkeron" <> TotalLineAmount then begin
            SalesSetup.Get();
            RoundingDifference := SalesHeader."TotalAmountAkeron" - TotalLineAmount;

            if Abs(RoundingDifference) <= SalesSetup."Amount to be Rounded" then begin
                // Create rounding line
                SalesLine.Init();
                SalesLine."Document Type" := SalesHeader."Document Type";
                SalesLine."Document No." := SalesHeader."No.";
                SalesLine."Line No." := LineNo;
                SalesLine.Insert(true);

                SalesLine.Validate(Type, SalesLine.Type::"G/L Account");
                SalesLine.Validate("No.", SalesSetup."Rounding Account");
                SalesLine.Validate(Quantity, 1);
                SalesLine.Validate("Line Amount", RoundingDifference);
                SalesLine.Validate("VAT Prod. Posting Group", SalesSetup."VAT Posting Group for Rounding");
                SalesLine.Modify(true);
            end else begin
                // Rounding difference too large, delete document and set error
                SalesHeader.Delete(true);
                SetErrorForDocument(CodMovimento, StrSubstNo('È presente una squadratura tra l''importo del documento e il totale delle righe. Importo atteso: %1, Importo calcolato: %2, Differenza: %3, Soglia: %4',
                    SalesHeader."TotalAmountAkeron", TotalLineAmount, Abs(RoundingDifference), SalesSetup."Amount to be Rounded"));
                exit;
            end;
        end;

        // Mark staging records as elaborated
        SetElaboratedForDocument(CodMovimento);
    end;

    local procedure SetErrorForDocument(CodMovimento: Text[30]; ErrorMessage: Text)
    var
        StagingSalesDoc: Record "Staging Sales Documents Akeron";
    begin
        StagingSalesDoc.Reset();
        StagingSalesDoc.SetRange(COD_MOVIMENTO_CONTABILE, CodMovimento);
        if StagingSalesDoc.FindSet() then
            repeat
                StagingSalesDoc.Status := StagingSalesDoc.Status::"Errore Elaborazione";
                StagingSalesDoc.NOTE_IMPORTAZIONE := ErrorMessage;
                StagingSalesDoc.Modify();
            until StagingSalesDoc.Next() = 0;
    end;

    local procedure SetElaboratedForDocument(CodMovimento: Text[30])
    var
        StagingSalesDoc: Record "Staging Sales Documents Akeron";
    begin
        StagingSalesDoc.Reset();
        StagingSalesDoc.SetRange(COD_MOVIMENTO_CONTABILE, CodMovimento);
        if StagingSalesDoc.FindSet() then
            repeat
                StagingSalesDoc.Status := StagingSalesDoc.Status::Elaborato;
                StagingSalesDoc.Modify();
            until StagingSalesDoc.Next() = 0;
    end;

    local procedure SetLineDimension(var SalesLine: Record "Sales Line"; DimensionCode: Text[30])
    var
        DimensionSetEntry: Record "Dimension Set Entry";
        TempDimensionSetEntry: Record "Dimension Set Entry" temporary;
        SalesSetup: Record "Sales & Receivables Setup";
        DimMgt: Codeunit DimensionManagement;
        NewDimSetID: Integer;
    begin
        SalesSetup.Get();
        if SalesSetup."Dimension CDC" = '' then
            exit;

        // Get existing dimension set entries
        DimensionSetEntry.Reset();
        DimensionSetEntry.SetRange("Dimension Set ID", SalesLine."Dimension Set ID");
        if DimensionSetEntry.FindSet() then
            repeat
                TempDimensionSetEntry := DimensionSetEntry;
                TempDimensionSetEntry.Insert();
            until DimensionSetEntry.Next() = 0;

        // Add or update the CDC dimension
        TempDimensionSetEntry.Reset();
        TempDimensionSetEntry.SetRange("Dimension Code", SalesSetup."Dimension CDC");
        if TempDimensionSetEntry.FindFirst() then begin
            TempDimensionSetEntry."Dimension Value Code" := CopyStr(DimensionCode, 1, 20);
            TempDimensionSetEntry.Modify();
        end else begin
            TempDimensionSetEntry.Init();
            TempDimensionSetEntry."Dimension Code" := SalesSetup."Dimension CDC";
            TempDimensionSetEntry."Dimension Value Code" := CopyStr(DimensionCode, 1, 20);
            TempDimensionSetEntry.Insert();
        end;

        // Create new dimension set ID
        NewDimSetID := DimMgt.GetDimensionSetID(TempDimensionSetEntry);
        SalesLine."Dimension Set ID" := NewDimSetID;
    end;
}
