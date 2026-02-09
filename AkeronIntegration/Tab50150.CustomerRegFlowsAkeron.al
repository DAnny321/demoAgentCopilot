table 50150 "Customer Reg Flows Akeron"
{
    Caption = 'Customer Reg Flows Akeron';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Import ID"; Integer)
        {
            Caption = 'Import ID';
            DataClassification = CustomerContent;
        }
        field(2; "File Name"; Code[50])
        {
            Caption = 'File Name';
            DataClassification = CustomerContent;
        }
        field(3; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Nuovo,"Caricato staging",Processato,Errore;
            OptionCaption = 'Nuovo,Caricato staging,Processato,Errore';
            DataClassification = CustomerContent;
        }
        field(4; "Import Date"; Date)
        {
            Caption = 'Import Date';
            DataClassification = CustomerContent;
        }
        field(5; File; Blob)
        {
            Caption = 'File';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Import ID")
        {
            Clustered = true;
        }
    }
}
