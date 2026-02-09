tableextension 50156 "Sales Line Akeron Ext" extends "Sales Line"
{
    fields
    {
        field(50156; "ATC Competence Starting Date"; Date)
        {
            Caption = 'ATC Competence Starting Date';
            DataClassification = CustomerContent;
        }
        field(50157; "ATC Competence Ending Date"; Date)
        {
            Caption = 'ATC Competence Ending Date';
            DataClassification = CustomerContent;
        }
    }
}
