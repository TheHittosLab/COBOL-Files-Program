     IDENTIFICATION DIVISION.
       PROGRAM-ID. OUTPUT-PHYSICAL.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
      *Archivo físico en modo dinámico.
       FILE-CONTROL.
       COPY "PHYSICAL-FILE.cbl".

       DATA DIVISION.
       FILE SECTION.
      *Archivo lógico.
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
