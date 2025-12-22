@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - Maintenance Operation'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_PM_OPERATION
  as select from zdb_pm_oper
{
    key order_id        as OrderId,
    key operation_id    as OperationId,
    operation_desc      as OperationDesc,
    work_center         as WorkCenter,
    planned_hours       as PlannedHours,
    actual_hours        as ActualHours,
    status              as Status,
    technician          as Technician,
    notes               as Notes,
    
    // Status Text
    case status
      when 'P' then 'Pending'
      when 'I' then 'In Progress'
      when 'D' then 'Done'
      when 'S' then 'Skipped'
      else 'Unknown'
    end as StatusText,
    
    // Status Criticality
    case status
      when 'P' then 2     // Yellow - Pending
      when 'I' then 2     // Yellow - In Progress
      when 'D' then 3     // Green - Done
      when 'S' then 0     // Gray - Skipped
      else 0
    end as StatusCriticality,
    
    // Progress calculation (actual vs planned)
    case 
      when planned_hours = 0 then 0
      else division(actual_hours * 100, planned_hours, 0)
    end as ProgressPercent
}
