       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA_EX02.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SPECIAL-NAMES.
               DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-VALORES.
           05 WS-NUM1      PIC S9(06)V99.
           05 WS-NUM2      PIC S9(06)V99.
           05 WS-RESUL     PIC S9(09)V99.
           05 WS-MASCARA   PIC -ZZ.ZZ9,99.
           05 WS-OP        PIC X(1).
       PROCEDURE DIVISION.

       INITIALISE WS-VALORES

       PERFORM P001-PRINCIPAL.

       STOP RUN.

       P001-PRINCIPAL.

            DISPLAY "DIGITE A OPERACAO (+, -, * ou /) : "
            ACCEPT WS-OP


            DISPLAY "INSIRA O PRIMEIRO VALOR: "
            ACCEPT WS-NUM1

            DISPLAY "INSIRA O SEGUNDO VALOR: "
            ACCEPT WS-NUM2

            EVALUATE WS-OP

            WHEN "*"
               COMPUTE WS-RESUL = WS-NUM1 * WS-NUM2
            WHEN "-"
               COMPUTE WS-RESUL = WS-NUM1 - WS-NUM2
            WHEN "+"
               COMPUTE WS-RESUL = WS-NUM1 + WS-NUM2
            WHEN "/"
               COMPUTE WS-RESUL = WS-NUM1 / WS-NUM2
            END-EVALUATE

            MOVE WS-RESUL TO WS-MASCARA

            DISPLAY WS-NUM1 " " WS-OP " " WS-NUM2 " = " WS-MASCARA
           EXIT.


       END PROGRAM PROGRAMA_EX02.
