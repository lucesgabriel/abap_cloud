CLASS zcl_generator_empl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_generator_empl IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " 1. Declarar datos a insertar
    DATA: lt_employees TYPE TABLE OF zdb_gluces_empl2.

    " 2. Llenar con datos de prueba
    " Asegúrate que los campos coincidan con tu tabla ZDB_GLUCES_EMPL
    lt_employees = VALUE #(
        ( emplid = '1004' fname = 'Laura'    lname = 'Vega'      gender = 'F' designation = 'Consultor SD' )
        ( emplid = '1005' fname = 'Miguel'   lname = 'Diaz'      gender = 'M' designation = 'Consultor FI' )
        ( emplid = '1006' fname = 'Elena'    lname = 'Torres'    gender = 'F' designation = 'Consultor CO' )
        ( emplid = '1007' fname = 'David'    lname = 'Morales'   gender = 'M' designation = 'Basis Admin' )
        ( emplid = '1008' fname = 'Carmen'   lname = 'Ortega'    gender = 'F' designation = 'HR Specialist' )
        ( emplid = '1009' fname = 'Javier'   lname = 'Romero'    gender = 'M' designation = 'Desarrollador Fiori' )
        ( emplid = '1010' fname = 'Paula'    lname = 'Navarro'   gender = 'F' designation = 'Scrum Master' )
        ( emplid = '1011' fname = 'Diego'    lname = 'Flores'    gender = 'M' designation = 'Consultor MM' )
        ( emplid = '1012' fname = 'Lucia'    lname = 'Gil'       gender = 'F' designation = 'Tester QA' )
        ( emplid = '1013' fname = 'Roberto'  lname = 'Serrano'   gender = 'M' designation = 'Arquitecto Cloud' )
        ( emplid = '1014' fname = 'Isabel'   lname = 'Molina'    gender = 'F' designation = 'Consultor PP' )
        ( emplid = '1015' fname = 'Alberto'  lname = 'Blanco'    gender = 'M' designation = 'Security Analyst' )
        ( emplid = '1016' fname = 'Raquel'   lname = 'Suarez'    gender = 'F' designation = 'Data Analyst' )
        ( emplid = '1017' fname = 'Fernando' lname = 'Marin'     gender = 'M' designation = 'Consultor QM' )
        ( emplid = '1018' fname = 'Patricia' lname = 'Iglesias'  gender = 'F' designation = 'Product Owner' )
        ( emplid = '1019' fname = 'Ricardo'  lname = 'Medina'    gender = 'M' designation = 'Desarrollador ABAP' )
        ( emplid = '1020' fname = 'Silvia'   lname = 'Garrido'   gender = 'F' designation = 'UX Designer' )
        ( emplid = '1021' fname = 'Manuel'   lname = 'Cortes'    gender = 'M' designation = 'Consultor WM' )
        ( emplid = '1022' fname = 'Teresa'   lname = 'Lozano'    gender = 'F' designation = 'Consultor PM' )
        ( emplid = '1023' fname = 'Oscar'    lname = 'Guerrero'  gender = 'M' designation = 'Basis Junior' )
        ( emplid = '1024' fname = 'Beatriz'  lname = 'Cano'      gender = 'F' designation = 'Consultor TRM' )
        ( emplid = '1025' fname = 'Ruben'    lname = 'Prieto'    gender = 'M' designation = 'DevOps Engineer' )
        ( emplid = '1026' fname = 'Lorena'   lname = 'Mendez'    gender = 'F' designation = 'Soporte Tecnico' )
        ( emplid = '1027' fname = 'Victor'   lname = 'Calvo'     gender = 'M' designation = 'Consultor EWM' )
        ( emplid = '1028' fname = 'Natalia'  lname = 'Gallego'   gender = 'F' designation = 'Consultor HCM' )
        ( emplid = '1029' fname = 'Andres'   lname = 'Vidal'     gender = 'M' designation = 'Desarrollador RAP' )
        ( emplid = '1030' fname = 'Clara'    lname = 'Cruz'      gender = 'F' designation = 'Consultor PS' )
        ( emplid = '1031' fname = 'Hugo'     lname = 'Cabrera'   gender = 'M' designation = 'Integration Specialist' )
        ( emplid = '1032' fname = 'Monica'   lname = 'Campos'    gender = 'F' designation = 'Consultor SAP' )
        ( emplid = '1033' fname = 'Emilio'   lname = 'Leon'      gender = 'M' designation = 'Project Manager' )
        ( emplid = '1034' fname = 'Rosa'     lname = 'Herrera'   gender = 'F' designation = 'Consultor FI-CA' )
        ( emplid = '1035' fname = 'Gabriel'  lname = 'Marquez'   gender = 'M' designation = 'Team Lead' )
        ( emplid = '1036' fname = 'Adriana'  lname = 'Peña'      gender = 'F' designation = 'Consultor CRM' )
        ( emplid = '1037' fname = 'Samuel'   lname = 'Fuentes'   gender = 'M' designation = 'Desarrollador Fullstack' )
        ( emplid = '1038' fname = 'Verónica' lname = 'Carrasco'  gender = 'F' designation = 'Consultor BW' )
     ).

    " 3. Borrar datos viejos (opcional, para no duplicar si corres esto 2 veces)
    DELETE FROM zdb_gluces_empl2.

    " 4. Insertar nuevos datos
    INSERT zdb_gluces_empl2 FROM TABLE @lt_employees.

    " 5. Mostrar resultado en consola
    IF sy-subrc = 0.
      out->write( |Se insertaron { sy-dbcnt } registros correctamente.| ).
    ELSE.
      out->write( 'Error al insertar datos.' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
