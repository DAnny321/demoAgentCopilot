codeunit 50152 "Akeron Posting Validation"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
    local procedure OnBeforePostSalesDoc(var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean; var HideProgressWindow: Boolean; var IsHandled: Boolean; var CalledBy: Integer)
    begin
        // Check if this is an Akeron document
        if SalesHeader."Document Akeron" then begin
            // Validate that TotalAmountAkeron matches Amount Including VAT
            SalesHeader.CalcFields("Amount Including VAT");
            if SalesHeader."TotalAmountAkeron" <> SalesHeader."Amount Including VAT" then
                Error('Impossibile procedere con la registrazione. È presente una squadratura nel documento.');
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetQtyShptHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean; PreviewMode: Boolean)
    var
        StagingSalesDoc: Record "Staging Sales Documents Akeron";
        PostingNo: Code[20];
        CodMovimento: Text[30];
    begin
        // Update staging records after successful posting
        if SalesHeader."Document Akeron" then begin
            if SalesInvHdrNo <> '' then
                PostingNo := SalesInvHdrNo
            else if SalesCrMemoHdrNo <> '' then
                PostingNo := SalesCrMemoHdrNo;

            // Update staging records using COD_MOVIMENTO_CONTABILE
            if (PostingNo <> '') and (SalesHeader."Akeron Cod Movimento" <> '') then begin
                CodMovimento := SalesHeader."Akeron Cod Movimento";
                StagingSalesDoc.Reset();
                StagingSalesDoc.SetRange(COD_MOVIMENTO_CONTABILE, CodMovimento);
                StagingSalesDoc.SetRange(Status, StagingSalesDoc.Status::Elaborato);
                if StagingSalesDoc.FindSet() then
                    repeat
                        StagingSalesDoc.PostingNo := PostingNo;
                        StagingSalesDoc.Status := StagingSalesDoc.Status::Registrato;
                        StagingSalesDoc.Modify();
                    until StagingSalesDoc.Next() = 0;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnPostSalesDocOnBeforeRunGenJnlPostLine', '', false, false)]
    local procedure OnPostSalesDocOnBeforeRunGenJnlPostLine(var GenJnlLine: Record "Gen. Journal Line"; var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; PreviewMode: Boolean; CommitIsSupressed: Boolean; var IsHandled: Boolean; var Window: Dialog; var HideProgressWindow: Boolean)
    begin
        // Additional validation before posting could go here if needed
    end;
}
