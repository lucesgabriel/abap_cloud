@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Employee'
@Metadata.allowExtensions: true

define root view entity ZC_GLUCES_EMPL2
  as select from ZI_GLUCES_EMPL2
  composition [0..*] of ZC_GLUCES_PROJ2 as _Projects
{
      key Emplid,
          Fname,
          Lname,
          Gender,
          Designation,
          Fullname,

          _Contact.PhoneNum    as PhoneNum,
          _Contact.AltPhoneNum as AltPhoneNum,
          _Contact.EmailId     as EmailId,
          _Contact.AltEmailId  as AltEmailId,

          _Address.Street      as Street,
          _Address.City        as City,
          _Address.Country     as Country,

          _Projects
}
