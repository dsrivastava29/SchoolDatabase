---Insert Values in dimDate
use School_K12_Performance
GO
Insert into dbo.dimDate
	Select * from Schools_K12_DW.dbo.dimDate

--Insert values in dimSubject
use School_K12_Performance
GO
Insert into dbo.dimSubject(SubjectID, SubjectCode,SubjectName)
	Select SubjectID, SubjectCode, SubjectName from Schools_K12_DW.dbo.dimSubject
	

---Insert Values in dimCourse
use School_K12_Performance
GO
SET IDENTITY_INSERT dbo.dimCourse ON
Insert into dbo.dimCourse(CourseID,SubjectID,CourseSISID, CourseTitle,CourseLevel)
	Select CourseID,SubjectID,CourseSISID, CourseTitle,CourseLevel from Schools_K12_DW.dbo.dimCourse
SET IDENTITY_INSERT dbo.dimCourse OFF	
---Insert Values in dimGradeType
use School_K12_Performance
GO
Insert into dbo.dimGradeType
	Select * from Schools_K12_DW.dbo.dimGradeType

---Insert Values in dimHSGTDomain
use School_K12_Performance
GO
Insert into dbo.dimHSGTDomain(HSGTDomain,SubjectID)
	Select HSGTDomain,SubjectID from Schools_K12_DW.dbo.dimHSGTDomain

--Insert Values in dimParent
use School_K12_Performance
GO
Insert into dbo.dimParent(ParentID,ParentName,Phone,email,ParentUsername)
	Select StudentID,'parent'+StudentName, '10000'+StudentID,StudentFirstName+'@pr.org',CAST(StudentID AS varchar(5))  from Schools_K12_DW.dbo.dimStudent

---Insert Values in dimPeriod
use School_K12_Performance
GO
Insert into dbo.dimPeriod
	Select * from Schools_K12_DW.dbo.dimPeriod	

---Insert Values in dimStudent
use School_K12_Performance
GO
Insert into dbo.dimStudent
(StudentID,SISStudentID,StudentName,StudentFirstName,StudentLastName,BirthDate,Gender,EthnicityCode,
Ethnicity,ESOL,FreeReducedLunch,HomeroomStaffID,FacilityID,Grade,AssignmentID,EnrollmentCodeID,EnrollmentDate,
WithdrawalCodeID,WithdrawalDate,EffectiveDate,EndDate,StudentMiddleName,StudentNameSuffix,StudentPhone,
StudentSSN,Address1,City,State,Zip,AdultEmploymentStatus,AdultLEP,AttendancePeriodID,AudiologyServiceEarlyIntervention,
BirthCountry,BirthPlace,BirthState,CitizenshipStatus,EarlyAdmission,EconomicDisadvantage,ELLCode,
ELLCodeDesc,FederalImpactCode,FederalImpactCodeDesc,GiftedStudent,GraduationPlanYear,GraduationOption,HomeLanguage,
HomelessStudent,HomelessUnaccompaniedYouth,Homeroom,HomeSchoolTaught,HouseholdNumber,IncarceratedStudent,KGReadiness,
MaritalStatus,MedicaidSpecServices,MedicalServEarlyIntervention,MigrantStatus,MissingChild,NationalAchieveScholar,NationalHispanicScholar,NationalMeritScholar,EarlyIntervention,EarlyExceptionalities,OutOfDistrict,Exceptionality,PrimaryLanguage,
ResidentStatus,SecondLanguage,RefID,oldSID,SchoolYear,WithdrawalFlag,ParentId)
	Select StudentID,SISStudentID,StudentName,StudentFirstName,StudentLastName,BirthDate,Gender,EthnicityCode,
