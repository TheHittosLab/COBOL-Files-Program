     IDENTIFICATION DIVISION.
       PROGRAM-ID. OUTPUT-PHYSICAL.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
      Archivo f�sico en modo dinmico.
       FILE-CONTROL.
       COPY "PHYSICAL-FILE.cbl".

       DATA DIVISION.
       FILE SECTION.
      *Archivo l�gico.
       COPY "LOGICAL-FILE.cbl".
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.

       PROCEDIMIENTO-DE-APERTURA.
       OPEN OUTPUT EMPLEADOS-ARCHIVO.

       PROCEDIMIENTO-DE-CIERRE.
       CLOSE EMPLEADOS-ARCHIVO.
       DISPLAY "Se ha creado el archivo correctamente."
            STOP RUN.
       END PROGRAM OUTPUT-PHYSICAL.
