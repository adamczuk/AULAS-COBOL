       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX03-AULA04.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-ESPACO            PIC S99.
       77 WS-TEMPO             PIC S99.
       77 WS-VELOCIDADE-MEDIA  PIC 99.

       77 WS-VARAUX            PIC S99.
       PROCEDURE DIVISION.
            PERFORM 0000-MAIN THRU 0000-END-MAIN
            STOP RUN.

       0000-MAIN.

           DISPLAY "DIGITE O ESPACO PERCORRIDO EM KM"
           PERFORM 1000-RECEBEVALOR THRU 1000-END-RECEBEVALOR
           MOVE WS-VARAUX TO WS-ESPACO

           DISPLAY "DIGITE O TEMPO PARA FINALIZAR O PERCURSO (EM HORAS)"
           PERFORM 1000-RECEBEVALOR THRU 1000-END-RECEBEVALOR
           MOVE WS-VARAUX TO WS-TEMPO

           COMPUTE WS-VELOCIDADE-MEDIA = WS-ESPACO / WS-TEMPO
           DISPLAY "VELOCIDADE MEDIA DO PERCURSO: " WS-VELOCIDADE-MEDIA
      -        " KM/H".
       0000-END-MAIN.
           EXIT.

       1000-RECEBEVALOR.
           ACCEPT WS-VARAUX
           IF WS-VARAUX IS LESS THAN 0
               DISPLAY "O VALOR NAO PODE SER NEGATIVO. INSIRA NOVAMENTE"
               PERFORM 1000-RECEBEVALOR THRU 1000-END-RECEBEVALOR
           END-IF.
       1000-END-RECEBEVALOR.
           EXIT.

       END PROGRAM EX03-AULA04.