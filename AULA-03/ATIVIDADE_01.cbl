      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ATIVIDADE_01.
       ENVIRONMENT DIVISION.
           CONFIGURATION SECTION.
               SPECIAL-NAMES.
                   DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       77 NOME-ALUNO       PIC A(15).
       77 NOTA1            PIC 9V99.
       77 NOTA2            PIC 9V99.
       77 NOTA3            PIC 9V99.
       77 QTDE-FALTAS      PIC 99.
       77 MEDIA-NOTAS      PIC 99V99.

       77 VAR-AUX          PIC 9V99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           DISPLAY "DIGITE SEU NOME: "
           ACCEPT NOME-ALUNO


           PERFORM GET-NOTAS
           MOVE VAR-AUX TO NOTA1
           DISPLAY NOTA1

           PERFORM GET-NOTAS
           MOVE VAR-AUX TO NOTA2
           DISPLAY NOTA2

           DISPLAY "INSIRA SUA QUANTIDADE DE FALTAS "
           ACCEPT QTDE-FALTAS

           COMPUTE MEDIA-NOTAS = NOTA1 + NOTA2

           IF QTDE-FALTAS IS GREATER THAN 20
               IF MEDIA-NOTAS IS LESS THAN 6
                   DISPLAY "REPROVADO POR NOTA E FALTAS"
               ELSE
                   DISPLAY "REPROVADO POR FALTAS"
               END-IF
           ELSE
               IF MEDIA-NOTAS IS GREATER THAN 6
                   DISPLAY "APROVADO"
                   DISPLAY "NOTA FINAL: " MEDIA-NOTAS
               ELSE
                   IF NOTA1 IS LESS THAN 1 OR NOTA2 IS LESS THAN 1
                       DISPLAY "REPROVADO POR NOTA - NAO PODE FAZER P3"
                   ELSE
                       DISPLAY "INSIRA SUA NOTA DA P3"
                       ACCEPT NOTA3

                       IF NOTA1 IS GREATER THAN NOTA2
                           COMPUTE MEDIA-NOTAS = NOTA1 + NOTA3
                       ELSE
                           COMPUTE MEDIA-NOTAS = NOTA2 + NOTA3

                           IF MEDIA-NOTAS IS GREATER THAN 6
                               DISPLAY "APROVADO"
                               DISPLAY "NOTA FINAL: " MEDIA-NOTAS
                           ELSE
                               DISPLAY "REPROVADO POR NOTA"
                               DISPLAY "NOTA FINAL: " MEDIA-NOTAS
                           END-IF
                       END-IF
                   END-IF
               END-IF
           END-IF

            STOP RUN.

       GET-NOTAS.
           DISPLAY "INSIRA SUA NOTA "
           ACCEPT VAR-AUX


           IF VAR-AUX IS GREATER THAN 5,0
               DISPLAY "NOTA NAO PODE SER MAIOR QUE 5,0"
               PERFORM GET-NOTAS
           END-IF
       EXIT.
       END PROGRAM ATIVIDADE_01.
