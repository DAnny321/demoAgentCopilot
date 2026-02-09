pageextension 50101 "Customer List Extension" extends "Customer List"
{
    layout
    {
        addafter("No.")
        {
            field(ExternalCustomerId; Rec.ExternalCustomerId)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the external customer identifier';
            }
        }
    }
}
