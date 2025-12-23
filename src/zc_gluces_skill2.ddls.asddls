@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Employee Skill'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true

define view entity ZC_GLUCES_SKILL2
  as select from ZI_GLUCES_SKILL2
  association to parent ZC_GLUCES_PROJ2 as _Project 
    on  $projection.Emplid = _Project.Emplid
    and $projection.Projid = _Project.Projid
{
      key Emplid,
      key Projid,
      key Skillid,
          SkillLevel,
          IsPrimary,
          IsCertified,

          case IsPrimary
            when 'X' then 'Yes'
            else 'No'
          end as IsPrimaryText,

          case IsCertified
            when 'X' then 'Yes'
            else 'No'
          end as IsCertifiedText,

          _Project
}
