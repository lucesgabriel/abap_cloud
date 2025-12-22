CLASS zcl_generator_empl_full DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_generator_empl_full IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "============================================================
    " 1. EMPLOYEE - BASIC INFO (ZDB_GLUCES_EMPL)
    "============================================================
    DATA: lt_employees TYPE TABLE OF zdb_gluces_empl2.

    lt_employees = VALUE #(
        ( emplid = '1001' fname = 'Carlos'   lname = 'González'  gender = 'M' designation = 'Consultor MM' )
        ( emplid = '1002' fname = 'Ana'      lname = 'Martínez'  gender = 'F' designation = 'Consultor FI' )
        ( emplid = '1003' fname = 'Pedro'    lname = 'López'     gender = 'M' designation = 'Desarrollador ABAP' )
        ( emplid = '1004' fname = 'Laura'    lname = 'Vega'      gender = 'F' designation = 'Consultor SD' )
        ( emplid = '1005' fname = 'Miguel'   lname = 'Díaz'      gender = 'M' designation = 'Consultor FI' )
        ( emplid = '1006' fname = 'Elena'    lname = 'Torres'    gender = 'F' designation = 'Consultor CO' )
        ( emplid = '1007' fname = 'David'    lname = 'Morales'   gender = 'M' designation = 'Basis Admin' )
        ( emplid = '1008' fname = 'Carmen'   lname = 'Ortega'    gender = 'F' designation = 'HR Specialist' )
        ( emplid = '1009' fname = 'Javier'   lname = 'Romero'    gender = 'M' designation = 'Desarrollador Fiori' )
        ( emplid = '1010' fname = 'Paula'    lname = 'Navarro'   gender = 'F' designation = 'Scrum Master' )
        ( emplid = '1011' fname = 'Diego'    lname = 'Flores'    gender = 'M' designation = 'Consultor MM' )
        ( emplid = '1012' fname = 'Lucía'    lname = 'Gil'       gender = 'F' designation = 'Tester QA' )
        ( emplid = '1013' fname = 'Roberto'  lname = 'Serrano'   gender = 'M' designation = 'Arquitecto Cloud' )
        ( emplid = '1014' fname = 'Isabel'   lname = 'Molina'    gender = 'F' designation = 'Consultor PP' )
        ( emplid = '1015' fname = 'Alberto'  lname = 'Blanco'    gender = 'M' designation = 'Security Analyst' )
        ( emplid = '1016' fname = 'Raquel'   lname = 'Suárez'    gender = 'F' designation = 'Data Analyst' )
        ( emplid = '1017' fname = 'Fernando' lname = 'Marín'     gender = 'M' designation = 'Consultor QM' )
        ( emplid = '1018' fname = 'Patricia' lname = 'Iglesias'  gender = 'F' designation = 'Product Owner' )
        ( emplid = '1019' fname = 'Ricardo'  lname = 'Medina'    gender = 'M' designation = 'Desarrollador ABAP' )
        ( emplid = '1020' fname = 'Silvia'   lname = 'Garrido'   gender = 'F' designation = 'UX Designer' )
     ).

    "============================================================
    " 2. EMPLOYEE - CONTACT INFO (ZDB_GLUCES_CONT)
    "============================================================
    DATA: lt_contacts TYPE TABLE OF zdb_gluces_cont2.

    lt_contacts = VALUE #(
        ( emplid = '1001' phone_num = '9561234567' alt_phone_num = '9567654321' email_id = 'carlos.gonzalez@empresa.cl'  alt_email_id = 'cgonzalez@gmail.com' )
        ( emplid = '1002' phone_num = '9562345678' alt_phone_num = '9568765432' email_id = 'ana.martinez@empresa.cl'     alt_email_id = 'amartinez@gmail.com' )
        ( emplid = '1003' phone_num = '9563456789' alt_phone_num = '9569876543' email_id = 'pedro.lopez@empresa.cl'      alt_email_id = 'plopez@gmail.com' )
        ( emplid = '1004' phone_num = '9564567890' alt_phone_num = '9560987654' email_id = 'laura.vega@empresa.cl'       alt_email_id = 'lvega@gmail.com' )
        ( emplid = '1005' phone_num = '9565678901' alt_phone_num = '9561098765' email_id = 'miguel.diaz@empresa.cl'      alt_email_id = 'mdiaz@gmail.com' )
        ( emplid = '1006' phone_num = '9566789012' alt_phone_num = '9562109876' email_id = 'elena.torres@empresa.cl'     alt_email_id = 'etorres@gmail.com' )
        ( emplid = '1007' phone_num = '9567890123' alt_phone_num = '9563210987' email_id = 'david.morales@empresa.cl'    alt_email_id = 'dmorales@gmail.com' )
        ( emplid = '1008' phone_num = '9568901234' alt_phone_num = '9564321098' email_id = 'carmen.ortega@empresa.cl'    alt_email_id = 'cortega@gmail.com' )
        ( emplid = '1009' phone_num = '9569012345' alt_phone_num = '9565432109' email_id = 'javier.romero@empresa.cl'    alt_email_id = 'jromero@gmail.com' )
        ( emplid = '1010' phone_num = '9560123456' alt_phone_num = '9566543210' email_id = 'paula.navarro@empresa.cl'    alt_email_id = 'pnavarro@gmail.com' )
        ( emplid = '1011' phone_num = '9571234567' alt_phone_num = '9577654321' email_id = 'diego.flores@empresa.cl'     alt_email_id = 'dflores@gmail.com' )
        ( emplid = '1012' phone_num = '9572345678' alt_phone_num = '9578765432' email_id = 'lucia.gil@empresa.cl'        alt_email_id = 'lgil@gmail.com' )
        ( emplid = '1013' phone_num = '9573456789' alt_phone_num = '9579876543' email_id = 'roberto.serrano@empresa.cl'  alt_email_id = 'rserrano@gmail.com' )
        ( emplid = '1014' phone_num = '9574567890' alt_phone_num = '9570987654' email_id = 'isabel.molina@empresa.cl'    alt_email_id = 'imolina@gmail.com' )
        ( emplid = '1015' phone_num = '9575678901' alt_phone_num = '9571098765' email_id = 'alberto.blanco@empresa.cl'   alt_email_id = 'ablanco@gmail.com' )
        ( emplid = '1016' phone_num = '9576789012' alt_phone_num = '9572109876' email_id = 'raquel.suarez@empresa.cl'    alt_email_id = 'rsuarez@gmail.com' )
        ( emplid = '1017' phone_num = '9577890123' alt_phone_num = '9573210987' email_id = 'fernando.marin@empresa.cl'   alt_email_id = 'fmarin@gmail.com' )
        ( emplid = '1018' phone_num = '9578901234' alt_phone_num = '9574321098' email_id = 'patricia.iglesias@empresa.cl' alt_email_id = 'piglesias@gmail.com' )
        ( emplid = '1019' phone_num = '9579012345' alt_phone_num = '9575432109' email_id = 'ricardo.medina@empresa.cl'   alt_email_id = 'rmedina@gmail.com' )
        ( emplid = '1020' phone_num = '9570123456' alt_phone_num = '9576543210' email_id = 'silvia.garrido@empresa.cl'   alt_email_id = 'sgarrido@gmail.com' )
     ).

    "============================================================
    " 3. EMPLOYEE - ADDRESS INFO (ZDB_GLUCES_ADDR)
    "============================================================
    DATA: lt_addresses TYPE TABLE OF zdb_gluces_addr2.

    lt_addresses = VALUE #(
        ( emplid = '1001' street = 'Av Norte'   city = 'Santiago'    country = 'Chile' )
        ( emplid = '1002' street = 'Calle Sur'  city = 'Valparaíso'  country = 'Chile' )
        ( emplid = '1003' street = 'Pasaje Est' city = 'Concepción'  country = 'Chile' )
        ( emplid = '1004' street = 'Av Oeste'   city = 'Antofagasta' country = 'Chile' )
        ( emplid = '1005' street = 'Calle Cent' city = 'La Serena'   country = 'Chile' )
        ( emplid = '1006' street = 'Av Princip' city = 'Temuco'      country = 'Chile' )
        ( emplid = '1007' street = 'Paseo Mar'  city = 'Viña Mar'    country = 'Chile' )
        ( emplid = '1008' street = 'Calle Luna' city = 'Rancagua'    country = 'Chile' )
        ( emplid = '1009' street = 'Av Sol'     city = 'Talca'       country = 'Chile' )
        ( emplid = '1010' street = 'Calle Rio'  city = 'Chillán'     country = 'Chile' )
        ( emplid = '1011' street = 'Av Lago'    city = 'Puerto Mont' country = 'Chile' )
        ( emplid = '1012' street = 'Pasaje Nor' city = 'Iquique'     country = 'Chile' )
        ( emplid = '1013' street = 'Calle Flor' city = 'Arica'       country = 'Chile' )
        ( emplid = '1014' street = 'Av Jardín'  city = 'Copiapó'     country = 'Chile' )
        ( emplid = '1015' street = 'Calle Mont' city = 'Coquimbo'    country = 'Chile' )
        ( emplid = '1016' street = 'Paseo Bosq' city = 'Osorno'      country = 'Chile' )
        ( emplid = '1017' street = 'Av Parque'  city = 'Valdivia'    country = 'Chile' )
        ( emplid = '1018' street = 'Calle Prad' city = 'Los Ángeles' country = 'Chile' )
        ( emplid = '1019' street = 'Av Colina'  city = 'Curicó'      country = 'Chile' )
        ( emplid = '1020' street = 'Pasaje Val' city = 'Linares'     country = 'Chile' )
     ).

    "============================================================
    " 4. EMPLOYEE - PROJECT INFO (ZDB_GLUCES_PROJ)
    "============================================================
    DATA: lt_projects TYPE TABLE OF zdb_gluces_proj2.

    lt_projects = VALUE #(
        " Empleado 1001 - Carlos (Consultor MM) - 2 proyectos
        ( emplid = '1001' projid = 'PRJ001' project_name = 'Impl. SAP MM'       project_type = 'IMP' is_current = 'X' duration = '12' )
        ( emplid = '1001' projid = 'PRJ002' project_name = 'Soporte AMS'        project_type = 'AMS' is_current = ''  duration = '06' )

        " Empleado 1002 - Ana (Consultor FI) - 2 proyectos
        ( emplid = '1002' projid = 'PRJ003' project_name = 'Migración S4HANA'   project_type = 'MIG' is_current = 'X' duration = '18' )
        ( emplid = '1002' projid = 'PRJ004' project_name = 'Rollout LATAM'      project_type = 'ROL' is_current = ''  duration = '09' )

        " Empleado 1003 - Pedro (Desarrollador ABAP) - 3 proyectos
        ( emplid = '1003' projid = 'PRJ003' project_name = 'Migración S4HANA'   project_type = 'MIG' is_current = 'X' duration = '18' )
        ( emplid = '1003' projid = 'PRJ005' project_name = 'Desarrollo Fiori'   project_type = 'DEV' is_current = 'X' duration = '08' )
        ( emplid = '1003' projid = 'PRJ006' project_name = 'Interfaces EDI'     project_type = 'DEV' is_current = ''  duration = '04' )

        " Empleado 1004 - Laura (Consultor SD) - 2 proyectos
        ( emplid = '1004' projid = 'PRJ001' project_name = 'Impl. SAP MM'       project_type = 'IMP' is_current = 'X' duration = '12' )
        ( emplid = '1004' projid = 'PRJ007' project_name = 'Optimización SD'    project_type = 'OPT' is_current = ''  duration = '05' )

        " Empleado 1005 - Miguel (Consultor FI) - 2 proyectos
        ( emplid = '1005' projid = 'PRJ003' project_name = 'Migración S4HANA'   project_type = 'MIG' is_current = 'X' duration = '18' )
        ( emplid = '1005' projid = 'PRJ008' project_name = 'Cierre Fiscal'      project_type = 'AMS' is_current = ''  duration = '03' )

        " Empleado 1006 - Elena (Consultor CO) - 2 proyectos
        ( emplid = '1006' projid = 'PRJ003' project_name = 'Migración S4HANA'   project_type = 'MIG' is_current = 'X' duration = '18' )
        ( emplid = '1006' projid = 'PRJ009' project_name = 'Impl. Cost Center'  project_type = 'IMP' is_current = ''  duration = '07' )

        " Empleado 1007 - David (Basis Admin) - 2 proyectos
        ( emplid = '1007' projid = 'PRJ010' project_name = 'Migración Cloud'    project_type = 'MIG' is_current = 'X' duration = '10' )
        ( emplid = '1007' projid = 'PRJ011' project_name = 'Upgrade ECC6'       project_type = 'UPG' is_current = ''  duration = '06' )

        " Empleado 1008 - Carmen (HR Specialist) - 1 proyecto
        ( emplid = '1008' projid = 'PRJ012' project_name = 'Impl. SuccessFact'  project_type = 'IMP' is_current = 'X' duration = '14' )

        " Empleado 1009 - Javier (Desarrollador Fiori) - 3 proyectos
        ( emplid = '1009' projid = 'PRJ005' project_name = 'Desarrollo Fiori'   project_type = 'DEV' is_current = 'X' duration = '08' )
        ( emplid = '1009' projid = 'PRJ013' project_name = 'Portal Empleados'   project_type = 'DEV' is_current = 'X' duration = '06' )
        ( emplid = '1009' projid = 'PRJ014' project_name = 'App Mobile MM'      project_type = 'DEV' is_current = ''  duration = '04' )

        " Empleado 1010 - Paula (Scrum Master) - 2 proyectos
        ( emplid = '1010' projid = 'PRJ003' project_name = 'Migración S4HANA'   project_type = 'MIG' is_current = 'X' duration = '18' )
        ( emplid = '1010' projid = 'PRJ005' project_name = 'Desarrollo Fiori'   project_type = 'DEV' is_current = 'X' duration = '08' )

        " Empleado 1011 - Diego (Consultor MM) - 2 proyectos
        ( emplid = '1011' projid = 'PRJ001' project_name = 'Impl. SAP MM'       project_type = 'IMP' is_current = 'X' duration = '12' )
        ( emplid = '1011' projid = 'PRJ015' project_name = 'Inventario WM'      project_type = 'IMP' is_current = ''  duration = '08' )

        " Empleado 1012 - Lucía (Tester QA) - 3 proyectos
        ( emplid = '1012' projid = 'PRJ003' project_name = 'Migración S4HANA'   project_type = 'MIG' is_current = 'X' duration = '18' )
        ( emplid = '1012' projid = 'PRJ005' project_name = 'Desarrollo Fiori'   project_type = 'DEV' is_current = 'X' duration = '08' )
        ( emplid = '1012' projid = 'PRJ001' project_name = 'Impl. SAP MM'       project_type = 'IMP' is_current = ''  duration = '12' )

        " Empleado 1013 - Roberto (Arquitecto Cloud) - 2 proyectos
        ( emplid = '1013' projid = 'PRJ010' project_name = 'Migración Cloud'    project_type = 'MIG' is_current = 'X' duration = '10' )
        ( emplid = '1013' projid = 'PRJ016' project_name = 'Arquitectura BTP'   project_type = 'DEV' is_current = 'X' duration = '12' )

        " Empleado 1014 - Isabel (Consultor PP) - 2 proyectos
        ( emplid = '1014' projid = 'PRJ001' project_name = 'Impl. SAP MM'       project_type = 'IMP' is_current = 'X' duration = '12' )
        ( emplid = '1014' projid = 'PRJ017' project_name = 'MRP Optimization'   project_type = 'OPT' is_current = ''  duration = '05' )

        " Empleado 1015 - Alberto (Security Analyst) - 1 proyecto
        ( emplid = '1015' projid = 'PRJ018' project_name = 'Auditoría GRC'      project_type = 'AUD' is_current = 'X' duration = '06' )

        " Empleado 1016 - Raquel (Data Analyst) - 2 proyectos
        ( emplid = '1016' projid = 'PRJ019' project_name = 'Dashboard BI'       project_type = 'DEV' is_current = 'X' duration = '07' )
        ( emplid = '1016' projid = 'PRJ020' project_name = 'Data Migration'     project_type = 'MIG' is_current = ''  duration = '04' )

        " Empleado 1017 - Fernando (Consultor QM) - 2 proyectos
        ( emplid = '1017' projid = 'PRJ001' project_name = 'Impl. SAP MM'       project_type = 'IMP' is_current = 'X' duration = '12' )
        ( emplid = '1017' projid = 'PRJ021' project_name = 'Control Calidad'    project_type = 'IMP' is_current = ''  duration = '06' )

        " Empleado 1018 - Patricia (Product Owner) - 2 proyectos
        ( emplid = '1018' projid = 'PRJ003' project_name = 'Migración S4HANA'   project_type = 'MIG' is_current = 'X' duration = '18' )
        ( emplid = '1018' projid = 'PRJ005' project_name = 'Desarrollo Fiori'   project_type = 'DEV' is_current = 'X' duration = '08' )

        " Empleado 1019 - Ricardo (Desarrollador ABAP) - 3 proyectos
        ( emplid = '1019' projid = 'PRJ003' project_name = 'Migración S4HANA'   project_type = 'MIG' is_current = 'X' duration = '18' )
        ( emplid = '1019' projid = 'PRJ022' project_name = 'Reports ALV'        project_type = 'DEV' is_current = ''  duration = '03' )
        ( emplid = '1019' projid = 'PRJ006' project_name = 'Interfaces EDI'     project_type = 'DEV' is_current = ''  duration = '04' )

        " Empleado 1020 - Silvia (UX Designer) - 2 proyectos
        ( emplid = '1020' projid = 'PRJ005' project_name = 'Desarrollo Fiori'   project_type = 'DEV' is_current = 'X' duration = '08' )
        ( emplid = '1020' projid = 'PRJ013' project_name = 'Portal Empleados'   project_type = 'DEV' is_current = 'X' duration = '06' )
     ).

    "============================================================
    " 5. EMPLOYEE - SKILL INFO (ZDB_GLUCES_SKILL)
    "============================================================
    DATA: lt_skills TYPE TABLE OF zdb_gluces_skil2.

    lt_skills = VALUE #(
        " Empleado 1001 - Carlos (Consultor MM)
        ( emplid = '1001' projid = 'PRJ001' skillid = 'SAP_MM'     skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )
        ( emplid = '1001' projid = 'PRJ001' skillid = 'SAP_WM'     skill_level = 'Advanced'     is_primary = ''  is_certified = 'X' )
        ( emplid = '1001' projid = 'PRJ002' skillid = 'SAP_MM'     skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )

        " Empleado 1002 - Ana (Consultor FI)
        ( emplid = '1002' projid = 'PRJ003' skillid = 'SAP_FI'     skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )
        ( emplid = '1002' projid = 'PRJ003' skillid = 'S4HANA'     skill_level = 'Advanced'     is_primary = ''  is_certified = 'X' )
        ( emplid = '1002' projid = 'PRJ004' skillid = 'SAP_FI'     skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )

        " Empleado 1003 - Pedro (Desarrollador ABAP)
        ( emplid = '1003' projid = 'PRJ003' skillid = 'ABAP'       skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )
        ( emplid = '1003' projid = 'PRJ003' skillid = 'ABAP_CDS'   skill_level = 'Advanced'     is_primary = ''  is_certified = '' )
        ( emplid = '1003' projid = 'PRJ005' skillid = 'SAPUI5'     skill_level = 'Intermediate' is_primary = ''  is_certified = '' )
        ( emplid = '1003' projid = 'PRJ005' skillid = 'ABAP_RAP'   skill_level = 'Advanced'     is_primary = 'X' is_certified = '' )
        ( emplid = '1003' projid = 'PRJ006' skillid = 'ABAP'       skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )

        " Empleado 1004 - Laura (Consultor SD)
        ( emplid = '1004' projid = 'PRJ001' skillid = 'SAP_SD'     skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )
        ( emplid = '1004' projid = 'PRJ001' skillid = 'SAP_MM'     skill_level = 'Intermediate' is_primary = ''  is_certified = '' )
        ( emplid = '1004' projid = 'PRJ007' skillid = 'SAP_SD'     skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )

        " Empleado 1005 - Miguel (Consultor FI)
        ( emplid = '1005' projid = 'PRJ003' skillid = 'SAP_FI'     skill_level = 'Advanced'     is_primary = 'X' is_certified = 'X' )
        ( emplid = '1005' projid = 'PRJ003' skillid = 'SAP_CO'     skill_level = 'Intermediate' is_primary = ''  is_certified = '' )
        ( emplid = '1005' projid = 'PRJ008' skillid = 'SAP_FI'     skill_level = 'Advanced'     is_primary = 'X' is_certified = 'X' )

        " Empleado 1006 - Elena (Consultor CO)
        ( emplid = '1006' projid = 'PRJ003' skillid = 'SAP_CO'     skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )
        ( emplid = '1006' projid = 'PRJ003' skillid = 'SAP_FI'     skill_level = 'Intermediate' is_primary = ''  is_certified = '' )
        ( emplid = '1006' projid = 'PRJ009' skillid = 'SAP_CO'     skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )

        " Empleado 1007 - David (Basis Admin)
        ( emplid = '1007' projid = 'PRJ010' skillid = 'SAP_BASIS'  skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )
        ( emplid = '1007' projid = 'PRJ010' skillid = 'SAP_HANA'   skill_level = 'Advanced'     is_primary = ''  is_certified = 'X' )
        ( emplid = '1007' projid = 'PRJ011' skillid = 'SAP_BASIS'  skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )

        " Empleado 1008 - Carmen (HR Specialist)
        ( emplid = '1008' projid = 'PRJ012' skillid = 'SAP_HCM'    skill_level = 'Advanced'     is_primary = 'X' is_certified = 'X' )
        ( emplid = '1008' projid = 'PRJ012' skillid = 'SF_EC'      skill_level = 'Intermediate' is_primary = ''  is_certified = '' )

        " Empleado 1009 - Javier (Desarrollador Fiori)
        ( emplid = '1009' projid = 'PRJ005' skillid = 'SAPUI5'     skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )
        ( emplid = '1009' projid = 'PRJ005' skillid = 'FIORI'      skill_level = 'Expert'       is_primary = ''  is_certified = 'X' )
        ( emplid = '1009' projid = 'PRJ013' skillid = 'SAPUI5'     skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )
        ( emplid = '1009' projid = 'PRJ013' skillid = 'JAVASCRIPT' skill_level = 'Advanced'     is_primary = ''  is_certified = '' )
        ( emplid = '1009' projid = 'PRJ014' skillid = 'FIORI'      skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )

        " Empleado 1010 - Paula (Scrum Master)
        ( emplid = '1010' projid = 'PRJ003' skillid = 'AGILE'      skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )
        ( emplid = '1010' projid = 'PRJ003' skillid = 'SAP_ACTIV'  skill_level = 'Advanced'     is_primary = ''  is_certified = '' )
        ( emplid = '1010' projid = 'PRJ005' skillid = 'AGILE'      skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )

        " Empleado 1011 - Diego (Consultor MM)
        ( emplid = '1011' projid = 'PRJ001' skillid = 'SAP_MM'     skill_level = 'Advanced'     is_primary = 'X' is_certified = 'X' )
        ( emplid = '1011' projid = 'PRJ001' skillid = 'SAP_LE'     skill_level = 'Intermediate' is_primary = ''  is_certified = '' )
        ( emplid = '1011' projid = 'PRJ015' skillid = 'SAP_WM'     skill_level = 'Advanced'     is_primary = 'X' is_certified = '' )

        " Empleado 1012 - Lucía (Tester QA)
        ( emplid = '1012' projid = 'PRJ003' skillid = 'SAP_TEST'   skill_level = 'Expert'       is_primary = 'X' is_certified = '' )
        ( emplid = '1012' projid = 'PRJ003' skillid = 'AUTOMATION' skill_level = 'Advanced'     is_primary = ''  is_certified = '' )
        ( emplid = '1012' projid = 'PRJ005' skillid = 'SAP_TEST'   skill_level = 'Expert'       is_primary = 'X' is_certified = '' )
        ( emplid = '1012' projid = 'PRJ001' skillid = 'SAP_TEST'   skill_level = 'Expert'       is_primary = 'X' is_certified = '' )

        " Empleado 1013 - Roberto (Arquitecto Cloud)
        ( emplid = '1013' projid = 'PRJ010' skillid = 'SAP_BTP'    skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )
        ( emplid = '1013' projid = 'PRJ010' skillid = 'SAP_CI'     skill_level = 'Advanced'     is_primary = ''  is_certified = '' )
        ( emplid = '1013' projid = 'PRJ016' skillid = 'SAP_BTP'    skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )
        ( emplid = '1013' projid = 'PRJ016' skillid = 'SAP_CAP'    skill_level = 'Advanced'     is_primary = ''  is_certified = '' )

        " Empleado 1014 - Isabel (Consultor PP)
        ( emplid = '1014' projid = 'PRJ001' skillid = 'SAP_PP'     skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )
        ( emplid = '1014' projid = 'PRJ001' skillid = 'SAP_MM'     skill_level = 'Intermediate' is_primary = ''  is_certified = '' )
        ( emplid = '1014' projid = 'PRJ017' skillid = 'SAP_PP'     skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )

        " Empleado 1015 - Alberto (Security Analyst)
        ( emplid = '1015' projid = 'PRJ018' skillid = 'SAP_GRC'    skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )
        ( emplid = '1015' projid = 'PRJ018' skillid = 'SAP_AUTH'   skill_level = 'Expert'       is_primary = ''  is_certified = 'X' )

        " Empleado 1016 - Raquel (Data Analyst)
        ( emplid = '1016' projid = 'PRJ019' skillid = 'SAP_BW'     skill_level = 'Advanced'     is_primary = 'X' is_certified = '' )
        ( emplid = '1016' projid = 'PRJ019' skillid = 'SAP_SAC'    skill_level = 'Advanced'     is_primary = ''  is_certified = '' )
        ( emplid = '1016' projid = 'PRJ020' skillid = 'SQL'        skill_level = 'Advanced'     is_primary = 'X' is_certified = '' )

        " Empleado 1017 - Fernando (Consultor QM)
        ( emplid = '1017' projid = 'PRJ001' skillid = 'SAP_QM'     skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )
        ( emplid = '1017' projid = 'PRJ001' skillid = 'SAP_MM'     skill_level = 'Intermediate' is_primary = ''  is_certified = '' )
        ( emplid = '1017' projid = 'PRJ021' skillid = 'SAP_QM'     skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )

        " Empleado 1018 - Patricia (Product Owner)
        ( emplid = '1018' projid = 'PRJ003' skillid = 'AGILE'      skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )
        ( emplid = '1018' projid = 'PRJ003' skillid = 'S4HANA'     skill_level = 'Intermediate' is_primary = ''  is_certified = '' )
        ( emplid = '1018' projid = 'PRJ005' skillid = 'AGILE'      skill_level = 'Expert'       is_primary = 'X' is_certified = 'X' )

        " Empleado 1019 - Ricardo (Desarrollador ABAP)
        ( emplid = '1019' projid = 'PRJ003' skillid = 'ABAP'       skill_level = 'Advanced'     is_primary = 'X' is_certified = '' )
        ( emplid = '1019' projid = 'PRJ003' skillid = 'ABAP_OO'    skill_level = 'Advanced'     is_primary = ''  is_certified = '' )
        ( emplid = '1019' projid = 'PRJ022' skillid = 'ABAP'       skill_level = 'Advanced'     is_primary = 'X' is_certified = '' )
        ( emplid = '1019' projid = 'PRJ022' skillid = 'ALV'        skill_level = 'Expert'       is_primary = ''  is_certified = '' )
        ( emplid = '1019' projid = 'PRJ006' skillid = 'ABAP'       skill_level = 'Advanced'     is_primary = 'X' is_certified = '' )

        " Empleado 1020 - Silvia (UX Designer)
        ( emplid = '1020' projid = 'PRJ005' skillid = 'UX_DESIGN'  skill_level = 'Expert'       is_primary = 'X' is_certified = '' )
        ( emplid = '1020' projid = 'PRJ005' skillid = 'FIORI'      skill_level = 'Advanced'     is_primary = ''  is_certified = '' )
        ( emplid = '1020' projid = 'PRJ013' skillid = 'UX_DESIGN'  skill_level = 'Expert'       is_primary = 'X' is_certified = '' )
        ( emplid = '1020' projid = 'PRJ013' skillid = 'CSS'        skill_level = 'Advanced'     is_primary = ''  is_certified = '' )
     ).

    "============================================================
    " BORRAR DATOS EXISTENTES
    "============================================================
    DELETE FROM zdb_gluces_skil2.
    DELETE FROM zdb_gluces_proj2.
    DELETE FROM zdb_gluces_addr2.
    DELETE FROM zdb_gluces_cont2.
    DELETE FROM zdb_gluces_empl2.

    "============================================================
    " INSERTAR NUEVOS DATOS
    "============================================================
    DATA: lv_count TYPE i.

    " Insertar empleados
    INSERT zdb_gluces_empl2 FROM TABLE @lt_employees.
    lv_count = sy-dbcnt.
    out->write( |Empleados insertados: { lv_count }| ).

    " Insertar contactos
    INSERT zdb_gluces_cont2 FROM TABLE @lt_contacts.
    lv_count = sy-dbcnt.
    out->write( |Contactos insertados: { lv_count }| ).

    " Insertar direcciones
    INSERT zdb_gluces_addr2 FROM TABLE @lt_addresses.
    lv_count = sy-dbcnt.
    out->write( |Direcciones insertadas: { lv_count }| ).

    " Insertar proyectos
    INSERT zdb_gluces_proj2 FROM TABLE @lt_projects.
    lv_count = sy-dbcnt.
    out->write( |Proyectos insertados: { lv_count }| ).

    " Insertar skills
    INSERT zdb_gluces_skil2 FROM TABLE @lt_skills.
    lv_count = sy-dbcnt.
    out->write( |Skills insertados: { lv_count }| ).

    out->write( |========================================| ).
    out->write( |Carga de datos completada exitosamente.| ).

  ENDMETHOD.
ENDCLASS.
