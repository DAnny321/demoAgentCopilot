pageextension 50155 "Sales Order Akeron Ext" extends "Sales Order"
{
    layout
    {
        addafter("No.")
        {
            field("TotalAmountAkeron"; Rec."TotalAmountAkeron")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the total amount from Akeron';
                Editable = true;
            }
            field("Document Akeron"; Rec."Document Akeron")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies if this is an Akeron document';
                Editable = true;
            }
        }
    }
}
