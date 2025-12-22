@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Employee'

@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
define view entity ZC_GLUCES_EMPL2 as select from ZI_GLUCES_EMPL2
{
    key Emplid,
    Fname,
    Lname,
    Gender,
    Designation,
    Fullname,
    
    // Campos de Contact
    _Contact.PhoneNum     as PhoneNum,
    _Contact.AltPhoneNum  as AltPhoneNum,
    _Contact.EmailId      as EmailId,
    _Contact.AltEmailId   as AltEmailId,
    
    // Campos de Address
    _Address.Street       as Street,
    _Address.City         as City,
    _Address.Country      as Country,
    
    // Asociaciones
    _Contact,
    _Address,
    _Projects
}
