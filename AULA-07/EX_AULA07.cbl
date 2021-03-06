       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX_AULA07.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FORNECEDORES ASSIGN TO "C:\ARQUIVOS\FORNECEDORES.TXT"
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS WS-FS.
       DATA DIVISION.
       FILE SECTION.
       FD FORNECEDORES.
       01 REG-FORNECEDORES.
           03 COD-FORNECEDOR       PIC 999.
           03 NOME-FORNECEDOR      PIC X(30).
           03 TELEFONE-FORNECEDOR  PIC 9(12).

       WORKING-STORAGE SECTION.

       77 WS-FS         PIC 99.
       77 WS-STATUS-EOF PIC A.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           MOVE 0 TO WS-FS

           OPEN EXTEND FORNECEDORES

           IF WS-FS = 35
                OPEN OUTPUT FORNECEDORES
           END-IF

           IF WS-FS = 0
               DISPLAY "INSERIR CODIGO DO FORNECEDOR"
               ACCEPT COD-FORNECEDOR
               DISPLAY "INSERIR NOME DO FORNECEDOR"
               ACCEPT NOME-FORNECEDOR
               DISPLAY "INSERIR TELEFONE DO FORNECEDOR"
               ACCEPT TELEFONE-FORNECEDOR

               WRITE REG-FORNECEDORES

               IF WS-FS IS NOT = 0
                   DISPLAY "NAO FOI POSSIVEL GRAVAR O REGISTRO"
                   DISPLAY "FILE STATUS" WS-FS
               ELSE
                   DISPLAY "REGISTRO GRAVADO COM SUCESSO"

               END-IF
           ELSE
               DISPLAY "ERRO AO CRIAR ARQUIVO"
               DISPLAY "FILE STATUS: " WS-FS
           END-IF

           CLOSE FORNECEDORES

           OPEN INPUT FORNECEDORES
           MOVE SPACES TO REG-FORNECEDORES
           PERFORM UNTIL WS-STATUS-EOF = 'F'
               READ FORNECEDORES INTO REG-FORNECEDORES
                   AT END MOVE 'F' TO WS-STATUS-EOF
               NOT AT END
                   DISPLAY COD-FORNECEDOR " - " NOME-FORNECEDOR " - " TE
      -             LEFONE-FORNECEDOR
               END-READ
           END-PERFORM.
           CLOSE FORNECEDORES
           STOP RUN.
       END PROGRAM EX_AULA07.
