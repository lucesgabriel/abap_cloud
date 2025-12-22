@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - Project Info'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity ZI_GLUCES_PROJ2
  as select from zdb_gluces_proj2
  association [0..*] to ZI_GLUCES_SKILL2 as _Skills on  $projection.Emplid = _Skills.Emplid
                                                 and $projection.Projid = _Skills.Projid
{
    key emplid       as Emplid,
    key projid       as Projid,
    project_name     as ProjectName,
    project_type     as ProjectType,
    is_current       as IsCurrent,
    duration         as Duration,
    
    _Skills
}
