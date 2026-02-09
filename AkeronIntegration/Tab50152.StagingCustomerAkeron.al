table 50152 "Staging Customer Akeron"
{
    Caption = 'Staging Customer Akeron';
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
        field(5; "File Nome"; Text[100])
        {
            Caption = 'File Nome';
            DataClassification = CustomerContent;
        }
        field(6; COD_SOGGETTO; Code[30])
        {
            Caption = 'COD_SOGGETTO';
            DataClassification = CustomerContent;
        }
        field(7; RAGIONE_SOCIALE; Text[250])
        {
            Caption = 'RAGIONE_SOCIALE';
            DataClassification = CustomerContent;
        }
        field(8; CLIENTE_FORNITORE; Code[1])
        {
            Caption = 'CLIENTE_FORNITORE';
            DataClassification = CustomerContent;
        }
        field(9; FLAG_SOGGETTO_IVA; Boolean)
        {
            Caption = 'FLAG_SOGGETTO_IVA';
            DataClassification = CustomerContent;
        }
        field(10; PARTITA_IVA; Text[20])
        {
            Caption = 'PARTITA_IVA';
            DataClassification = CustomerContent;
        }
        field(11; CODICE_FISCALE; Text[20])
        {
            Caption = 'CODICE_FISCALE';
            DataClassification = CustomerContent;
        }
        field(12; INDIRIZZO_SEDE_LEGALE; Text[250])
        {
            Caption = 'INDIRIZZO_SEDE_LEGALE';
            DataClassification = CustomerContent;
        }
        field(13; CAP_SEDE_LEGALE; Code[20])
        {
            Caption = 'CAP_SEDE_LEGALE';
            DataClassification = CustomerContent;
        }
        field(14; LOCALITA_SEDE_LEGALE; Text[250])
        {
            Caption = 'LOCALITA_SEDE_LEGALE';
            DataClassification = CustomerContent;
        }
        field(15; COD_COMUNE_SEDE_LEGALE; Text[30])
        {
            Caption = 'COD_COMUNE_SEDE_LEGALE';
            DataClassification = CustomerContent;
        }
        field(16; INDIRIZZO_SPEDIZIONE; Text[250])
        {
            Caption = 'INDIRIZZO_SPEDIZIONE';
            DataClassification = CustomerContent;
        }
        field(17; CAP_SPEDIZIONE; Code[20])
        {
            Caption = 'CAP_SPEDIZIONE';
            DataClassification = CustomerContent;
        }
        field(18; LOCALITA_SPEDIZIONE; Text[250])
        {
            Caption = 'LOCALITA_SPEDIZIONE';
            DataClassification = CustomerContent;
        }
        field(19; COD_COMUNE_SPEDIZIONE; Code[30])
        {
            Caption = 'COD_COMUNE_SPEDIZIONE';
            DataClassification = CustomerContent;
        }
        field(20; SPEDIZIONE_PRESSO; Text[250])
        {
            Caption = 'SPEDIZIONE_PRESSO';
            DataClassification = CustomerContent;
        }
        field(21; COD_MODALITA_PAGAMENTO; Code[30])
        {
            Caption = 'COD_MODALITA_PAGAMENTO';
            DataClassification = CustomerContent;
        }
        field(22; IBAN; Text[50])
        {
            Caption = 'IBAN';
            DataClassification = CustomerContent;
        }
        field(23; BIC_SWIFT; Text[50])
        {
            Caption = 'BIC_SWIFT';
            DataClassification = CustomerContent;
        }
        field(24; DESC_BANCA; Text[250])
        {
            Caption = 'DESC_BANCA';
            DataClassification = CustomerContent;
        }
        field(25; FLAG_PERSONA_FISICA; Boolean)
        {
            Caption = 'FLAG_PERSONA_FISICA';
            DataClassification = CustomerContent;
        }
        field(26; PF_NOME; Text[100])
        {
            Caption = 'PF_NOME';
            DataClassification = CustomerContent;
        }
        field(27; PF_COGNOME; Text[100])
        {
            Caption = 'PF_COGNOME';
            DataClassification = CustomerContent;
        }
        field(28; PF_SESSO; Boolean)
        {
            Caption = 'PF_SESSO';
            DataClassification = CustomerContent;
        }
        field(29; PF_DATA_NASCITA; Date)
        {
            Caption = 'PF_DATA_NASCITA';
            DataClassification = CustomerContent;
        }
        field(30; PF_LUOGO_NASCITA; Text[250])
        {
            Caption = 'PF_LUOGO_NASCITA';
            DataClassification = CustomerContent;
        }
        field(31; FLAG_OBSOLETO; Boolean)
        {
            Caption = 'FLAG_OBSOLETO';
            DataClassification = CustomerContent;
        }
        field(32; CODICE_SDI; Code[10])
        {
            Caption = 'CODICE_SDI';
            DataClassification = CustomerContent;
        }
        field(33; COD_AZIENDA_IC; Code[30])
        {
            Caption = 'COD_AZIENDA_IC';
            DataClassification = CustomerContent;
        }
        field(34; COD_TIPO_SOGGETTO; Code[30])
        {
            Caption = 'COD_TIPO_SOGGETTO';
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
