CLASS zcl_pm_data_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_pm_data_generator IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " ============================================
    " 1. LOCATIONS (Ubicaciones Técnicas)
    " ============================================
    DATA: lt_locat TYPE TABLE OF zdb_pm_locat.
    lt_locat = VALUE #(
      ( location_id = 'LOC-001' location_name = 'Production Line 1' plant = 'P100' area = 'Manufacturing' building = 'A1' floor = '1' )
      ( location_id = 'LOC-002' location_name = 'Production Line 2' plant = 'P100' area = 'Manufacturing' building = 'A1' floor = '1' )
      ( location_id = 'LOC-003' location_name = 'Warehouse Area A' plant = 'P100' area = 'Warehouse' building = 'B1' floor = '1' )
      ( location_id = 'LOC-004' location_name = 'Utilities Room' plant = 'P100' area = 'Utilities' building = 'C1' floor = 'B1' )
      ( location_id = 'LOC-005' location_name = 'Quality Lab' plant = 'P100' area = 'Quality' building = 'A2' floor = '2' )
    ).

    " ============================================
    " 2. EQUIPMENTS (Equipos)
    " ============================================
    DATA: lt_equip TYPE TABLE OF zdb_pm_equip.
    lt_equip = VALUE #(
      ( equipment_id = 'EQ-001' equipment_name = 'Main Compressor Unit' equipment_type = 'CMP' manufacturer = 'Atlas Copco'
        model = 'GA-90' serial_number = 'AC2024001' location_id = 'LOC-004' criticality = 'H' status = 'O'
        acquisition_date = '20220315' warranty_end = '20270315' )
      ( equipment_id = 'EQ-002' equipment_name = 'Cooling Water Pump' equipment_type = 'PMP' manufacturer = 'Grundfos'
        model = 'CR-45' serial_number = 'GF2023045' location_id = 'LOC-004' criticality = 'H' status = 'O'
        acquisition_date = '20230601' warranty_end = '20260601' )
      ( equipment_id = 'EQ-003' equipment_name = 'Conveyor Belt Motor' equipment_type = 'MTR' manufacturer = 'Siemens'
        model = '1LE1001' serial_number = 'SI2021789' location_id = 'LOC-001' criticality = 'M' status = 'M'
        acquisition_date = '20210901' warranty_end = '20240901' )
      ( equipment_id = 'EQ-004' equipment_name = 'Main Conveyor System' equipment_type = 'CNV' manufacturer = 'Flexco'
        model = 'FX-500' serial_number = 'FL2022156' location_id = 'LOC-001' criticality = 'H' status = 'O'
        acquisition_date = '20220101' warranty_end = '20250101' )
      ( equipment_id = 'EQ-005' equipment_name = 'Pressure Control Valve' equipment_type = 'VLV' manufacturer = 'Fisher'
        model = 'V250' serial_number = 'FI2024321' location_id = 'LOC-001' criticality = 'M' status = 'O'
        acquisition_date = '20240101' warranty_end = '20290101' )
      ( equipment_id = 'EQ-006' equipment_name = 'Heat Exchanger Unit' equipment_type = 'HEX' manufacturer = 'Alfa Laval'
        model = 'M15' serial_number = 'AL2023567' location_id = 'LOC-004' criticality = 'M' status = 'O'
        acquisition_date = '20230815' warranty_end = '20260815' )
      ( equipment_id = 'EQ-007' equipment_name = 'Emergency Backup Pump' equipment_type = 'PMP' manufacturer = 'KSB'
        model = 'Etanorm' serial_number = 'KS2020999' location_id = 'LOC-004' criticality = 'L' status = 'O'
        acquisition_date = '20200301' warranty_end = '20230301' )
      ( equipment_id = 'EQ-008' equipment_name = 'Packaging Line Motor' equipment_type = 'MTR' manufacturer = 'ABB'
        model = 'M3AA' serial_number = 'AB2024111' location_id = 'LOC-002' criticality = 'M' status = 'X'
        acquisition_date = '20240215' warranty_end = '20270215' )
    ).

    " ============================================
    " 3. MAINTENANCE ORDERS (Órdenes de Mantenimiento)
    " ============================================
    DATA: lt_order TYPE TABLE OF zdb_pm_order.
    DATA: lv_timestamp TYPE timestampl.
    GET TIME STAMP FIELD lv_timestamp.

    lt_order = VALUE #(
      " Corrective - Emergency (Motor failed)
      ( order_id = 'OM-2024-0001' equipment_id = 'EQ-003' order_type = 'CO' priority = '1' status = 'P'
        description = 'Motor overheating - emergency repair' reported_by = 'Juan Pérez' assigned_to = 'Carlos Ruiz'
        planned_start = '20241218' planned_end = '20241218' actual_start = '20241218' actual_end = ''
        estimated_cost = '5000.00' actual_cost = '3500.00' currency = 'USD' created_at = lv_timestamp )

      " Preventive - Normal (Compressor service)
      ( order_id = 'OM-2024-0002' equipment_id = 'EQ-001' order_type = 'PR' priority = '3' status = 'N'
        description = 'Scheduled 6-month compressor service' reported_by = 'Sistema' assigned_to = 'Miguel Torres'
        planned_start = '20241220' planned_end = '20241221' actual_start = '' actual_end = ''
        estimated_cost = '2500.00' actual_cost = '0.00' currency = 'USD' created_at = lv_timestamp )

      " Corrective - Urgent (Pump vibration)
      ( order_id = 'OM-2024-0003' equipment_id = 'EQ-002' order_type = 'CO' priority = '2' status = 'P'
        description = 'Abnormal pump vibration detected' reported_by = 'Ana García' assigned_to = 'Carlos Ruiz'
        planned_start = '20241219' planned_end = '20241219' actual_start = '20241219' actual_end = ''
        estimated_cost = '1500.00' actual_cost = '800.00' currency = 'USD' created_at = lv_timestamp )

      " Predictive - Normal (Valve inspection)
      ( order_id = 'OM-2024-0004' equipment_id = 'EQ-005' order_type = 'PD' priority = '3' status = 'N'
        description = 'Predictive valve inspection based on sensors' reported_by = 'Sistema IoT' assigned_to = 'Pedro Soto'
        planned_start = '20241222' planned_end = '20241222' actual_start = '' actual_end = ''
        estimated_cost = '800.00' actual_cost = '0.00' currency = 'USD' created_at = lv_timestamp )

      " Preventive - Completed (Heat exchanger cleaning)
      ( order_id = 'OM-2024-0005' equipment_id = 'EQ-006' order_type = 'PR' priority = '4' status = 'C'
        description = 'Quarterly heat exchanger cleaning' reported_by = 'Sistema' assigned_to = 'Miguel Torres'
        planned_start = '20241210' planned_end = '20241211' actual_start = '20241210' actual_end = '20241211'
        estimated_cost = '1200.00' actual_cost = '1100.00' currency = 'USD' created_at = lv_timestamp )

      " Corrective - Cancelled (False alarm)
      ( order_id = 'OM-2024-0006' equipment_id = 'EQ-007' order_type = 'CO' priority = '2' status = 'X'
        description = 'Suspected leak - false alarm confirmed' reported_by = 'Operador Turno' assigned_to = ''
        planned_start = '20241215' planned_end = '20241215' actual_start = '' actual_end = ''
        estimated_cost = '500.00' actual_cost = '0.00' currency = 'USD' created_at = lv_timestamp )

      " Corrective - Emergency (Packaging motor)
      ( order_id = 'OM-2024-0007' equipment_id = 'EQ-008' order_type = 'CO' priority = '1' status = 'N'
        description = 'Motor burned out - replacement needed' reported_by = 'Laura Díaz' assigned_to = ''
        planned_start = '20241219' planned_end = '20241220' actual_start = '' actual_end = ''
        estimated_cost = '8000.00' actual_cost = '0.00' currency = 'USD' created_at = lv_timestamp )
    ).

    " ============================================
    " 4. OPERATIONS (Operaciones de Mantenimiento)
    " ============================================
    DATA: lt_oper TYPE TABLE OF zdb_pm_oper.
    lt_oper = VALUE #(
      " Order 0001 - Motor repair operations
      ( order_id = 'OM-2024-0001' operation_id = '0010' operation_desc = 'Disconnect power and lockout'
        work_center = 'ELEC-01' planned_hours = '0.5' actual_hours = '0.5' status = 'D' technician = 'Carlos Ruiz' )
      ( order_id = 'OM-2024-0001' operation_id = '0020' operation_desc = 'Remove motor from conveyor'
        work_center = 'MECH-01' planned_hours = '2.0' actual_hours = '1.5' status = 'D' technician = 'Carlos Ruiz' )
      ( order_id = 'OM-2024-0001' operation_id = '0030' operation_desc = 'Diagnose motor failure'
        work_center = 'ELEC-01' planned_hours = '1.0' actual_hours = '0.0' status = 'I' technician = 'Carlos Ruiz' )
      ( order_id = 'OM-2024-0001' operation_id = '0040' operation_desc = 'Replace bearings and windings'
        work_center = 'ELEC-01' planned_hours = '4.0' actual_hours = '0.0' status = 'P' technician = 'Carlos Ruiz' )
      ( order_id = 'OM-2024-0001' operation_id = '0050' operation_desc = 'Test and commission'
        work_center = 'ELEC-01' planned_hours = '1.0' actual_hours = '0.0' status = 'P' technician = 'Carlos Ruiz' )

      " Order 0002 - Compressor service operations
      ( order_id = 'OM-2024-0002' operation_id = '0010' operation_desc = 'Safety isolation and preparation'
        work_center = 'MECH-01' planned_hours = '0.5' actual_hours = '0.0' status = 'P' technician = 'Miguel Torres' )
      ( order_id = 'OM-2024-0002' operation_id = '0020' operation_desc = 'Replace oil and filters'
        work_center = 'MECH-01' planned_hours = '2.0' actual_hours = '0.0' status = 'P' technician = 'Miguel Torres' )
      ( order_id = 'OM-2024-0002' operation_id = '0030' operation_desc = 'Check valve condition'
        work_center = 'MECH-01' planned_hours = '1.5' actual_hours = '0.0' status = 'P' technician = 'Miguel Torres' )
      ( order_id = 'OM-2024-0002' operation_id = '0040' operation_desc = 'Calibrate pressure sensors'
        work_center = 'INST-01' planned_hours = '1.0' actual_hours = '0.0' status = 'P' technician = 'Pedro Soto' )

      " Order 0003 - Pump vibration operations
      ( order_id = 'OM-2024-0003' operation_id = '0010' operation_desc = 'Vibration analysis'
        work_center = 'INST-01' planned_hours = '1.0' actual_hours = '0.75' status = 'D' technician = 'Carlos Ruiz' )
      ( order_id = 'OM-2024-0003' operation_id = '0020' operation_desc = 'Shaft alignment check'
        work_center = 'MECH-01' planned_hours = '2.0' actual_hours = '0.0' status = 'I' technician = 'Carlos Ruiz' )
      ( order_id = 'OM-2024-0003' operation_id = '0030' operation_desc = 'Bearing replacement if needed'
        work_center = 'MECH-01' planned_hours = '3.0' actual_hours = '0.0' status = 'P' technician = 'Carlos Ruiz' )

      " Order 0004 - Valve inspection operations
      ( order_id = 'OM-2024-0004' operation_id = '0010' operation_desc = 'Visual inspection'
        work_center = 'INST-01' planned_hours = '0.5' actual_hours = '0.0' status = 'P' technician = 'Pedro Soto' )
      ( order_id = 'OM-2024-0004' operation_id = '0020' operation_desc = 'Stroke test and calibration'
        work_center = 'INST-01' planned_hours = '1.5' actual_hours = '0.0' status = 'P' technician = 'Pedro Soto' )

      " Order 0005 - Heat exchanger cleaning (completed)
      ( order_id = 'OM-2024-0005' operation_id = '0010' operation_desc = 'Isolation and drainage'
        work_center = 'MECH-01' planned_hours = '1.0' actual_hours = '1.0' status = 'D' technician = 'Miguel Torres' )
      ( order_id = 'OM-2024-0005' operation_id = '0020' operation_desc = 'Chemical cleaning'
        work_center = 'MECH-01' planned_hours = '4.0' actual_hours = '3.5' status = 'D' technician = 'Miguel Torres' )
      ( order_id = 'OM-2024-0005' operation_id = '0030' operation_desc = 'Pressure test'
        work_center = 'MECH-01' planned_hours = '1.0' actual_hours = '1.0' status = 'D' technician = 'Miguel Torres' )
      ( order_id = 'OM-2024-0005' operation_id = '0040' operation_desc = 'Recommissioning'
        work_center = 'MECH-01' planned_hours = '0.5' actual_hours = '0.5' status = 'D' technician = 'Miguel Torres' )
    ).

    " ============================================
    " DELETE EXISTING DATA (Children first!)
    " ============================================
    DELETE FROM zdb_pm_oper.
    out->write( |Operations deleted: { sy-dbcnt }| ).

    DELETE FROM zdb_pm_order.
    out->write( |Maintenance Orders deleted: { sy-dbcnt }| ).

    DELETE FROM zdb_pm_equip.
    out->write( |Equipments deleted: { sy-dbcnt }| ).

    DELETE FROM zdb_pm_locat.
    out->write( |Locations deleted: { sy-dbcnt }| ).

    out->write( |------------------------------------| ).

    " ============================================
    " INSERT NEW DATA (Parents first!)
    " ============================================
    INSERT zdb_pm_locat FROM TABLE @lt_locat.
    out->write( |Locations inserted: { sy-dbcnt }| ).

    INSERT zdb_pm_equip FROM TABLE @lt_equip.
    out->write( |Equipments inserted: { sy-dbcnt }| ).

    INSERT zdb_pm_order FROM TABLE @lt_order.
    out->write( |Maintenance Orders inserted: { sy-dbcnt }| ).

    INSERT zdb_pm_oper FROM TABLE @lt_oper.
    out->write( |Operations inserted: { sy-dbcnt }| ).

    out->write( |------------------------------------| ).
    out->write( |✅ Plant Maintenance data generation completed!| ).
    out->write( |------------------------------------| ).

    " Summary
    out->write( |Summary:| ).
    out->write( |  - 5 Technical Locations| ).
    out->write( |  - 8 Equipments| ).
    out->write( |  - 7 Maintenance Orders| ).
    out->write( |  - 17 Operations| ).

  ENDMETHOD.

ENDCLASS.

