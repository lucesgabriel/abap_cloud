@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - Contact Info'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity ZI_GLUCES_EMPL2
  as select from zdb_gluces_empl2
  association [0..1] to ZI_GLUCES_CONT2 as _Contact  on $projection.Emplid = _Contact.Emplid
  association [0..1] to ZI_GLUCES_ADDR2 as _Address  on $projection.Emplid = _Address.Emplid
  association [0..*] to ZI_GLUCES_PROJ2 as _Projects on $projection.Emplid = _Projects.Emplid
{
    key emplid      as Emplid,
    fname           as Fname,
    lname           as Lname,
    gender          as Gender,
    designation     as Designation,
    concat_with_space( fname, lname, 1 ) as Fullname,
    
    _Contact,
    _Address,
    _Projects
}
