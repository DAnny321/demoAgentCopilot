page 50152 "Staging Customer Akeron"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Staging Customer Akeron";
    Caption = 'Staging Customer Akeron';
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the entry number';
                }
                field("Import ID"; Rec."Import ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the import ID';
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
                field("File Nome"; Rec."File Nome")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the file name';
                }
                field(COD_SOGGETTO; Rec.COD_SOGGETTO)
                {
                    ApplicationArea = All;
                }
                field(RAGIONE_SOCIALE; Rec.RAGIONE_SOCIALE)
                {
                    ApplicationArea = All;
                }
                field(CLIENTE_FORNITORE; Rec.CLIENTE_FORNITORE)
                {
                    ApplicationArea = All;
                }
                field(FLAG_SOGGETTO_IVA; Rec.FLAG_SOGGETTO_IVA)
                {
                    ApplicationArea = All;
                }
                field(PARTITA_IVA; Rec.PARTITA_IVA)
                {
                    ApplicationArea = All;
                }
                field(CODICE_FISCALE; Rec.CODICE_FISCALE)
                {
                    ApplicationArea = All;
                }
                field(INDIRIZZO_SEDE_LEGALE; Rec.INDIRIZZO_SEDE_LEGALE)
                {
                    ApplicationArea = All;
                }
                field(CAP_SEDE_LEGALE; Rec.CAP_SEDE_LEGALE)
                {
                    ApplicationArea = All;
                }
                field(LOCALITA_SEDE_LEGALE; Rec.LOCALITA_SEDE_LEGALE)
                {
                    ApplicationArea = All;
                }
                field(COD_COMUNE_SEDE_LEGALE; Rec.COD_COMUNE_SEDE_LEGALE)
                {
                    ApplicationArea = All;
                }
                field(INDIRIZZO_SPEDIZIONE; Rec.INDIRIZZO_SPEDIZIONE)
                {
                    ApplicationArea = All;
                }
                field(CAP_SPEDIZIONE; Rec.CAP_SPEDIZIONE)
                {
                    ApplicationArea = All;
                }
                field(LOCALITA_SPEDIZIONE; Rec.LOCALITA_SPEDIZIONE)
                {
                    ApplicationArea = All;
                }
                field(COD_COMUNE_SPEDIZIONE; Rec.COD_COMUNE_SPEDIZIONE)
                {
                    ApplicationArea = All;
                }
                field(SPEDIZIONE_PRESSO; Rec.SPEDIZIONE_PRESSO)
                {
                    ApplicationArea = All;
                }
                field(COD_MODALITA_PAGAMENTO; Rec.COD_MODALITA_PAGAMENTO)
                {
                    ApplicationArea = All;
                }
                field(IBAN; Rec.IBAN)
                {
                    ApplicationArea = All;
                }
                field(BIC_SWIFT; Rec.BIC_SWIFT)
                {
                    ApplicationArea = All;
                }
                field(DESC_BANCA; Rec.DESC_BANCA)
                {
                    ApplicationArea = All;
                }
                field(FLAG_PERSONA_FISICA; Rec.FLAG_PERSONA_FISICA)
                {
                    ApplicationArea = All;
                }
                field(PF_NOME; Rec.PF_NOME)
                {
                    ApplicationArea = All;
                }
                field(PF_COGNOME; Rec.PF_COGNOME)
                {
                    ApplicationArea = All;
                }
                field(PF_SESSO; Rec.PF_SESSO)
                {
                    ApplicationArea = All;
                }
                field(PF_DATA_NASCITA; Rec.PF_DATA_NASCITA)
                {
                    ApplicationArea = All;
                }
                field(PF_LUOGO_NASCITA; Rec.PF_LUOGO_NASCITA)
                {
                    ApplicationArea = All;
                }
                field(FLAG_OBSOLETO; Rec.FLAG_OBSOLETO)
                {
                    ApplicationArea = All;
                }
                field(CODICE_SDI; Rec.CODICE_SDI)
                {
                    ApplicationArea = All;
                }
                field(COD_AZIENDA_IC; Rec.COD_AZIENDA_IC)
                {
                    ApplicationArea = All;
                }
                field(COD_TIPO_SOGGETTO; Rec.COD_TIPO_SOGGETTO)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
