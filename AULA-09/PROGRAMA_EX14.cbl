       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA_EX14.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PRODUTOS ASSIGN TO
               'C:\ARQUIVOS\PRODUTOS.TXT'
           ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC
           RECORD KEY IS COD-PRODUTO
           FILE STATUS IS WS-FS.
       DATA DIVISION.
       FILE SECTION.
       FD PRODUTOS.
           01 REG-PRODUTO.
               03 COD-PRODUTO          PIC 999.
               03 NOME-PRODUTO         PIC X(20).
               03 ESTOQUE-PRODUTO      PIC 9(09).
       WORKING-STORAGE SECTION.

           01 WS-PRODUTO.
               03 WS-COD-PRODUTO          PIC 999.
               03 WS-NOME-PRODUTO         PIC X(20).
               03 WS-ESTOQUE-PRODUTO      PIC 9(09).
       77 WS-FS        PIC 99 VALUE 0.
       77 WS-EOF       PIC 99 VALUE 0.
       77 WS-CONTADOR  PIC 99 VALUE 0.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            OPEN INPUT PRODUTOS

            DISPLAY "LISTAGEM DE PRODUTOS"

            PERFORM UNTIL WS-EOF EQUAL 1
               READ PRODUTOS INTO WS-PRODUTO
                   AT END
                       MOVE 1 TO WS-EOF
                   NOT AT END
                       DISPLAY ' COD PRODUTO ' WS-COD-PRODUTO
                       DISPLAY ' NOME PRODUTO ' WS-NOME-PRODUTO
                       DISPLAY ' QTDE EM ESTOQUE ' WS-ESTOQUE-PRODUTO
                       ADD 1 TO WS-CONTADOR
               END-READ
            END-PERFORM
            DISPLAY 'TOTAL DE REGISTRO LOCALIZADOS ' WS-CONTADOR
            CLOSE PRODUTOS

            STOP RUN.
       END PROGRAM PROGRAMA_EX14.
