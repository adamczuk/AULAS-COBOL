       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA_EX13.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PRODUTOS ASSIGN TO
               'C:\ARQUIVOS\PRODUTOS.TXT'
           ORGANIZATION IS INDEXED
           ACCESS IS RANDOM
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
       77 WS-FS        PIC 99.
       77 CONTROLE     PIC A VALUE SPACES.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "CADASTRO DE PRODUTOS"
            SET WS-FS TO 0.

            OPEN I-O PRODUTOS

            IF WS-FS EQUAL 35
                OPEN OUTPUT PRODUTOS
            END-IF

            IF WS-FS EQUAL ZEROS
                PERFORM UNTIL CONTROLE EQUALS 'N'
                    DISPLAY "INFORME O CODIGO DO PRODUTO"
                    ACCEPT COD-PRODUTO
                    DISPLAY "INFORME O NOME DO PRODUTO"
                    ACCEPT NOME-PRODUTO

                        DISPLAY "INFORME A QUANTIDADE DO PRODUTO"
                    ACCEPT ESTOQUE-PRODUTO

                        WRITE REG-PRODUTO

                        IF WS-FS NOT EQUAL ZEROS
                        DISPLAY 'NAO FOI POSSIVEL GRAVAR O REGISTRO'
                        DISPLAY 'FILE STATUS: ' WS-FS
                   ELSE
                       DISPLAY "REGISTRO GRAVADO COM SUCESSO!"
                   END-IF


                   DISPLAY "DESEJA GRAVAR UM NOVO PRODUTO?"
                   DISPLAY "DIGITE N PARA NAO"
                   ACCEPT CONTROLE
               END-PERFORM
            ELSE
                DISPLAY "ERRO AO CRIAR ARQUIVO"
                DISPLAY "FILE STATUS: " WS-FS
            END-IF
            CLOSE PRODUTOS

            STOP RUN.
       END PROGRAM PROGRAMA_EX13.
