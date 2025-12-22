@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - Equipment'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_PM_EQUIPMENT
  as select from zdb_pm_equip
  association [0..1] to ZI_PM_LOCATION as _Location
    on $projection.LocationId = _Location.LocationId
  association [0..*] to ZI_PM_ORDER as _Orders
    on $projection.EquipmentId = _Orders.EquipmentId
{
    key equipment_id    as EquipmentId,
    equipment_name      as EquipmentName,
    equipment_type      as EquipmentType,
    manufacturer        as Manufacturer,
    model               as Model,
    serial_number       as SerialNumber,
    location_id         as LocationId,
    criticality         as Criticality,
    status              as Status,
    acquisition_date    as AcquisitionDate,
    warranty_end        as WarrantyEnd,
    
    // ============================================
    // CALCULATED FIELDS
    // ============================================
    
    // Equipment Type Text
    case equipment_type
      when 'PMP' then 'Pump'
      when 'CMP' then 'Compressor'
      when 'MTR' then 'Motor'
      when 'CNV' then 'Conveyor'
      when 'VLV' then 'Valve'
      when 'HEX' then 'Heat Exchanger'
      when 'TRF' then 'Transformer'
      else 'Other'
    end as EquipmentTypeText,
    
    // Criticality Text
    case criticality
      when 'H' then 'High'
      when 'M' then 'Medium'
      when 'L' then 'Low'
      else 'Undefined'
    end as CriticalityText,
    
    // Status Text
    case status
      when 'O' then 'Operative'
      when 'M' then 'In Maintenance'
      when 'X' then 'Out of Service'
      else 'Unknown'
    end as StatusText,
    
    // Full Equipment Description
    concat_with_space(equipment_id, equipment_name, 1) as EquipmentFullDesc,
    
    // ============================================
    // CRITICALITY (Colors)
    // ============================================
    
    // Equipment Criticality (for importance)
    case criticality
      when 'H' then 1     // Red - High criticality
      when 'M' then 2     // Yellow - Medium
      when 'L' then 3     // Green - Low
      else 0
    end as CriticalitySeverity,
    
    // Status Criticality
    case status
      when 'O' then 3     // Green - Operative
      when 'M' then 2     // Yellow - In Maintenance
      when 'X' then 1     // Red - Out of Service
      else 0
    end as StatusCriticality,
    
    // Warranty Status
    case 
      when warranty_end >= $session.system_date then 3    // Green - In warranty
      when warranty_end is initial then 0                  // Gray - No warranty
      else 1                                               // Red - Expired
    end as WarrantyCriticality,
    
    case 
      when warranty_end >= $session.system_date then 'In Warranty'
      when warranty_end is initial then 'No Warranty'
      else 'Expired'
    end as WarrantyStatus,
    
    // ============================================
    // ASSOCIATIONS
    // ============================================
    _Location,
    _Orders
}