Ethnicity,ESOL,FreeReducedLunch,HomeroomStaffID,FacilityID,Grade,AssignmentID,EnrollmentCodeID,EnrollmentDate,
WithdrawalCodeID,WithdrawalDate,EffectiveDate,EndDate,StudentMiddleName,StudentNameSuffix,StudentPhone,
StudentSSN,Address1,City,State,Zip,AdultEmploymentStatus,AdultLEP,AttendancePeriodID,AudiologyServiceEarlyIntervention,
BirthCountry,BirthPlace,BirthState,CitizenshipStatus,EarlyAdmission,EconomicDisadvantage,ELLCode,
ELLCodeDesc,FederalImpactCode,FederalImpactCodeDesc,GiftedStudent,GraduationPlanYear,GraduationOption,HomeLanguage,
HomelessStudent,HomelessUnaccompaniedYouth,Homeroom,HomeSchoolTaught,HouseholdNumber,IncarceratedStudent,KGReadiness,
MaritalStatus,MedicaidSpecServices,MedicalServEarlyIntervention,MigrantStatus,MissingChild,NationalAchieveScholar,NationalHispanicScholar,NationalMeritScholar,EarlyIntervention,EarlyExceptionalities,OutOfDistrict,Exceptionality,PrimaryLanguage,
ResidentStatus,SecondLanguage,RefID,oldSID,SchoolYear,WithdrawalFlag,StudentID
	from Schools_K12_DW.dbo.dimStudent
	
---Insert Values in factStudentCourse
use School_K12_Performance
GO
SET IDENTITY_INSERT dbo.factStudentCourse ON
Insert into dbo.factStudentCourse
(StudentCourseID,StudentID,SISStudentID,CourseID,StaffID,FacilityID,
PeriodID,CourseDate,EnrollmentDate,EnrollmentCodeID,WithdrawalDate,
WithdrawalCodeID,GradeLevel,ParentId
)
Select StudentCourseID,StudentID,SISStudentID,CourseID,StaffID,FacilityID,
PeriodID,CourseDate,EnrollmentDate,EnrollmentCodeID,WithdrawalDate,
WithdrawalCodeID,GradeLevel,StudentID from Schools_K12_DW.dbo.factStudentCourse
SET IDENTITY_INSERT dbo.factStudentCourse OFF

---Insert Values in factStudentCourseGrade
use School_K12_Performance
GO
SET IDENTITY_INSERT dbo.factStudentCourseGrade ON
Insert into dbo.factStudentCourseGrade
(
StudentCourseGradeID,
StudentCourseID,
GradeTypeID,
CreditAttempted,
CreditGiven,
NumericGrade,
AlphaGrade,
AlphaNumericGrade
)
	Select StudentCourseGradeID,StudentCourseID,GradeTypeID,CreditAttempted,CreditGiven,
NumericGrade,AlphaGrade,AlphaNumericGrade from Schools_K12_DW.dbo.factStudentCourseGrade	
SET IDENTITY_INSERT dbo.factStudentCourseGrade OFF

---Insert Values in factHSGTDomainScore
use School_K12_Performance
GO
Insert into dbo.factHSGTDomainScore(HSGTScoreID,HSGTDomainID,DomainRawScore,PossibleDomainRawScore)
	Select HSGTScoreID,HSGTDomainID,DomainRawScore,PossibleDomainRawScore from Schools_K12_DW.dbo.factHSGTDomainScore

---Insert Values in factHSGTScore
use School_K12_Performance
GO
Insert into dbo.factHSGTScore
(
StudentID,SISStudentID,TestDate,SubjectID,RawScore,PossibleRawScore,ScaledScore,PossibleScaledScore,
PassFail,TimesTested,LatestTest,ParentId
)
	Select StudentID,SISStudentID,TestDate,SubjectID,RawScore,PossibleRawScore,ScaledScore,PossibleScaledScore,
PassFail,TimesTested,LatestTest,StudentID from Schools_K12_DW.dbo.factHSGTScore

---Insert Values in factStandardizedTestDomainScore
use School_K12_Performance
GO
Insert into dbo.factStandardizedTestDomainScore
	Select * from Schools_K12_DW.dbo.factStandardizedTestDomainScore

---Insert Values in factStandardizedTestScore
use School_K12_Performance
GO
Insert into dbo.factStandardizedTestScore
(
StandardizedTestScoreID,StudentID,SISStudentID,TestDate,SubjectID,RawScore,PossibleRawScore,
ScaledScore,PossibleScaledScore,PerformanceLevel,Lexile,LatestTest,ParentId
)
	Select StandardizedTestScoreID,StudentID,SISStudentID,TestDate,SubjectID,RawScore,PossibleRawScore,
ScaledScore,PossibleScaledScore,PerformanceLevel,Lexile,LatestTest,StudentID from Schools_K12_DW.dbo.factStandardizedTestScore

School_K12_Performance
	

