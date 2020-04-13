       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAPITULO-27.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
      *Archivo físico en modo dinámico.
       SELECT EMPLEADOS-ARCHIVO
       ASSIGN TO "empleados.dat"
       ORGANIZATION IS INDEXED
       RECORD KEY IS EMPLEADOS-ID
       ACCESS MODE IS DYNAMIC.

       DATA DIVISION.
       FILE SECTION.
      *Archivo lógico.
       FD EMPLEADOS-ARCHIVO.
       01 EMPLEADOS-REGISTRO.
           05 EMPLEADOS-ID PIC 9(6).
           05 EMPLEADOS-NOMBRE PIC X(25).
           05 EMPLEADOS-APELLIDOS PIC X(35).
           05 EMPLEADOS-EDAD PIC 9(3).
           05 EMPLEADOS-TELEFONO PIC X(9).
           05 EMPLEADOS-DIRECCION PIC X(35).

       WORKING-STORAGE SECTION.
       77  LEE-TODO             PIC X.
       PROCEDURE DIVISION.
       EMPIEZA-PROGRAMA.
       PERFORM PROCEDIMIENTO-DE-APERTURA.
       MOVE "0" TO LEE-TODO.
       PERFORM LEE-SIGUIENTE-REGISTRO.
         IF LEE-TODO = "1"
           DISPLAY "No se encontraron registros en el archivo."
             ELSE
               PERFORM MUESTRA-CAMPOS
               UNTIL LEE-TODO = "1".
               PERFORM PROCEDIMIENTO-DE-CIERRE.
               FINALIZA-PROGRAMA.
               STOP RUN.
               PROCEDIMIENTO-DE-APERTURA.
               OPEN I-O EMPLEADOS-ARCHIVO.
               PROCEDIMIENTO-DE-CIERRE.
               CLOSE EMPLEADOS-ARCHIVO.
               MUESTRA-CAMPOS.
               DISPLAY "ID: " EMPLEADOS-ID
             " Nombre: " EMPLEADOS-NOMBRE " Apellidos: "
             EMPLEADOS-APELLIDOS " Edad: " EMPLEADOS-EDAD " Telefono: "
             EMPLEADOS-TELEFONO " Direccion: " EMPLEADOS-TELEFONO.

             PERFORM LEE-SIGUIENTE-REGISTRO.
             LEE-SIGUIENTE-REGISTRO.
             READ EMPLEADOS-ARCHIVO NEXT RECORD
             AT END MOVE "1" TO LEE-TODO.
       END PROGRAM CAPITULO-27.
