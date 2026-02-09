table 50153 "Staging Sales Documents Akeron"
{
    Caption = 'Staging Sales Documents Akeron';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "Import ID"; Integer)
        {
            Caption = 'Import ID';
            DataClassification = CustomerContent;
        }
        field(3; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = "Da elaborare",Elaborato,"Errore Elaborazione",Registrato,"Errore registrazione",Sostituito,Errore,"Controlli effettuati","Errore controlli",Eliminato,"Carico ricevuto",Aggiornato;
            OptionCaption = 'Da elaborare,Elaborato,Errore Elaborazione,Registrato,Errore registrazione,Sostituito,Errore,Controlli effettuati,Errore controlli,Eliminato,Carico ricevuto,Aggiornato';
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
        field(6; PostingNo; Code[20])
        {
            Caption = 'PostingNo';
            DataClassification = CustomerContent;
        }
        field(7; COD_MOVIMENTO_CONTABILE; Text[30])
        {
            Caption = 'COD_MOVIMENTO_CONTABILE';
            DataClassification = CustomerContent;
        }
        field(8; NUM_RIGA; Decimal)
        {
            Caption = 'NUM_RIGA';
            DataClassification = CustomerContent;
        }
        field(9; TIPO_MOVIMENTO_CONTABILE; Text[3])
        {
            Caption = 'TIPO_MOVIMENTO_CONTABILE';
            DataClassification = CustomerContent;
        }
        field(10; TIPO_RIGA_CONTABILE; Text[5])
        {
            Caption = 'TIPO_RIGA_CONTABILE';
            DataClassification = CustomerContent;
        }
        field(11; COD_CAUSALE_CONTABILE; Text[30])
        {
            Caption = 'COD_CAUSALE_CONTABILE';
            DataClassification = CustomerContent;
        }
        field(12; COD_AZIENDA; Text[30])
        {
            Caption = 'COD_AZIENDA';
            DataClassification = CustomerContent;
        }
        field(13; DATA_REGISTRAZIONE; DateTime)
        {
            Caption = 'DATA_REGISTRAZIONE';
            DataClassification = CustomerContent;
        }
        field(14; COD_ESERCIZIO; Text[30])
        {
            Caption = 'COD_ESERCIZIO';
            DataClassification = CustomerContent;
        }
        field(15; DARE_AVERE; Text[1])
        {
            Caption = 'DARE_AVERE';
            DataClassification = CustomerContent;
        }
        field(16; COD_CONTO; Text[30])
        {
            Caption = 'COD_CONTO';
            DataClassification = CustomerContent;
        }
        field(17; DESCRIZIONE; Text[1000])
        {
            Caption = 'DESCRIZIONE';
            DataClassification = CustomerContent;
        }
        field(18; COD_VALUTA; Text[30])
        {
            Caption = 'COD_VALUTA';
            DataClassification = CustomerContent;
        }
        field(19; IMPORTO; Decimal)
        {
            Caption = 'IMPORTO';
            DataClassification = CustomerContent;
        }
        field(20; IMPORTO_IMPONIBILE; Decimal)
        {
            Caption = 'IMPORTO_IMPONIBILE';
            DataClassification = CustomerContent;
        }
        field(21; COD_VALUTA_CONVERSIONE; Text[30])
        {
            Caption = 'COD_VALUTA_CONVERSIONE';
            DataClassification = CustomerContent;
        }
        field(22; CAMBIO_CONVERSIONE; Decimal)
        {
            Caption = 'CAMBIO_CONVERSIONE';
            DataClassification = CustomerContent;
        }
        field(23; IMPORTO_CONVERTITO; Decimal)
        {
            Caption = 'IMPORTO_CONVERTITO';
            DataClassification = CustomerContent;
        }
        field(24; IMPORTO_IMPONIBILE_CONVERTITO; Decimal)
        {
            Caption = 'IMPORTO_IMPONIBILE_CONVERTITO';
            DataClassification = CustomerContent;
        }
        field(25; DATA_INIZIO_COMPETENZA; DateTime)
        {
            Caption = 'DATA_INIZIO_COMPETENZA';
            DataClassification = CustomerContent;
        }
        field(26; DATA_FINE_COMPETENZA; DateTime)
        {
            Caption = 'DATA_FINE_COMPETENZA';
            DataClassification = CustomerContent;
        }
        field(27; COD_CDC; Text[30])
        {
            Caption = 'COD_CDC';
            DataClassification = CustomerContent;
        }
        field(28; COD_VOCE_ANALITICA; Text[30])
        {
            Caption = 'COD_VOCE_ANALITICA';
            DataClassification = CustomerContent;
        }
        field(29; DATA_SCADENZA; DateTime)
        {
            Caption = 'DATA_SCADENZA';
            DataClassification = CustomerContent;
        }
        field(30; COD_IVA; Text[30])
        {
            Caption = 'COD_IVA';
            DataClassification = CustomerContent;
        }
        field(31; DATA_DOCUMENTO_FORNITORE; DateTime)
        {
            Caption = 'DATA_DOCUMENTO_FORNITORE';
            DataClassification = CustomerContent;
        }
        field(32; NUMERO_DOCUMENTO_FORNITORE; Text[30])
        {
            Caption = 'NUMERO_DOCUMENTO_FORNITORE';
            DataClassification = CustomerContent;
        }
        field(33; SERIE_DOCUMENTO_FORNITORE; Text[5])
        {
            Caption = 'SERIE_DOCUMENTO_FORNITORE';
            DataClassification = CustomerContent;
        }
        field(34; COD_REGISTRO_CONTABILE; Text[30])
        {
            Caption = 'COD_REGISTRO_CONTABILE';
            DataClassification = CustomerContent;
        }
        field(35; NUMERO_PROTOCOLLO; Decimal)
        {
            Caption = 'NUMERO_PROTOCOLLO';
            DataClassification = CustomerContent;
        }
        field(36; COD_SOGGETTO_ESTERNO; Text[30])
        {
            Caption = 'COD_SOGGETTO_ESTERNO';
            DataClassification = CustomerContent;
        }
        field(37; COD_MODALITA_PAGAMENTO; Text[30])
        {
            Caption = 'COD_MODALITA_PAGAMENTO';
            DataClassification = CustomerContent;
        }
        field(38; IBAN_BANCA_APPOGGIO; Text[31])
        {
            Caption = 'IBAN_BANCA_APPOGGIO';
            DataClassification = CustomerContent;
        }
        field(39; IBAN_SOGGETTO_ESTERNO; Text[31])
        {
            Caption = 'IBAN_SOGGETTO_ESTERNO';
            DataClassification = CustomerContent;
        }
        field(40; BIC_SWIFT_SOGGETTO_ESTERNO; Text[11])
        {
            Caption = 'BIC_SWIFT_SOGGETTO_ESTERNO';
            DataClassification = CustomerContent;
        }
        field(41; BARCODE; Text[30])
        {
            Caption = 'BARCODE';
            DataClassification = CustomerContent;
        }
        field(42; NOTE; Text[1000])
        {
            Caption = 'NOTE';
            DataClassification = CustomerContent;
        }
        field(43; ATTIVO_PASSIVO; Text[1])
        {
            Caption = 'ATTIVO_PASSIVO';
            DataClassification = CustomerContent;
        }
        field(44; CODICE_CONTRATTO; Text[30])
        {
            Caption = 'CODICE_CONTRATTO';
            DataClassification = CustomerContent;
        }
        field(45; TIPO_RATEO_RISCONTO; Text[12])
        {
            Caption = 'TIPO_RATEO_RISCONTO';
            DataClassification = CustomerContent;
        }
        field(46; OID_CONTRATTO; Text[36])
        {
            Caption = 'OID_CONTRATTO';
            DataClassification = CustomerContent;
        }
        field(47; OID_SCADENZARIO_ECONOMICO; Text[36])
        {
            Caption = 'OID_SCADENZARIO_ECONOMICO';
            DataClassification = CustomerContent;
        }
        field(48; OID_SCADENZARIO_ATTIVITA; Text[36])
        {
            Caption = 'OID_SCADENZARIO_ATTIVITA';
            DataClassification = CustomerContent;
        }
        field(49; COD_DOCUMENTO_CONTABILE; Text[30])
        {
            Caption = 'COD_DOCUMENTO_CONTABILE';
            DataClassification = CustomerContent;
        }
        field(50; COD_MANDATO_PAGAMENTO; Text[30])
        {
            Caption = 'COD_MANDATO_PAGAMENTO';
            DataClassification = CustomerContent;
        }
        field(51; OID_RATEO_RISCONTO_RIGHE; Text[36])
        {
            Caption = 'OID_RATEO_RISCONTO_RIGHE';
            DataClassification = CustomerContent;
        }
        field(52; OID_RATA_IMPOSTA_COMUNALE; Text[36])
        {
            Caption = 'OID_RATA_IMPOSTA_COMUNALE';
            DataClassification = CustomerContent;
        }
        field(53; OID_DETT_RATA_IMPOSTA_COMUNALE; Text[36])
        {
            Caption = 'OID_DETT_RATA_IMPOSTA_COMUNALE';
            DataClassification = CustomerContent;
        }
        field(54; COD_AZIENDA_CONTABILE; Text[30])
        {
            Caption = 'COD_AZIENDA_CONTABILE';
            DataClassification = CustomerContent;
        }
        field(55; COD_IVA_CONTABILE; Text[30])
        {
            Caption = 'COD_IVA_CONTABILE';
            DataClassification = CustomerContent;
        }
        field(56; COD_SOGGETTO_ESTERNO_CONTABILE; Text[30])
        {
            Caption = 'COD_SOGGETTO_ESTERNO_CONTABILE';
            DataClassification = CustomerContent;
        }
        field(57; COD_MOD_PAGAMENTO_CONTABILE; Text[30])
        {
            Caption = 'COD_MOD_PAGAMENTO_CONTABILE';
            DataClassification = CustomerContent;
        }
        field(58; COD_CDC_CONTABILE; Text[30])
        {
            Caption = 'COD_CDC_CONTABILE';
            DataClassification = CustomerContent;
        }
        field(59; STATO_FLUSSO_CONTABILE; Text[10])
        {
            Caption = 'STATO_FLUSSO_CONTABILE';
            DataClassification = CustomerContent;
        }
        field(60; DATA_ESPORTAZIONE; DateTime)
        {
            Caption = 'DATA_ESPORTAZIONE';
            DataClassification = CustomerContent;
        }
        field(61; DATA_IMPORTAZIONE; DateTime)
        {
            Caption = 'DATA_IMPORTAZIONE';
            DataClassification = CustomerContent;
        }
        field(62; NOTE_IMPORTAZIONE; Text[1000])
        {
            Caption = 'NOTE_IMPORTAZIONE';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
