
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX02-AULA04.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 COEFICIENTES.
               05 COEF-A           PIC S999.
               05 COEF-B           PIC S999.
               05 COEF-C           PIC S999.

           77 DELTA                PIC S999.
           77 RAIZ-1               PIC S999.
           77 RAIZ-2               PIC S999.

       PROCEDURE DIVISION.
           PERFORM 0000-MAIN THRU 0000-END-MAIN.
           STOP RUN.

           0000-MAIN.

               DISPLAY "INSERIR O COEFICIENTE A:"
               ACCEPT COEF-A

               IF COEF-A IS EQUAL TO 0
                   DISPLAY "COEF. A NAO PODE SER ZERO. TENTE NOVAMENTE"
                   PERFORM 0000-MAIN THRU 0000-END-MAIN

               ELSE
                   DISPLAY "INSERIR O COEFICIENTE B:"
                   ACCEPT COEF-B

                   DISPLAY "INSERIR O COEFICIENTE C:"
                   ACCEPT COEF-C

                   COMPUTE DELTA = COEF-B ** 2 - (4 * COEF-A * COEF-C)

                   IF DELTA IS LESS THAN 0
                       DISPLAY "DELTA < 0. EQUACAO SEM SOLUCAO REAL"
                   ELSE
                       PERFORM 1000-CALCULA-RAIZES THRU 1000-END-CALCULA
      -                 -RAIZES
                   END-IF
               END-IF.
           0000-END-MAIN.
               EXIT.

           1000-CALCULA-RAIZES.

               MULTIPLY -1 BY COEF-B
               MULTIPLY 2 BY COEF-A
               COMPUTE RAIZ-1 = (COEF-B + FUNCTION SQRT(DELTA)) / COEF-A

               COMPUTE RAIZ-2 = (COEF-B - FUNCTION SQRT(DELTA)) / COEF-A

                DISPLAY "RAIZ 1: " RAIZ-1
                DISPLAY "RAIZ 2: " RAIZ-2.
           1000-END-CALCULA-RAIZES.
               EXIT.
