      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. AULA05-EXEMPLO01.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-DIAS.
           03 FILLER           PIC X(015) VALUE "DOMINGO".
           03 FILLER           PIC X(015) VALUE "SEGUNDA-FEIRA".
           03 FILLER           PIC X(015) VALUE "TERCA-FEIRA".
           03 FILLER           PIC X(015) VALUE "QUARTA-FEIRA".
           03 FILLER           PIC X(015) VALUE "QUINTA-FEIRA".
           03 FILLER           PIC X(015) VALUE "SEXTA-FEIRA".
           03 FILLER           PIC X(015) VALUE "SABADO".
       01 FILLER REDEFINES WS-DIAS.
           03 WS-DIA          PIC X(015) OCCURS 7.
           03 WS-TEMPERATURA   PIC S9(013)V99 OCCURS 7.
       77 WS-MEDIA             PIC 999 VALUE ZERO.
       77 WS-QTDE-DIA-ACIMA    PIC 999 VALUE ZERO.
       77 WS-QTDE-DIA-ABAIXO   PIC 999 VALUE ZERO.

       77 WS-CONTROLE          PIC 9 VALUE 1.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           INITIALISE WS-MEDIA WS-QTDE-DIA-ACIMA WS-QTDE-DIA-ABAIXO

           PERFORM UNTIL WS-CONTROLE EQUALS 8
               DISPLAY " Digite a temperatura da " WS-DIA(WS-CONTROLE)
               ACCEPT WS-TEMPERATURA(WS-CONTROLE)
               ADD WS-TEMPERATURA(WS-CONTROLE) TO WS-MEDIA
               ADD 1 TO WS-CONTROLE
           END-PERFORM

           DIVIDE 7 INTO WS-MEDIA ROUNDED

           MOVE 1 TO WS-CONTROLE

           PERFORM UNTIL WS-CONTROLE EQUALS 8
               IF WS-TEMPERATURA(WS-CONTROLE) GREATER WS-MEDIA
                   ADD 1 TO WS-QTDE-DIA-ACIMA
               END-IF

               IF WS-TEMPERATURA(WS-CONTROLE) LESS WS-MEDIA
                   ADD 1 TO WS-QTDE-DIA-ABAIXO
               END-IF
               ADD 1 TO WS-CONTROLE
           END-PERFORM

           DISPLAY "A media da temperatura e " WS-MEDIA
           DISPLAY "Dias acima da media: " WS-QTDE-DIA-ACIMA
           DISPLAY "Dias abaixo da media: " WS-QTDE-DIA-ABAIXO

           STOP RUN.
       END PROGRAM AULA05-EXEMPLO01.
