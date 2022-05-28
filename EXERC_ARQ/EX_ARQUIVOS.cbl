       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX_ARQUIVOS.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT ALUNOS ASSIGN TO 'C:\ARQUIVOS\ALUNOS.TXT'
       ORGANISATION IS SEQUENTIAL.

       SELECT ALUNOS2021 ASSIGN TO 'C:\ARQUIVOS\ALUNOS2021.TXT'
       ORGANISATION IS SEQUENTIAL
       ACCESS MODE IS SEQUENTIAL
       FILE STATUS IS WS-FS.

       DATA DIVISION.
       FILE SECTION.

       FD ALUNOS.
       01 ALUNOS-FILE.
           03  RGM-ALUNO        PIC 9(005).
           03  NOME-ALUNO       PIC A(020).

       FD ALUNOS2021.
       01 FD-ALUNOS-FILE.
           03  FD-RGM-ALUNO        PIC 9(005).
           03  FD-NOME-ALUNO       PIC A(020).
           03  FD-N1               PIC 99V99.
           03  FD-N2               PIC 99V99.
           03  FD-MEDIA-ALUNO      PIC 99V99.
           03  FD-STATUS-ALUNO     PIC A(10).

       WORKING-STORAGE SECTION.

       01 WS-ALUNOS-FILE.
           03  WS-RGM-ALUNO        PIC 9(005).
           03  WS-NOME-ALUNO       PIC A(020).
           03  WS-N1               PIC 99V99.
           03  WS-N2               PIC 99V99.
           03  WS-MEDIA-ALUNO      PIC 99V99.
           03  WS-STATUS-ALUNO     PIC A(10).

       77 ARQ-STATUS       PIC A.
       77 WS-FS            PIC 99  VALUE 0.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           OPEN INPUT ALUNOS.

           OPEN EXTEND ALUNOS2021
           IF WS-FS EQUAL 35 THEN
               OPEN OUTPUT ALUNOS2021
           END-IF

           IF WS-FS EQUAL ZEROES
               PERFORM 1000-RECEBER-DADOS
               MOVE WS-ALUNOS-FILE TO FD-ALUNOS-FILE
               WRITE FD-ALUNOS-FILE
           END-IF
           CLOSE ALUNOS.
           CLOSE ALUNOS2021.
            STOP RUN.

       1000-RECEBER-DADOS.
           PERFORM UNTIL ARQ-STATUS EQUALS 'F'
               READ ALUNOS INTO WS-ALUNOS-FILE
                   AT END MOVE 'F' TO ARQ-STATUS
                   NOT AT END
                       DISPLAY "ALUNO: "WS-RGM-ALUNO " - " WS-NOME-ALUNO
                       DISPLAY "INSERIR N1: "
                       ACCEPT WS-N1
                       DISPLAY "INSERIR N2: "
                       ACCEPT WS-N2
                       COMPUTE WS-MEDIA-ALUNO = (WS-N1 + WS-N2) / 2
                       IF(WS-MEDIA-ALUNO) >= 6
                           MOVE 'APROVADO' TO WS-STATUS-ALUNO
                       ELSE
                           MOVE 'REPROVADO' TO WS-STATUS-ALUNO
                       END-IF


               END-READ
           END-PERFORM
       EXIT.
       END PROGRAM EX_ARQUIVOS.
