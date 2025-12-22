@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - Contact Info'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_GLUCES_CONT2
  as select from zdb_gluces_cont2
{
    key emplid        as Emplid,
    phone_num         as PhoneNum,
    alt_phone_num     as AltPhoneNum,
    email_id          as EmailId,
    alt_email_id      as AltEmailId
}
