tableextension 50155 "Sales Header Akeron Ext" extends "Sales Header"
{
    fields
    {
        field(50155; "TotalAmountAkeron"; Decimal)
        {
            Caption = 'Total Amount Akeron';
            DataClassification = CustomerContent;
        }
        field(50156; "Document Akeron"; Boolean)
        {
            Caption = 'Document Akeron';
            DataClassification = CustomerContent;
        }
        field(50157; "Akeron Cod Movimento"; Text[30])
        {
            Caption = 'Akeron Cod Movimento';
            DataClassification = CustomerContent;
        }
    }
}
