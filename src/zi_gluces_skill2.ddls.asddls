@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - Skill Info'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity ZI_GLUCES_SKILL2
  as select from zdb_gluces_skil2
{
    key emplid       as Emplid,
    key projid       as Projid,
    key skillid      as Skillid,
    skill_level      as SkillLevel,
    is_primary       as IsPrimary,
    is_certified     as IsCertified
}
