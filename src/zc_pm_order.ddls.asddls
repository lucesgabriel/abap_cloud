@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Maintenance Order'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_PM_ORDER 
  as select from ZI_PM_ORDER
{
    @Search.defaultSearchElement: true
    key OrderId,
    
    EquipmentId,
    
    OrderType,
    OrderTypeText,
    OrderTypeCriticality,
    
    Priority,
    PriorityText,
    PriorityCriticality,
    
    Status,
    StatusText,
    StatusCriticality,
    
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    Description,
    
    LongText,
    
    ReportedBy,
    AssignedTo,
    
    PlannedStart,
    PlannedEnd,
    ActualStart,
    ActualEnd,
    
    @Semantics.amount.currencyCode: 'Currency'
    EstimatedCost,
    
    @Semantics.amount.currencyCode: 'Currency'
    ActualCost,
    
    Currency,
    
    CreatedAt,
    
    _Operations
}
