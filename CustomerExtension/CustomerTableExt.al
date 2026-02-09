tableextension 50100 "Customer Extension" extends Customer
{
    fields
    {
        field(50100; ExternalCustomerId; Code[50])
        {
            Caption = 'External Customer Id';
            DataClassification = CustomerContent;
        }
    }
}
