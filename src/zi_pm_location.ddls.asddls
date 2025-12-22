@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - Technical Location'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_PM_LOCATION
  as select from zdb_pm_locat
{
    key location_id   as LocationId,
    location_name     as LocationName,
    plant             as Plant,
    area              as Area,
    building          as Building,
    floor             as Floor,
    
    // Calculated: Full Location Description
    concat_with_space(location_id, location_name, 1) as LocationFullDesc
}
