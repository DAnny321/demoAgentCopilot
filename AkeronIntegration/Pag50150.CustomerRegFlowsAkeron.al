page 50150 "Customer Reg Flows Akeron"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Customer Reg Flows Akeron";
    Caption = 'Customer Reg Flows Akeron';
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Import ID"; Rec."Import ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the import ID';
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the file name';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the status';
                }
                field("Import Date"; Rec."Import Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the import date';
                }
                field(File; Rec.File)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the file';
                }
            }
        }
    }
}
