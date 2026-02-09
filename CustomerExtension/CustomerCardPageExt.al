pageextension 50100 "Customer Card Extension" extends "Customer Card"
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
