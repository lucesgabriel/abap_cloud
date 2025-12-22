@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Maintenance Operation'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_PM_OPERATION
  as select from ZI_PM_OPERATION
{
    key OrderId,
    key OperationId,
    
    OperationDesc,
    WorkCenter,
    PlannedHours,
    ActualHours,
    
    Status,
    StatusText,
    StatusCriticality,
    
    Technician,
    Notes,
    
    ProgressPercent
}
