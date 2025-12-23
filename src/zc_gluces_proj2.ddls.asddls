@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Employee Project'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true

define view entity ZC_GLUCES_PROJ2
  as select from ZI_GLUCES_PROJ2
  association to parent ZC_GLUCES_EMPL2 as _Employee on $projection.Emplid = _Employee.Emplid
  composition [0..*] of ZC_GLUCES_SKILL2 as _Skills
{
      key Emplid,
      key Projid,
          ProjectName,
          ProjectType,
          IsCurrent,
          Duration,

          case ProjectType
            when 'IMP' then 'Implementation'
            when 'AMS' then 'Support AMS'
            when 'MIG' then 'Migration'
            when 'DEV' then 'Development'
            when 'ROL' then 'Rollout'
            when 'OPT' then 'Optimization'
            when 'UPG' then 'Upgrade'
            when 'AUD' then 'Audit'
            else 'Other'
          end as ProjectTypeText,

          case IsCurrent
            when 'X' then 'Yes'
            else 'No'
          end as IsCurrentText,

          _Employee,
          _Skills
}
