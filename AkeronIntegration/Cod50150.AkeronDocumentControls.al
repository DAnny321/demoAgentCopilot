codeunit 50150 "Akeron Document Controls"
{
    procedure ValidateStagingSalesDocuments()
    var
        StagingSalesDoc: Record "Staging Sales Documents Akeron";
        TempCodMovimento: Text[30];
        CodMovimentoList: List of [Text];
    begin
        // Get distinct COD_MOVIMENTO_CONTABILE values for records that need validation
        StagingSalesDoc.Reset();
        StagingSalesDoc.SetRange(Status, StagingSalesDoc.Status::"Da elaborare");
        if StagingSalesDoc.FindSet() then
            repeat
                if not CodMovimentoList.Contains(StagingSalesDoc.COD_MOVIMENTO_CONTABILE) then
                    CodMovimentoList.Add(StagingSalesDoc.COD_MOVIMENTO_CONTABILE);
            until StagingSalesDoc.Next() = 0;

        // Process each distinct COD_MOVIMENTO_CONTABILE
        foreach TempCodMovimento in CodMovimentoList do
            ValidateDocument(TempCodMovimento);
    end;

    local procedure ValidateDocument(CodMovimento: Text[30])
    var
        StagingSalesDoc: Record "Staging Sales Documents Akeron";
        Customer: Record Customer;
        Currency: Record Currency;
        PaymentMethod: Record "Payment Method";
        GLAccount: Record "G/L Account";
        VATProdPostingGroup: Record "VAT Product Posting Group";
        DimensionValue: Record "Dimension Value";
        SalesSetup: Record "Sales & Receivables Setup";
        CodConto: Text[30];
        CodValuta: Text[30];
        CodModalitaPagamento: Text[30];
        CodIVA: Text[30];
        CodCDC: Text[30];
        ErrorFound: Boolean;
    begin
        // 1) Check if customer exists
        StagingSalesDoc.Reset();
        StagingSalesDoc.SetRange(COD_MOVIMENTO_CONTABILE, CodMovimento);
        StagingSalesDoc.SetRange(TIPO_RIGA_CONTABILE, 'CLI');
        if StagingSalesDoc.FindFirst() then begin
            CodConto := StagingSalesDoc.COD_CONTO;
            CodValuta := StagingSalesDoc.COD_VALUTA;
            CodModalitaPagamento := StagingSalesDoc.COD_MODALITA_PAGAMENTO;

            Customer.Reset();
            Customer.SetRange("No.", CodConto);
            if not Customer.FindFirst() then begin
                SetErrorForDocument(CodMovimento, StrSubstNo('Il cliente nr. %1 non esiste', CodConto));
                exit;
            end;

            // 2) Check currency if not EUR
            if CodValuta <> 'EUR' then begin
                Currency.Reset();
                Currency.SetRange(Code, CodValuta);
                if not Currency.FindFirst() then begin
                    SetErrorForDocument(CodMovimento, StrSubstNo('La valuta %1 non esiste', CodValuta));
                    exit;
                end;
            end;

            // 3) Check payment method
            PaymentMethod.Reset();
            PaymentMethod.SetRange(Code, CodModalitaPagamento);
            if not PaymentMethod.FindFirst() then begin
                SetErrorForDocument(CodMovimento, StrSubstNo('Il metodo di pagamento %1 non esiste', CodModalitaPagamento));
                exit;
            end;
        end;

        // 4) Check G/L Accounts for GEN lines
        StagingSalesDoc.Reset();
        StagingSalesDoc.SetRange(COD_MOVIMENTO_CONTABILE, CodMovimento);
        StagingSalesDoc.SetRange(TIPO_RIGA_CONTABILE, 'GEN');
        if StagingSalesDoc.FindSet() then
            repeat
                CodConto := StagingSalesDoc.COD_CONTO;
                GLAccount.Reset();
                GLAccount.SetRange("No.", CodConto);
                GLAccount.SetRange("Account Type", GLAccount."Account Type"::Posting);
                if not GLAccount.FindFirst() then begin
                    SetErrorForDocument(CodMovimento, StrSubstNo('Il conto %1 non esiste', CodConto));
                    exit;
                end;

                if not GLAccount."Direct Posting" then begin
                    SetErrorForDocument(CodMovimento, StrSubstNo('Il conto %1 non può essere utilizzato. È necessario abilitare la registrazione diretta', CodConto));
                    exit;
                end;

                if GLAccount.Blocked then begin
                    SetErrorForDocument(CodMovimento, StrSubstNo('Il conto %1 non può essere utilizzato. Il conto risulta bloccato', CodConto));
                    exit;
                end;
            until StagingSalesDoc.Next() = 0;

        // 5) Check VAT Product Posting Groups
        StagingSalesDoc.Reset();
        StagingSalesDoc.SetRange(COD_MOVIMENTO_CONTABILE, CodMovimento);
        StagingSalesDoc.SetRange(TIPO_RIGA_CONTABILE, 'GEN');
        if StagingSalesDoc.FindSet() then
            repeat
                CodIVA := StagingSalesDoc.COD_IVA;
                VATProdPostingGroup.Reset();
                VATProdPostingGroup.SetRange(Code, CodIVA);
                if not VATProdPostingGroup.FindFirst() then begin
                    SetErrorForDocument(CodMovimento, StrSubstNo('La cat. reg. art./serv. IVA %1 non esiste', CodIVA));
                    exit;
                end;
            until StagingSalesDoc.Next() = 0;

        // 6) Check Dimensions (CDC)
        SalesSetup.Get();
        if SalesSetup."Dimension CDC" <> '' then begin
            StagingSalesDoc.Reset();
            StagingSalesDoc.SetRange(COD_MOVIMENTO_CONTABILE, CodMovimento);
            StagingSalesDoc.SetRange(TIPO_RIGA_CONTABILE, 'GEN');
            if StagingSalesDoc.FindSet() then
                repeat
                    CodCDC := StagingSalesDoc.COD_CDC;
                    if CodCDC <> '' then begin
                        DimensionValue.Reset();
                        DimensionValue.SetRange("Dimension Code", SalesSetup."Dimension CDC");
                        DimensionValue.SetRange(Code, CodCDC);
                        if not DimensionValue.FindFirst() then begin
                            SetErrorForDocument(CodMovimento, StrSubstNo('La dimensione %1 non esiste', CodCDC));
                            exit;
                        end;
                    end;
                until StagingSalesDoc.Next() = 0;
        end;

        // All controls passed
        SetControlsPassedForDocument(CodMovimento);
    end;

    local procedure SetErrorForDocument(CodMovimento: Text[30]; ErrorMessage: Text)
    var
        StagingSalesDoc: Record "Staging Sales Documents Akeron";
    begin
        StagingSalesDoc.Reset();
        StagingSalesDoc.SetRange(COD_MOVIMENTO_CONTABILE, CodMovimento);
        if StagingSalesDoc.FindSet() then
            repeat
                StagingSalesDoc.Status := StagingSalesDoc.Status::"Errore controlli";
                StagingSalesDoc.NOTE_IMPORTAZIONE := ErrorMessage;
                StagingSalesDoc.Modify();
            until StagingSalesDoc.Next() = 0;
    end;

    local procedure SetControlsPassedForDocument(CodMovimento: Text[30])
    var
        StagingSalesDoc: Record "Staging Sales Documents Akeron";
    begin
        StagingSalesDoc.Reset();
        StagingSalesDoc.SetRange(COD_MOVIMENTO_CONTABILE, CodMovimento);
        if StagingSalesDoc.FindSet() then
            repeat
                StagingSalesDoc.Status := StagingSalesDoc.Status::"Controlli effettuati";
                StagingSalesDoc.Modify();
            until StagingSalesDoc.Next() = 0;
    end;
}
