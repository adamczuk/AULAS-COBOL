       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXEMPLO2_AULA07.

       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
               FILE-CONTROL.
                   SELECT CLIENTES ASSIGN TO 'C:\ARQUIVOS\CLIENTES.TXT'
                   ORGANIZATION IS SEQUENTIAL
                   ACCESS MODE IS SEQUENTIAL
                   FILE STATUS IS WS-FS.

       DATA DIVISION.
       FILE SECTION.

           FD CLIENTES.
           01 REG-CLIENTE.
               03 COD-CLIENTE      PIC 9(03).
               03 NOME-CLIENTE     PIC X(20).
               03 TELEFONE-CLIENTE PIC X(09).

       WORKING-STORAGE SECTION.
           77 WS-FS        PIC 99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "---- CADASTRO DE CLIENTE ----"
           OPEN EXTEND CLIENTES

           IF WS-FS EQUAL 35 THEN
               OPEN OUTPUT CLIENTES
           END-IF

           IF WS-FS EQUAL 0
               DISPLAY "INFORME O CODIGO DO CLIENTE"
               ACCEPT COD-CLIENTE
               DISPLAY "INFORME O NOME DO CLIENTE"
               ACCEPT NOME-CLIENTE
               DISPLAY "INFORME O TELEFONE DO CLIENTE"
               ACCEPT TELEFONE-CLIENTE

               WRITE REG-CLIENTE

               IF WS-FS NOT EQUAL ZEROS
                   DISPLAY "ERRO - NAO FOI POSSIVEL GRAVAR O REGISTRO"
                   DISPLAY "FILE STATUS: " WS-FS
               ELSE
                   DISPLAY "REGISTRO GRAVADO COM SUCESSO"
               END-IF

           ELSE
               DISPLAY "ERRO AO CRIAR ARQUIVO"
               DISPLAY "FILE STATUS: " WS-FS
           END-IF

           CLOSE CLIENTES
            STOP RUN.
       END PROGRAM EXEMPLO2_AULA07.
