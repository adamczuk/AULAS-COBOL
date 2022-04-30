       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX04-AULA04.
       ENVIRONMENT DIVISION.
           CONFIGURATION SECTION.
               SPECIAL-NAMES.
                   DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-PRECO-COMPRA          PIC 9(5)V99.
       77 WS-QTDE-PARCELAS         PIC 99.
       77 WS-TAXA-JUROS            PIC 9V99.
       77 WS-VALOR-FINAL           PIC 9(5)V99.

       77 MASC-VALOR-FINAL         PIC ZZ.ZZZ,ZZ.

       PROCEDURE DIVISION.
            PERFORM 0000-MAIN THRU 0000-END-MAIN
            STOP RUN.

       0000-MAIN.
           DISPLAY "INSERIR O VALOR DA COMPRA:"
           ACCEPT WS-PRECO-COMPRA

           DISPLAY "INSERIR A QUANTIDADE DE PARCELAS"
           ACCEPT WS-QTDE-PARCELAS

           IF WS-QTDE-PARCELAS IS EQUAL TO 2 OR EQUAL TO 3
               MOVE 0,1 TO WS-TAXA-JUROS
           ELSE
               IF WS-QTDE-PARCELAS IS GREATER OR EQUAL TO 4
                   MOVE 0,2 TO WS-TAXA-JUROS
               END-IF
           END-IF

           MOVE WS-PRECO-COMPRA TO WS-VALOR-FINAL
           MULTIPLY WS-TAXA-JUROS BY WS-VALOR-FINAL
           ADD WS-PRECO-COMPRA TO WS-VALOR-FINAL

           MOVE WS-VALOR-FINAL TO MASC-VALOR-FINAL

           DISPLAY "VALOR FINAL DA COMPRA COM JUROS:"
           DISPLAY "R$ " MASC-VALOR-FINAL.
       0000-END-MAIN.
           EXIT.
       END PROGRAM EX04-AULA04.