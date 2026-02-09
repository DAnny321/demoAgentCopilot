page 50153 "Staging Sales Documents Akeron"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Staging Sales Documents Akeron";
    Caption = 'Staging Sales Documents Akeron';
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
                field(PostingNo; Rec.PostingNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the posting number of the created document';
                }
                field(COD_MOVIMENTO_CONTABILE; Rec.COD_MOVIMENTO_CONTABILE)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the accounting movement code';
                }
                field(NUM_RIGA; Rec.NUM_RIGA)
                {
                    ApplicationArea = All;
                }
                field(TIPO_MOVIMENTO_CONTABILE; Rec.TIPO_MOVIMENTO_CONTABILE)
                {
                    ApplicationArea = All;
                }
                field(TIPO_RIGA_CONTABILE; Rec.TIPO_RIGA_CONTABILE)
                {
                    ApplicationArea = All;
                }
                field(COD_CAUSALE_CONTABILE; Rec.COD_CAUSALE_CONTABILE)
                {
                    ApplicationArea = All;
                }
                field(COD_AZIENDA; Rec.COD_AZIENDA)
                {
                    ApplicationArea = All;
                }
                field(DATA_REGISTRAZIONE; Rec.DATA_REGISTRAZIONE)
                {
                    ApplicationArea = All;
                }
                field(COD_ESERCIZIO; Rec.COD_ESERCIZIO)
                {
                    ApplicationArea = All;
                }
                field(DARE_AVERE; Rec.DARE_AVERE)
                {
                    ApplicationArea = All;
                }
                field(COD_CONTO; Rec.COD_CONTO)
                {
                    ApplicationArea = All;
                }
                field(DESCRIZIONE; Rec.DESCRIZIONE)
                {
                    ApplicationArea = All;
                }
                field(COD_VALUTA; Rec.COD_VALUTA)
                {
                    ApplicationArea = All;
                }
                field(IMPORTO; Rec.IMPORTO)
                {
                    ApplicationArea = All;
                }
                field(IMPORTO_IMPONIBILE; Rec.IMPORTO_IMPONIBILE)
                {
                    ApplicationArea = All;
                }
                field(COD_VALUTA_CONVERSIONE; Rec.COD_VALUTA_CONVERSIONE)
                {
                    ApplicationArea = All;
                }
                field(CAMBIO_CONVERSIONE; Rec.CAMBIO_CONVERSIONE)
                {
                    ApplicationArea = All;
                }
                field(IMPORTO_CONVERTITO; Rec.IMPORTO_CONVERTITO)
                {
                    ApplicationArea = All;
                }
                field(IMPORTO_IMPONIBILE_CONVERTITO; Rec.IMPORTO_IMPONIBILE_CONVERTITO)
                {
                    ApplicationArea = All;
                }
                field(DATA_INIZIO_COMPETENZA; Rec.DATA_INIZIO_COMPETENZA)
                {
                    ApplicationArea = All;
                }
                field(DATA_FINE_COMPETENZA; Rec.DATA_FINE_COMPETENZA)
                {
                    ApplicationArea = All;
                }
                field(COD_CDC; Rec.COD_CDC)
                {
                    ApplicationArea = All;
                }
                field(COD_VOCE_ANALITICA; Rec.COD_VOCE_ANALITICA)
                {
                    ApplicationArea = All;
                }
                field(DATA_SCADENZA; Rec.DATA_SCADENZA)
                {
                    ApplicationArea = All;
                }
                field(COD_IVA; Rec.COD_IVA)
                {
                    ApplicationArea = All;
                }
                field(DATA_DOCUMENTO_FORNITORE; Rec.DATA_DOCUMENTO_FORNITORE)
                {
                    ApplicationArea = All;
                }
                field(NUMERO_DOCUMENTO_FORNITORE; Rec.NUMERO_DOCUMENTO_FORNITORE)
                {
                    ApplicationArea = All;
                }
                field(SERIE_DOCUMENTO_FORNITORE; Rec.SERIE_DOCUMENTO_FORNITORE)
                {
                    ApplicationArea = All;
                }
                field(COD_REGISTRO_CONTABILE; Rec.COD_REGISTRO_CONTABILE)
                {
                    ApplicationArea = All;
                }
                field(NUMERO_PROTOCOLLO; Rec.NUMERO_PROTOCOLLO)
                {
                    ApplicationArea = All;
                }
                field(COD_SOGGETTO_ESTERNO; Rec.COD_SOGGETTO_ESTERNO)
                {
                    ApplicationArea = All;
                }
                field(COD_MODALITA_PAGAMENTO; Rec.COD_MODALITA_PAGAMENTO)
                {
                    ApplicationArea = All;
                }
                field(IBAN_BANCA_APPOGGIO; Rec.IBAN_BANCA_APPOGGIO)
                {
                    ApplicationArea = All;
                }
                field(IBAN_SOGGETTO_ESTERNO; Rec.IBAN_SOGGETTO_ESTERNO)
                {
                    ApplicationArea = All;
                }
                field(BIC_SWIFT_SOGGETTO_ESTERNO; Rec.BIC_SWIFT_SOGGETTO_ESTERNO)
                {
                    ApplicationArea = All;
                }
                field(BARCODE; Rec.BARCODE)
                {
                    ApplicationArea = All;
                }
                field(NOTE; Rec.NOTE)
                {
                    ApplicationArea = All;
                }
                field(ATTIVO_PASSIVO; Rec.ATTIVO_PASSIVO)
                {
                    ApplicationArea = All;
                }
                field(CODICE_CONTRATTO; Rec.CODICE_CONTRATTO)
                {
                    ApplicationArea = All;
                }
                field(TIPO_RATEO_RISCONTO; Rec.TIPO_RATEO_RISCONTO)
                {
                    ApplicationArea = All;
                }
                field(OID_CONTRATTO; Rec.OID_CONTRATTO)
                {
                    ApplicationArea = All;
                }
                field(OID_SCADENZARIO_ECONOMICO; Rec.OID_SCADENZARIO_ECONOMICO)
                {
                    ApplicationArea = All;
                }
                field(OID_SCADENZARIO_ATTIVITA; Rec.OID_SCADENZARIO_ATTIVITA)
                {
                    ApplicationArea = All;
                }
                field(COD_DOCUMENTO_CONTABILE; Rec.COD_DOCUMENTO_CONTABILE)
                {
                    ApplicationArea = All;
                }
                field(COD_MANDATO_PAGAMENTO; Rec.COD_MANDATO_PAGAMENTO)
                {
                    ApplicationArea = All;
                }
                field(OID_RATEO_RISCONTO_RIGHE; Rec.OID_RATEO_RISCONTO_RIGHE)
                {
                    ApplicationArea = All;
                }
                field(OID_RATA_IMPOSTA_COMUNALE; Rec.OID_RATA_IMPOSTA_COMUNALE)
                {
                    ApplicationArea = All;
                }
                field(OID_DETT_RATA_IMPOSTA_COMUNALE; Rec.OID_DETT_RATA_IMPOSTA_COMUNALE)
                {
                    ApplicationArea = All;
                }
                field(COD_AZIENDA_CONTABILE; Rec.COD_AZIENDA_CONTABILE)
                {
                    ApplicationArea = All;
                }
                field(COD_IVA_CONTABILE; Rec.COD_IVA_CONTABILE)
                {
                    ApplicationArea = All;
                }
                field(COD_SOGGETTO_ESTERNO_CONTABILE; Rec.COD_SOGGETTO_ESTERNO_CONTABILE)
                {
                    ApplicationArea = All;
                }
                field(COD_MOD_PAGAMENTO_CONTABILE; Rec.COD_MOD_PAGAMENTO_CONTABILE)
                {
                    ApplicationArea = All;
                }
                field(COD_CDC_CONTABILE; Rec.COD_CDC_CONTABILE)
                {
                    ApplicationArea = All;
                }
                field(STATO_FLUSSO_CONTABILE; Rec.STATO_FLUSSO_CONTABILE)
                {
                    ApplicationArea = All;
                }
                field(DATA_ESPORTAZIONE; Rec.DATA_ESPORTAZIONE)
                {
                    ApplicationArea = All;
                }
                field(DATA_IMPORTAZIONE; Rec.DATA_IMPORTAZIONE)
                {
                    ApplicationArea = All;
                }
                field(NOTE_IMPORTAZIONE; Rec.NOTE_IMPORTAZIONE)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ValidateDocuments)
            {
                Caption = 'Validate Documents';
                ApplicationArea = All;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Validate staging sales documents';

                trigger OnAction()
                var
                    AkeronDocControls: Codeunit "Akeron Document Controls";
                begin
                    AkeronDocControls.ValidateStagingSalesDocuments();
                    CurrPage.Update(false);
                    Message('Document validation completed.');
                end;
            }
            action(GenerateDocuments)
            {
                Caption = 'Generate Documents';
                ApplicationArea = All;
                Image = MakeAgreement;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Generate sales documents from staging records';

                trigger OnAction()
                var
                    AkeronDocGeneration: Codeunit "Akeron Document Generation";
                begin
                    AkeronDocGeneration.GenerateDocuments();
                    CurrPage.Update(false);
                    Message('Document generation completed.');
                end;
            }
        }
    }
}
