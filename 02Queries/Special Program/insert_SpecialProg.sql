---Insert Values in dimSpecialProgram
use School_K12_SpecialProgram
GO
Insert into dbo.dimSpecialProgram
	Select * from Schools_K12_DW.dbo.dimSpecialProgram

---Insert Values in dimStudent
use School_K12_SpecialProgram
GO
Insert into dbo.dimStudent
(StudentID,SISStudentID,StudentName,StudentFirstName,StudentLastName,BirthDate,Gender,EthnicityCode,Ethnicity,ESOL,
FacilityID,Grade,EffectiveDate,EndDate,StudentMiddleName,StudentNameSuffix,StudentPhone,StudentSSN,Address1,City,
State,Zip,BirthCountry,BirthPlace,BirthState,CitizenshipStatus,GiftedStudent,GraduationPlanYear,GraduationOption,
HomeLanguage,HomelessStudent,HomelessUnaccompaniedYouth,MaritalStatus,MigrantStatus,MissingChild,OutOfDistrict,
PrimaryLanguage,ResidentStatus,SecondLanguage,RefID,oldSID,SchoolYear)
	Select StudentID,SISStudentID,StudentName,StudentFirstName,StudentLastName,BirthDate,Gender,EthnicityCode,Ethnicity,ESOL,
FacilityID,Grade,EffectiveDate,EndDate,StudentMiddleName,StudentNameSuffix,StudentPhone,StudentSSN,Address1,City,
State,Zip,BirthCountry,BirthPlace,BirthState,CitizenshipStatus,GiftedStudent,GraduationPlanYear,GraduationOption,
HomeLanguage,HomelessStudent,HomelessUnaccompaniedYouth,MaritalStatus,MigrantStatus,MissingChild,OutOfDistrict,
PrimaryLanguage,ResidentStatus,SecondLanguage,RefID,oldSID,SchoolYear
	from Schools_K12_DW.dbo.dimStudent

---Insert Values in factSpecialProgram

use School_K12_SpecialProgram
GO
Insert into dbo.factSpecialProgram(SpecialProgramID,ProgramID,StudentID,SISStudentID,EntryDate)
	Select SpecialProgramID,ProgramID,StudentID,SISStudentID,EntryDate from Schools_K12_DW.dbo.factSpecialProgram
