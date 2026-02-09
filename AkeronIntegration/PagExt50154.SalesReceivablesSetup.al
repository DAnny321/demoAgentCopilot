pageextension 50154 "Sales Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast(content)
        {
            group("Setup interfaccia Akeron")
            {
                Caption = 'Setup interfaccia Akeron';

                group("Clienti")
                {
                    Caption = 'Clienti';

                    field("Container Akeron"; Rec."Container Akeron")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the Akeron container';
                    }
                    field("Akeron Customer Path"; Rec."Akeron Customer Path")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the Akeron customer path';
                    }
                    field("Akeron Archive Customer Path"; Rec."Akeron Archive Customer Path")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the Akeron archive customer path';
                    }
                }
                group("Vendite")
                {
                    Caption = 'Vendite';

                    field("Akeron Sales Path"; Rec."Akeron Sales Path")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the Akeron sales path';
                    }
                    field("Akeron Archive Sales Path"; Rec."Akeron Archive Sales Path")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the Akeron archive sales path';
                    }
                }
                group("Configurazione")
                {
                    Caption = 'Configurazione';

                    field("Dimension CDC"; Rec."Dimension CDC")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the dimension CDC';
                    }
                    field("Rounding Account"; Rec."Rounding Account")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the rounding account';
                    }
                    field("VAT Posting Group for Rounding"; Rec."VAT Posting Group for Rounding")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the VAT posting group for rounding';
                    }
                    field("Amount to be Rounded"; Rec."Amount to be Rounded")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the amount to be rounded';
                    }
                }
            }
        }
    }
}
