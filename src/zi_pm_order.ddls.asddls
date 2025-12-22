@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - Maintenance Order'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_PM_ORDER
  as select from zdb_pm_order
  association [0..*] to ZI_PM_OPERATION as _Operations
    on $projection.OrderId = _Operations.OrderId
{
    key order_id        as OrderId,
    equipment_id        as EquipmentId,
    order_type          as OrderType,
    priority            as Priority,
    status              as Status,
    description         as Description,
    long_text           as LongText,
    reported_by         as ReportedBy,
    assigned_to         as AssignedTo,
    planned_start       as PlannedStart,
    planned_end         as PlannedEnd,
    actual_start        as ActualStart,
    actual_end          as ActualEnd,
    estimated_cost      as EstimatedCost,
    actual_cost         as ActualCost,
    currency            as Currency,
    created_at          as CreatedAt,
    
    // ============================================
    // CALCULATED FIELDS
    // ============================================
    
    // Order Type Text
    case order_type
      when 'CO' then 'Corrective'
      when 'PR' then 'Preventive'
      when 'PD' then 'Predictive'
      else 'Other'
    end as OrderTypeText,
    
    // Priority Text
    case priority
      when '1' then 'Emergency'
      when '2' then 'Urgent'
      when '3' then 'Normal'
      when '4' then 'Low'
      else 'Undefined'
    end as PriorityText,
    
    // Status Text
    case status
      when 'N' then 'New'
      when 'P' then 'In Progress'
      when 'C' then 'Completed'
      when 'X' then 'Cancelled'
      else 'Unknown'
    end as StatusText,
    
    // ============================================
    // CRITICALITY (Colors)
    // ============================================
    
    // Priority Criticality
    case priority
      when '1' then 1     // Red - Emergency
      when '2' then 2     // Yellow - Urgent
      when '3' then 0     // Gray - Normal
      when '4' then 0     // Gray - Low
      else 0
    end as PriorityCriticality,
    
    // Status Criticality
    case status
      when 'N' then 2     // Yellow - New
      when 'P' then 2     // Yellow - In Progress
      when 'C' then 3     // Green - Completed
      when 'X' then 1     // Red - Cancelled
      else 0
    end as StatusCriticality,
    
    // Order Type Criticality
    case order_type
      when 'CO' then 1    // Red - Corrective (breakdown)
      when 'PR' then 3    // Green - Preventive (planned)
      when 'PD' then 2    // Yellow - Predictive
      else 0
    end as OrderTypeCriticality,
    
    // Associations
    _Operations
}
