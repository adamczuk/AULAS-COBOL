       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX01-AULA04.
       ENVIRONMENT DIVISION.
           CONFIGURATION SECTION.
               SPECIAL-NAMES.
                   DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           77 WS-VALOR-COMPRA          PIC 9(5)V99.
           77 WS-NUMERO-PARCELAS       PIC 9.

           77 WS-TAXA-JUROS            PIC 9V99.
           77 WS-VALOR-FINAL           PIC 9(5)V99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "INSIRA O VALOR DA COMPRA: "
            ACCEPT WS-VALOR-COMPRA

            DISPLAY "QUAL O NUMERO DE PARCELAS?"
            ACCEPT WS-NUMERO-PARCELAS

            EVALUATE WS-NUMERO-PARCELAS
               WHEN 1
                   MOVE 0 TO WS-TAXA-JUROS
               WHEN 2
                   MOVE 0,02 TO WS-TAXA-JUROS
               WHEN 4
                   MOVE 0,05 TO WS-TAXA-JUROS
               WHEN 6
                   MOVE 0,1 TO WS-TAXA-JUROS
               WHEN 12
                   MOVE 0,18 TO WS-TAXA-JUROS
            END-EVALUATE

            COMPUTE WS-VALOR-FINAL = WS-VALOR-COMPRA + (WS-VALOR-COMPRA
      -    * WS-TAXA-JUROS)

            DISPLAY "VALOR A PAGAR: R$" WS-VALOR-FINAL

            STOP RUN.
       END PROGRAM EX01-AULA04.
