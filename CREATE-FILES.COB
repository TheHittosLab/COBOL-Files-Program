       IDENTIFICATION DIVISION.
       PROGRAM-ID. CREATE-FILES.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
       SELECT OPTIONAL EMPLEADOS-ARCHIVO
       ASSIGN TO "g:\cobol\empleados.dat"
       ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD EMPLEADOS-ARCHIVO.
           01 EMPLEADOS-REGISTRO.
               05 EMPLEADOS-ID PIC X(6).
               05 EMPLEADOS-NOMBRE PIC X(25).
               05 EMPLEADOS-APELLIDOS PIC X(35).
               05 EMPLEADOS-EDAD PIC X(3).
               05 EMPLEADOS-TELEFONO PIC X(9).
               05 EMPLEADOS-DIRECCION PIC X(35).

       WORKING-STORAGE SECTION.

       01  IDENTIFICADOR PIC X(36)
           VALUE "Introduce un ID del nuevo empleado: ".
       01  NOMBRE PIC X(33)
           VALUE "Introduce un nombre de empleado: ".
       01  APELLIDOS PIC X(25)
           VALUE "Introduce los apellidos: ".
       01  EDAD PIC X(19)
           VALUE "Introduce la edad: ".
       01  TELEFONO PIC X(33)
           VALUE "Introduce un número de teléfono: ".
       01  DIRECCION PIC X(25)
           VALUE "Introduce una dirección: ".

       01  SI-NO PIC X.
       01  ENTRADA PIC X.

       PROCEDURE DIVISION.
       MAIN-LOGIC SECTION.
       PROGRAM-BEGIN.

       PERFORM PROCEDIMIENTO-DE-APERTURA.
       MOVE "S" TO SI-NO.
       PERFORM AGREGAR-REGISTROS
       UNTIL SI-NO = "N".
       PERFORM PROCEDIMIENTO-DE-CIERRE.

       PROGRAM-DONE.
       STOP RUN.

       PROCEDIMIENTO-DE-APERTURA.
       OPEN EXTEND EMPLEADOS-ARCHIVO.

       PROCEDIMIENTO-DE-CIERRE.
       CLOSE EMPLEADOS-ARCHIVO.

       AGREGAR-REGISTROS.
       MOVE "N" TO ENTRADA.
       PERFORM OBTENER-CAMPOS
       UNTIL ENTRADA = "S".
       PERFORM ESCRIBIR-REGISTRO.
       PERFORM REINICIAR.

       OBTENER-CAMPOS.
       MOVE SPACE TO EMPLEADOS-REGISTRO.
       DISPLAY IDENTIFICADOR " ? ".
       ACCEPT EMPLEADOS-ID.
       DISPLAY NOMBRE " ? ".
       ACCEPT EMPLEADOS-NOMBRE.
       DISPLAY APELLIDOS " ? ".
       ACCEPT EMPLEADOS-APELLIDOS.
       DISPLAY EDAD " ? ".
       ACCEPT EMPLEADOS-EDAD.
       DISPLAY TELEFONO "?".
       ACCEPT EMPLEADOS-TELEFONO
       DISPLAY DIRECCION.
       ACCEPT EMPLEADOS-DIRECCION.
       PERFORM CONTINUAR.

       CONTINUAR.
       MOVE "S" TO ENTRADA.
       IF  EMPLEADOS-NOMBRE = SPACE
       MOVE "N" TO ENTRADA.

       ESCRIBIR-REGISTRO.
       WRITE EMPLEADOS-REGISTRO.

       REINICIAR.
       DISPLAY "¿Desea almacenar otro registro en la base de datos?".
       ACCEPT SI-NO.
       IF SI-NO = "s"
       MOVE "S" TO SI-NO.
       IF SI-NO NOT = "S"
       MOVE "N" TO SI-NO.

       END PROGRAM CREATE-FILES.
