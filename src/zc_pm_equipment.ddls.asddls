@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Equipment'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
 define view entity ZC_PM_EQUIPMENT as select from ZI_PM_EQUIPMENT
{
    // ============================================
    // KEY FIELDS
    // ============================================
    @Search.defaultSearchElement: true
    key EquipmentId,
    
    // ============================================
    // BASIC INFO
    // ============================================
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    EquipmentName,
    
    EquipmentType,
    EquipmentTypeText,
    
    Manufacturer,
    Model,
    SerialNumber,
    
    // ============================================
    // LOCATION
    // ============================================
    LocationId,
    _Location.LocationName as LocationName,
    _Location.Plant as Plant,
    _Location.Area as Area,
    
    // ============================================
    // STATUS & CRITICALITY
    // ============================================
    Criticality,
    CriticalityText,
    CriticalitySeverity,
    
    Status,
    StatusText,
    StatusCriticality,
    
    // ============================================
    // WARRANTY & DATES
    // ============================================
    AcquisitionDate,
    WarrantyEnd,
    WarrantyStatus,
    WarrantyCriticality,
    
    // ============================================
    // CALCULATED
    // ============================================
    EquipmentFullDesc,
    
    // ============================================
    // ASSOCIATIONS
    // ============================================
    _Location,
    _Orders
}
