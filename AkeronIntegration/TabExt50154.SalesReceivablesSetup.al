tableextension 50154 "Sales Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50154; "Container Akeron"; Text[100])
        {
            Caption = 'Container Akeron';
            DataClassification = CustomerContent;
            // Note: Table relation would be to T70902."Containername" if it exists
            // TableRelation = "Table 70902".Containername;
        }
        field(50155; "Akeron Customer Path"; Text[250])
        {
            Caption = 'Akeron Customer Path';
            DataClassification = CustomerContent;
        }
        field(50156; "Akeron Archive Customer Path"; Text[250])
        {
            Caption = 'Akeron Archive Customer Path';
            DataClassification = CustomerContent;
        }
        field(50157; "Akeron Sales Path"; Text[250])
        {
            Caption = 'Akeron Sales Path';
            DataClassification = CustomerContent;
        }
        field(50158; "Akeron Archive Sales Path"; Text[250])
        {
            Caption = 'Akeron Archive Sales Path';
            DataClassification = CustomerContent;
        }
        field(50159; "Dimension CDC"; Code[20])
        {
            Caption = 'Dimension CDC';
            DataClassification = CustomerContent;
            TableRelation = Dimension;
        }
        field(50160; "Rounding Account"; Code[20])
        {
            Caption = 'Rounding Account';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
        }
        field(50161; "VAT Posting Group for Rounding"; Code[20])
        {
            Caption = 'VAT Posting Group for Rounding';
            DataClassification = CustomerContent;
            TableRelation = "VAT Product Posting Group";
        }
        field(50162; "Amount to be Rounded"; Decimal)
        {
            Caption = 'Amount to be Rounded';
            DataClassification = CustomerContent;
        }
    }
}
