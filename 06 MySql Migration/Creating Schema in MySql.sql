CREATE DATABASE  IF NOT EXISTS `schools_k12_dw` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `schools_k12_dw`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: schools_k12_dw
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dimabsencecode`
--

DROP TABLE IF EXISTS `dimabsencecode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimabsencecode` (
  `AbsenceCodeID` int(11) NOT NULL,
  `AbsenceCode` varchar(10) DEFAULT NULL,
  `AbsenceCodeDesc` varchar(50) DEFAULT NULL,
  `Unexcused` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AbsenceCodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dimassignment`
--

DROP TABLE IF EXISTS `dimassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimassignment` (
  `AssignmentID` int(11) NOT NULL,
  `Assignment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AssignmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dimcourse`
--

DROP TABLE IF EXISTS `dimcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimcourse` (
  `CourseID` int(11) NOT NULL AUTO_INCREMENT,
  `SubjectID` int(11) DEFAULT NULL,
  `CourseSISID` varchar(50) DEFAULT NULL,
  `CourseTitle` varchar(50) DEFAULT NULL,
  `CourseLevel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CourseID`),
  KEY `dimSubject_dimCourse_FK1` (`SubjectID`),
  CONSTRAINT `dimSubject_dimCourse_FK1` FOREIGN KEY (`SubjectID`) REFERENCES `dimsubject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2914 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dimdate`
--

DROP TABLE IF EXISTS `dimdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimdate` (
  `DatePK` datetime(6) NOT NULL,
  `DateName` varchar(50) DEFAULT NULL,
  `Year` datetime(6) DEFAULT NULL,
  `YearName` varchar(50) DEFAULT NULL,
  `HalfYear` datetime(6) DEFAULT NULL,
  `HalfYearName` varchar(50) DEFAULT NULL,
  `Quarter` datetime(6) DEFAULT NULL,
  `QuarterName` varchar(50) DEFAULT NULL,
  `Month` datetime(6) DEFAULT NULL,
  `MonthName` varchar(50) DEFAULT NULL,
  `Week` datetime(6) DEFAULT NULL,
  `WeekName` varchar(50) DEFAULT NULL,
  `DayOfYear` int(11) DEFAULT NULL,
  `DayOfYearName` varchar(50) DEFAULT NULL,
  `DayOfHalfYear` int(11) DEFAULT NULL,
  `DayOfHalfYearName` varchar(50) DEFAULT NULL,
  `DayOfQuarter` int(11) DEFAULT NULL,
  `DayOfQuarterName` varchar(50) DEFAULT NULL,
  `DayOfMonth` int(11) DEFAULT NULL,
  `DayOfMonthName` varchar(50) DEFAULT NULL,
  `DayOfWeek` int(11) DEFAULT NULL,
  `DayOfWeekName` varchar(50) DEFAULT NULL,
  `WeekOfYear` int(11) DEFAULT NULL,
  `WeekOfYearName` varchar(50) DEFAULT NULL,
  `MonthOfYear` int(11) DEFAULT NULL,
  `MonthOfYearName` varchar(50) DEFAULT NULL,
  `MonthOfHalfYear` int(11) DEFAULT NULL,
  `MonthOfHalfYearName` varchar(50) DEFAULT NULL,
  `MonthOfQuarter` int(11) DEFAULT NULL,
  `MonthOfQuarterName` varchar(50) DEFAULT NULL,
  `QuarterOfYear` int(11) DEFAULT NULL,
  `QuarterOfYearName` varchar(50) DEFAULT NULL,
  `QuarterOfHalfYear` int(11) DEFAULT NULL,
  `QuarterOfHalfYearName` varchar(50) DEFAULT NULL,
  `HalfYearOfYear` int(11) DEFAULT NULL,
  `HalfYearOfYearName` varchar(50) DEFAULT NULL,
  `SchoolYear` datetime(6) DEFAULT NULL,
  `SchoolYearName` varchar(50) DEFAULT NULL,
  `SchoolHalfYear` datetime(6) DEFAULT NULL,
  `SchoolHalfYearName` varchar(50) DEFAULT NULL,
  `SchoolQuarter` datetime(6) DEFAULT NULL,
  `SchoolQuarterName` varchar(50) DEFAULT NULL,
  `SchoolMonth` datetime(6) DEFAULT NULL,
  `SchoolMonthName` varchar(50) DEFAULT NULL,
  `SchoolWeek` datetime(6) DEFAULT NULL,
  `SchoolWeekName` varchar(50) DEFAULT NULL,
  `SchoolDate` datetime(6) DEFAULT NULL,
  `SchoolDayName` varchar(50) DEFAULT NULL,
  `SchoolDayOfYear` int(11) DEFAULT NULL,
  `SchoolDayOfYearName` varchar(50) DEFAULT NULL,
  `SchoolDayOfHalfYear` int(11) DEFAULT NULL,
  `SchoolDayOfHalfYearName` varchar(50) DEFAULT NULL,
  `SchoolDayOfQuarter` int(11) DEFAULT NULL,
  `SchoolDayOfQuarterName` varchar(50) DEFAULT NULL,
  `SchoolDayOfMonth` int(11) DEFAULT NULL,
  `SchoolDayOfMonthName` varchar(50) DEFAULT NULL,
  `SchoolDayOfWeek` int(11) DEFAULT NULL,
  `SchoolDayOfWeekName` varchar(50) DEFAULT NULL,
  `SchoolWeekOfYear` int(11) DEFAULT NULL,
  `SchoolWeekOfYearName` varchar(50) DEFAULT NULL,
  `SchoolMonthOfYear` int(11) DEFAULT NULL,
  `SchoolMonthOfYearName` varchar(50) DEFAULT NULL,
  `SchoolMonthOfHalfYear` int(11) DEFAULT NULL,
  `SchoolMonthOfHalfYearName` varchar(50) DEFAULT NULL,
  `SchoolMonthOfQuarter` int(11) DEFAULT NULL,
  `SchoolMonthOfQuarterName` varchar(50) DEFAULT NULL,
  `SchoolQuarterOfYear` int(11) DEFAULT NULL,
  `SchoolQuarterOfYearName` varchar(50) DEFAULT NULL,
  `SchoolQuarterOfHalfYear` int(11) DEFAULT NULL,
  `SchoolQuarterOfHalfYearName` varchar(50) DEFAULT NULL,
  `SchoolHalfYearOfYear` int(11) DEFAULT NULL,
  `SchoolHalfYearOfYearName` varchar(50) DEFAULT NULL,
  `SchoolDay` int(11) DEFAULT NULL,
  `SchoolNineWeeks` int(11) DEFAULT NULL,
  PRIMARY KEY (`DatePK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dimdisciplineactioncode`
--

DROP TABLE IF EXISTS `dimdisciplineactioncode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimdisciplineactioncode` (
  `DisciplineActionCodeID` int(11) NOT NULL,
  `DisciplineActionCode` varchar(10) DEFAULT NULL,
  `DisciplineActionDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DisciplineActionCodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dimdisciplineeventcode`
--

DROP TABLE IF EXISTS `dimdisciplineeventcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimdisciplineeventcode` (
  `DisciplineEventCodeID` int(11) NOT NULL,
  `DisciplineEventCode` varchar(10) DEFAULT NULL,
  `DisciplineEventDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DisciplineEventCodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dimenrollmentcode`
--

DROP TABLE IF EXISTS `dimenrollmentcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimenrollmentcode` (
  `EnrollmentCodeID` int(11) NOT NULL,
  `EnrollmentCode` varchar(5) DEFAULT NULL,
  `EnrollmentCodeDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EnrollmentCodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dimfacility`
--

DROP TABLE IF EXISTS `dimfacility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimfacility` (
  `FacilityID` int(11) NOT NULL,
  `Facility` varchar(100) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Zip` varchar(20) DEFAULT NULL,
  `Active` varchar(20) DEFAULT NULL,
  `Charter` varchar(10) DEFAULT NULL,
  `FacilityADCode` varchar(50) DEFAULT NULL,
  `FacLevel` varchar(50) DEFAULT NULL,
  `FacilityName` varchar(50) DEFAULT NULL,
  `FacilityType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`FacilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dimgradetype`
--

DROP TABLE IF EXISTS `dimgradetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimgradetype` (
  `GradeTypeID` int(11) NOT NULL,
  `GradeType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`GradeTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dimhsgtdomain`
--

DROP TABLE IF EXISTS `dimhsgtdomain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimhsgtdomain` (
  `HSGTDomainID` int(11) NOT NULL AUTO_INCREMENT,
  `HSGTDomain` varchar(200) DEFAULT NULL,
  `SubjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`HSGTDomainID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dimperiod`
--

DROP TABLE IF EXISTS `dimperiod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimperiod` (
  `PeriodID` int(11) NOT NULL,
  `Period` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PeriodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dimspecialprogram`
--

DROP TABLE IF EXISTS `dimspecialprogram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimspecialprogram` (
  `ProgramID` int(11) NOT NULL,
  `ProgramCode` varchar(10) DEFAULT NULL,
  `Program` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ProgramID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dimstaff`
--

DROP TABLE IF EXISTS `dimstaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimstaff` (
  `StaffID` int(11) NOT NULL,
  `StaffTypeID` int(11) DEFAULT NULL,
  `PrimaryFacilityID` int(11) DEFAULT NULL,
  `StaffFirstName` varchar(50) DEFAULT NULL,
  `StaffLastName` varchar(50) DEFAULT NULL,
  `StaffName` varchar(100) DEFAULT NULL,
  `StaffADUsername` varchar(50) DEFAULT NULL,
  `GradeLevel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `dimFacility_dimStaff_FK1` (`PrimaryFacilityID`),
  CONSTRAINT `dimFacility_dimStaff_FK1` FOREIGN KEY (`PrimaryFacilityID`) REFERENCES `dimfacility` (`FacilityID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dimstandardizedtestdomain`
--

DROP TABLE IF EXISTS `dimstandardizedtestdomain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimstandardizedtestdomain` (
  `StandardizedTestDomainID` int(11) NOT NULL,
  `StandardizedTestDomain` varchar(50) DEFAULT NULL,
  `SubjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`StandardizedTestDomainID`),
  KEY `dimSubject_dimStandardizedTestDomain_FK1` (`SubjectID`),
  CONSTRAINT `dimSubject_dimStandardizedTestDomain_FK1` FOREIGN KEY (`SubjectID`) REFERENCES `dimsubject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dimstudent`
--

DROP TABLE IF EXISTS `dimstudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimstudent` (
  `StudentID` int(11) NOT NULL,
  `SISStudentID` int(11) DEFAULT NULL,
  `StudentName` varchar(100) DEFAULT NULL,
  `StudentFirstName` varchar(50) DEFAULT NULL,
  `StudentLastName` varchar(50) DEFAULT NULL,
  `BirthDate` datetime(6) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `EthnicityCode` varchar(5) DEFAULT NULL,
  `Ethnicity` varchar(50) DEFAULT NULL,
  `ESOL` varchar(5) DEFAULT NULL,
  `FreeReducedLunch` varchar(10) DEFAULT NULL,
  `HomeroomStaffID` int(11) DEFAULT NULL,
  `FacilityID` int(11) DEFAULT NULL,
  `Grade` varchar(5) DEFAULT NULL,
  `AssignmentID` int(11) DEFAULT NULL,
  `EnrollmentCodeID` int(11) DEFAULT NULL,
  `EnrollmentDate` datetime(6) DEFAULT NULL,
  `WithdrawalCodeID` int(11) DEFAULT NULL,
  `WithdrawalDate` datetime(6) DEFAULT NULL,
  `EffectiveDate` datetime(6) NOT NULL,
  `EndDate` datetime(6) NOT NULL,
  `StudentMiddleName` varchar(50) DEFAULT NULL,
  `StudentNameSuffix` varchar(50) DEFAULT NULL,
  `StudentPhone` varchar(50) DEFAULT NULL,
  `StudentSSN` varchar(50) DEFAULT NULL,
  `Address1` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Zip` varchar(50) DEFAULT NULL,
  `AdultEmploymentStatus` varchar(20) DEFAULT NULL,
  `AdultLEP` varchar(20) DEFAULT NULL,
  `AttendancePeriodID` int(11) DEFAULT NULL,
  `AudiologyServiceEarlyIntervention` varchar(50) DEFAULT NULL,
  `BirthCountry` varchar(50) DEFAULT NULL,
  `BirthPlace` varchar(50) DEFAULT NULL,
  `BirthState` varchar(50) DEFAULT NULL,
  `CitizenshipStatus` varchar(20) DEFAULT NULL,
  `EarlyAdmission` varchar(50) DEFAULT NULL,
  `EconomicDisadvantage` varchar(50) DEFAULT NULL,
  `ELLCode` varchar(20) DEFAULT NULL,
  `ELLCodeDesc` varchar(50) DEFAULT NULL,
  `FederalImpactCode` varchar(20) DEFAULT NULL,
  `FederalImpactCodeDesc` varchar(50) DEFAULT NULL,
  `GiftedStudent` varchar(50) DEFAULT NULL,
  `GraduationPlanYear` varchar(10) DEFAULT NULL,
  `GraduationOption` varchar(50) DEFAULT NULL,
  `HomeLanguage` varchar(50) DEFAULT NULL,
  `HomelessStudent` varchar(50) DEFAULT NULL,
  `HomelessUnaccompaniedYouth` varchar(50) DEFAULT NULL,
  `Homeroom` varchar(50) DEFAULT NULL,
  `HomeSchoolTaught` varchar(50) DEFAULT NULL,
  `HouseholdNumber` varchar(10) DEFAULT NULL,
  `IncarceratedStudent` varchar(50) DEFAULT NULL,
  `KGReadiness` varchar(50) DEFAULT NULL,
  `MaritalStatus` varchar(10) DEFAULT NULL,
  `MedicaidSpecServices` varchar(50) DEFAULT NULL,
  `MedicalServEarlyIntervention` varchar(50) DEFAULT NULL,
  `MigrantStatus` varchar(50) DEFAULT NULL,
  `MissingChild` varchar(50) DEFAULT NULL,
  `NationalAchieveScholar` varchar(10) DEFAULT NULL,
  `NationalHispanicScholar` varchar(10) DEFAULT NULL,
  `NationalMeritScholar` varchar(10) DEFAULT NULL,
  `EarlyIntervention` varchar(50) DEFAULT NULL,
  `EarlyExceptionalities` varchar(50) DEFAULT NULL,
  `OutOfDistrict` varchar(10) DEFAULT NULL,
  `Exceptionality` varchar(50) DEFAULT NULL,
  `PrimaryLanguage` varchar(50) DEFAULT NULL,
  `ResidentStatus` varchar(10) DEFAULT NULL,
  `SecondLanguage` varchar(50) DEFAULT NULL,
  `RefID` int(11) DEFAULT NULL,
  `oldSID` int(11) DEFAULT NULL,
  `SchoolYear` int(11) DEFAULT NULL,
  `WithdrawalFlag` int(11) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `dimStaff_dimStudent_FK1` (`HomeroomStaffID`),
  KEY `dimDate_dimStudent_FK1` (`EnrollmentDate`),
  KEY `dimDate_dimStudent_FK2` (`WithdrawalDate`),
  KEY `dimWithdrawalCode_dimStudent_FK1` (`WithdrawalCodeID`),
  KEY `dimEnrollmentCode_dimStudent_FK1` (`EnrollmentCodeID`),
  KEY `dimAssignment_dimStudent_FK1` (`AssignmentID`),
  KEY `dimFacility_dimStudent_FK1` (`FacilityID`),
  KEY `dimDate_dimStudent_FK3` (`BirthDate`),
  CONSTRAINT `dimAssignment_dimStudent_FK1` FOREIGN KEY (`AssignmentID`) REFERENCES `dimassignment` (`AssignmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimDate_dimStudent_FK1` FOREIGN KEY (`EnrollmentDate`) REFERENCES `dimdate` (`DatePK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimDate_dimStudent_FK2` FOREIGN KEY (`WithdrawalDate`) REFERENCES `dimdate` (`DatePK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimDate_dimStudent_FK3` FOREIGN KEY (`BirthDate`) REFERENCES `dimdate` (`DatePK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimEnrollmentCode_dimStudent_FK1` FOREIGN KEY (`EnrollmentCodeID`) REFERENCES `dimenrollmentcode` (`EnrollmentCodeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimFacility_dimStudent_FK1` FOREIGN KEY (`FacilityID`) REFERENCES `dimfacility` (`FacilityID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimStaff_dimStudent_FK1` FOREIGN KEY (`HomeroomStaffID`) REFERENCES `dimstaff` (`StaffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimWithdrawalCode_dimStudent_FK1` FOREIGN KEY (`WithdrawalCodeID`) REFERENCES `dimwithdrawalcode` (`WithdrawalCodeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dimsubject`
--

DROP TABLE IF EXISTS `dimsubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimsubject` (
  `SubjectID` int(11) NOT NULL,
  `SubjectCode` varchar(50) DEFAULT NULL,
  `SubjectName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`SubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dimwithdrawalcode`
--

DROP TABLE IF EXISTS `dimwithdrawalcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimwithdrawalcode` (
  `WithdrawalCodeID` int(11) NOT NULL,
  `WithdrawalCode` varchar(5) DEFAULT NULL,
  `WithdrawalCodeDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`WithdrawalCodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factabsence`
--

DROP TABLE IF EXISTS `factabsence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factabsence` (
  `AbsenceID` int(11) NOT NULL AUTO_INCREMENT,
  `AbsenceDate` datetime(6) DEFAULT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `SISStudentID` int(11) DEFAULT NULL,
  `AbsenceCodeID` int(11) DEFAULT NULL,
  `AbsenceCount` int(11) DEFAULT NULL,
  `FacilityID` int(11) DEFAULT NULL,
  `StaffID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AbsenceID`),
  KEY `dimStudent_factAbsence_FK1` (`StudentID`),
  KEY `dimFacility_factAbsence_FK1` (`FacilityID`),
  KEY `dimStaff_factAbsence_FK1` (`StaffID`),
  KEY `dimDate_factAbsence_FK1` (`AbsenceDate`),
  KEY `dimAbsenceCode_factAbsence_FK1` (`AbsenceCodeID`),
  CONSTRAINT `dimAbsenceCode_factAbsence_FK1` FOREIGN KEY (`AbsenceCodeID`) REFERENCES `dimabsencecode` (`AbsenceCodeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimDate_factAbsence_FK1` FOREIGN KEY (`AbsenceDate`) REFERENCES `dimdate` (`DatePK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimFacility_factAbsence_FK1` FOREIGN KEY (`FacilityID`) REFERENCES `dimfacility` (`FacilityID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimStaff_factAbsence_FK1` FOREIGN KEY (`StaffID`) REFERENCES `dimstaff` (`StaffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimStudent_factAbsence_FK1` FOREIGN KEY (`StudentID`) REFERENCES `dimstudent` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43899 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factdiscipline`
--

DROP TABLE IF EXISTS `factdiscipline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factdiscipline` (
  `DisciplineID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) DEFAULT NULL,
  `SISStudentID` int(11) DEFAULT NULL,
  `EventFacilityID` int(11) DEFAULT NULL,
  `DisciplineEventCodeID` int(11) DEFAULT NULL,
  `EventDate` datetime(6) DEFAULT NULL,
  `EventReportingStaffID` int(11) DEFAULT NULL,
  `DisciplineActionCodeID` int(11) DEFAULT NULL,
  `ActionDate` datetime(6) DEFAULT NULL,
  `ActionStaffID` int(11) DEFAULT NULL,
  `ResolutionDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`DisciplineID`),
  KEY `dimStudent_factDiscipline_FK1` (`StudentID`),
  KEY `dimFacility_factDiscipline_FK1` (`EventFacilityID`),
  KEY `dimDisciplineEventCode_factDiscipline_FK1` (`DisciplineEventCodeID`),
  KEY `dimDisciplineActionCode_factDiscipline_FK1` (`DisciplineActionCodeID`),
  KEY `dimDate_factDiscipline_FK1` (`EventDate`),
  KEY `dimDate_factDiscipline_FK2` (`ActionDate`),
  KEY `dimDate_factDiscipline_FK3` (`ResolutionDate`),
  KEY `dimStaff_factDiscipline_FK1` (`EventReportingStaffID`),
  KEY `dimStaff_factDiscipline_FK2` (`ActionStaffID`),
  CONSTRAINT `dimDate_factDiscipline_FK1` FOREIGN KEY (`EventDate`) REFERENCES `dimdate` (`DatePK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimDate_factDiscipline_FK2` FOREIGN KEY (`ActionDate`) REFERENCES `dimdate` (`DatePK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimDate_factDiscipline_FK3` FOREIGN KEY (`ResolutionDate`) REFERENCES `dimdate` (`DatePK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimDisciplineActionCode_factDiscipline_FK1` FOREIGN KEY (`DisciplineActionCodeID`) REFERENCES `dimdisciplineactioncode` (`DisciplineActionCodeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimDisciplineEventCode_factDiscipline_FK1` FOREIGN KEY (`DisciplineEventCodeID`) REFERENCES `dimdisciplineeventcode` (`DisciplineEventCodeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimFacility_factDiscipline_FK1` FOREIGN KEY (`EventFacilityID`) REFERENCES `dimfacility` (`FacilityID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimStaff_factDiscipline_FK1` FOREIGN KEY (`EventReportingStaffID`) REFERENCES `dimstaff` (`StaffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimStaff_factDiscipline_FK2` FOREIGN KEY (`ActionStaffID`) REFERENCES `dimstaff` (`StaffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimStudent_factDiscipline_FK1` FOREIGN KEY (`StudentID`) REFERENCES `dimstudent` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1904 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facthsgtdomainscore`
--

DROP TABLE IF EXISTS `facthsgtdomainscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facthsgtdomainscore` (
  `HSGTDomainScoreID` int(11) NOT NULL AUTO_INCREMENT,
  `HSGTScoreID` int(11) NOT NULL,
  `HSGTDomainID` int(11) NOT NULL,
  `DomainRawScore` decimal(10,2) DEFAULT NULL,
  `PossibleDomainRawScore` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`HSGTDomainScoreID`),
  KEY `FK_factHSGTDomainScore_factHSGTScore` (`HSGTScoreID`),
  KEY `FK_factHSGTDomainScore_dimHSGTDomain` (`HSGTDomainID`),
  CONSTRAINT `FK_factHSGTDomainScore_dimHSGTDomain` FOREIGN KEY (`HSGTDomainID`) REFERENCES `dimhsgtdomain` (`HSGTDomainID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_factHSGTDomainScore_factHSGTScore` FOREIGN KEY (`HSGTScoreID`) REFERENCES `facthsgtscore` (`HSGTScoreID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12365 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facthsgtscore`
--

DROP TABLE IF EXISTS `facthsgtscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facthsgtscore` (
  `HSGTScoreID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NOT NULL,
  `SISStudentID` int(11) DEFAULT NULL,
  `TestDate` datetime(6) DEFAULT NULL,
  `SubjectID` int(11) DEFAULT NULL,
  `RawScore` decimal(10,2) DEFAULT NULL,
  `PossibleRawScore` decimal(10,2) DEFAULT NULL,
  `ScaledScore` decimal(10,2) DEFAULT NULL,
  `PossibleScaledScore` decimal(10,2) DEFAULT NULL,
  `PassFail` varchar(50) DEFAULT NULL,
  `TimesTested` int(11) DEFAULT NULL,
  `LatestTest` int(11) DEFAULT NULL,
  PRIMARY KEY (`HSGTScoreID`),
  KEY `FK_factHSGTScore_dimStudent` (`StudentID`),
  KEY `FK_factHSGTScore_dimDate` (`TestDate`),
  KEY `FK_factHSGTScore_dimSubject` (`SubjectID`),
  CONSTRAINT `FK_factHSGTScore_dimDate` FOREIGN KEY (`TestDate`) REFERENCES `dimdate` (`DatePK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_factHSGTScore_dimStudent` FOREIGN KEY (`StudentID`) REFERENCES `dimstudent` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_factHSGTScore_dimSubject` FOREIGN KEY (`SubjectID`) REFERENCES `dimsubject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factschoolkpi`
--

DROP TABLE IF EXISTS `factschoolkpi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factschoolkpi` (
  `SchoolKPIID` int(11) NOT NULL AUTO_INCREMENT,
  `EffectiveDate` datetime(6) NOT NULL,
  `FacilityID` int(11) NOT NULL,
  `TargetStudentAttendancePct` int(11) NOT NULL,
  `TargetStandardizedTestScaledScore` int(11) NOT NULL,
  `TargetEnrollmentCount` int(11) NOT NULL,
  PRIMARY KEY (`SchoolKPIID`),
  KEY `FK_factSchoolKPI_dimFacility` (`FacilityID`),
  KEY `FK_factSchoolKPI_dimDate` (`EffectiveDate`),
  CONSTRAINT `FK_factSchoolKPI_dimDate` FOREIGN KEY (`EffectiveDate`) REFERENCES `dimdate` (`DatePK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_factSchoolKPI_dimFacility` FOREIGN KEY (`FacilityID`) REFERENCES `dimfacility` (`FacilityID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factspecialprogram`
--

DROP TABLE IF EXISTS `factspecialprogram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factspecialprogram` (
  `SpecialProgramID` int(11) NOT NULL,
  `ProgramID` int(11) DEFAULT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `SISStudentID` int(11) DEFAULT NULL,
  `EntryDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`SpecialProgramID`),
  KEY `dimStudent_factSpecialProgram_FK1` (`StudentID`),
  KEY `dimDate_factSpecialProgram_FK1` (`EntryDate`),
  KEY `dimSpecialProgram_factSpecialProgram_FK1` (`ProgramID`),
  CONSTRAINT `dimDate_factSpecialProgram_FK1` FOREIGN KEY (`EntryDate`) REFERENCES `dimdate` (`DatePK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimSpecialProgram_factSpecialProgram_FK1` FOREIGN KEY (`ProgramID`) REFERENCES `dimspecialprogram` (`ProgramID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimStudent_factSpecialProgram_FK1` FOREIGN KEY (`StudentID`) REFERENCES `dimstudent` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factstandardizedtestdomainscore`
--

DROP TABLE IF EXISTS `factstandardizedtestdomainscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factstandardizedtestdomainscore` (
  `StandardizedTestDomainScoreID` int(11) NOT NULL,
  `StandardizedTestScoreID` int(11) DEFAULT NULL,
  `StandardizedTestDomainID` int(11) DEFAULT NULL,
  `RawScore` decimal(10,2) DEFAULT NULL,
  `PossibleRawScore` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`StandardizedTestDomainScoreID`),
  KEY `factStandardizedTestScore_factStandardizedTestDomainScore_FK1` (`StandardizedTestScoreID`),
  KEY `dimStandardizedTestDomain_factStandardizedTestDomainScore_FK1` (`StandardizedTestDomainID`),
  CONSTRAINT `dimStandardizedTestDomain_factStandardizedTestDomainScore_FK1` FOREIGN KEY (`StandardizedTestDomainID`) REFERENCES `dimstandardizedtestdomain` (`StandardizedTestDomainID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `factStandardizedTestScore_factStandardizedTestDomainScore_FK1` FOREIGN KEY (`StandardizedTestScoreID`) REFERENCES `factstandardizedtestscore` (`StandardizedTestScoreID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factstandardizedtestscore`
--

DROP TABLE IF EXISTS `factstandardizedtestscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factstandardizedtestscore` (
  `StandardizedTestScoreID` int(11) NOT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `SISStudentID` int(11) DEFAULT NULL,
  `TestDate` datetime(6) DEFAULT NULL,
  `SubjectID` int(11) DEFAULT NULL,
  `RawScore` decimal(10,2) DEFAULT NULL,
  `PossibleRawScore` decimal(10,2) DEFAULT NULL,
  `ScaledScore` decimal(10,2) DEFAULT NULL,
  `PossibleScaledScore` decimal(10,2) DEFAULT NULL,
  `PerformanceLevel` decimal(10,2) DEFAULT NULL,
  `Lexile` varchar(50) DEFAULT NULL,
  `LatestTest` int(11) DEFAULT NULL,
  PRIMARY KEY (`StandardizedTestScoreID`),
  KEY `dimStudent_factStandardizedTestScore_FK1` (`StudentID`),
  KEY `dimSubject_factStandardizedTestScore_FK1` (`SubjectID`),
  KEY `dimDate_factStandardizedTestScore_FK1` (`TestDate`),
  CONSTRAINT `dimDate_factStandardizedTestScore_FK1` FOREIGN KEY (`TestDate`) REFERENCES `dimdate` (`DatePK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimStudent_factStandardizedTestScore_FK1` FOREIGN KEY (`StudentID`) REFERENCES `dimstudent` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimSubject_factStandardizedTestScore_FK1` FOREIGN KEY (`SubjectID`) REFERENCES `dimsubject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factstudentcourse`
--

DROP TABLE IF EXISTS `factstudentcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factstudentcourse` (
  `StudentCourseID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) DEFAULT NULL,
  `SISStudentID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `StaffID` int(11) DEFAULT NULL,
  `FacilityID` int(11) DEFAULT NULL,
  `PeriodID` int(11) DEFAULT NULL,
  `CourseDate` datetime(6) DEFAULT NULL,
  `EnrollmentDate` datetime(6) DEFAULT NULL,
  `EnrollmentCodeID` int(11) DEFAULT NULL,
  `WithdrawalDate` datetime(6) DEFAULT NULL,
  `WithdrawalCodeID` int(11) DEFAULT NULL,
  `GradeLevel` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`StudentCourseID`),
  KEY `dimWithdrawalCode_factStudentCourse_FK1` (`WithdrawalCodeID`),
  KEY `dimCourse_factStudentCourse_FK1` (`CourseID`),
  KEY `dimStudent_factStudentCourse_FK1` (`StudentID`),
  KEY `dimStaff_factStudentCourse_FK1` (`StaffID`),
  KEY `dimFacility_factStudentCourse_FK1` (`FacilityID`),
  KEY `dimPeriod_factStudentCourse_FK1` (`PeriodID`),
  KEY `dimDate_factStudentCourse_FK1` (`CourseDate`),
  KEY `dimDate_factStudentCourse_FK2` (`EnrollmentDate`),
  KEY `dimDate_factStudentCourse_FK3` (`WithdrawalDate`),
  KEY `dimEnrollmentCode_factStudentCourse_FK1` (`EnrollmentCodeID`),
  CONSTRAINT `dimCourse_factStudentCourse_FK1` FOREIGN KEY (`CourseID`) REFERENCES `dimcourse` (`CourseID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimDate_factStudentCourse_FK1` FOREIGN KEY (`CourseDate`) REFERENCES `dimdate` (`DatePK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimDate_factStudentCourse_FK2` FOREIGN KEY (`EnrollmentDate`) REFERENCES `dimdate` (`DatePK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimDate_factStudentCourse_FK3` FOREIGN KEY (`WithdrawalDate`) REFERENCES `dimdate` (`DatePK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimEnrollmentCode_factStudentCourse_FK1` FOREIGN KEY (`EnrollmentCodeID`) REFERENCES `dimenrollmentcode` (`EnrollmentCodeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimFacility_factStudentCourse_FK1` FOREIGN KEY (`FacilityID`) REFERENCES `dimfacility` (`FacilityID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimPeriod_factStudentCourse_FK1` FOREIGN KEY (`PeriodID`) REFERENCES `dimperiod` (`PeriodID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimStaff_factStudentCourse_FK1` FOREIGN KEY (`StaffID`) REFERENCES `dimstaff` (`StaffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimStudent_factStudentCourse_FK1` FOREIGN KEY (`StudentID`) REFERENCES `dimstudent` (`StudentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dimWithdrawalCode_factStudentCourse_FK1` FOREIGN KEY (`WithdrawalCodeID`) REFERENCES `dimwithdrawalcode` (`WithdrawalCodeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=133608 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factstudentcoursegrade`
--

DROP TABLE IF EXISTS `factstudentcoursegrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factstudentcoursegrade` (
  `StudentCourseGradeID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentCourseID` int(11) DEFAULT NULL,
  `GradeTypeID` int(11) DEFAULT NULL,
  `CreditAttempted` decimal(10,2) DEFAULT NULL,
  `CreditGiven` decimal(10,2) DEFAULT NULL,
  `NumericGrade` decimal(10,2) DEFAULT NULL,
  `AlphaGrade` varchar(5) DEFAULT NULL,
  `AlphaNumericGrade` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`StudentCourseGradeID`),
  KEY `factStudentCourse_factStudentCourseGrade_FK1` (`StudentCourseID`),
  KEY `dimGradeType_factStudentCourseGrade_FK1` (`GradeTypeID`),
  CONSTRAINT `dimGradeType_factStudentCourseGrade_FK1` FOREIGN KEY (`GradeTypeID`) REFERENCES `dimgradetype` (`GradeTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `factStudentCourse_factStudentCourseGrade_FK1` FOREIGN KEY (`StudentCourseID`) REFERENCES `factstudentcourse` (`StudentCourseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=102331 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sysdiagrams`
--

DROP TABLE IF EXISTS `sysdiagrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysdiagrams` (
  `name` varchar(160) NOT NULL,
  `principal_id` int(11) NOT NULL,
  `diagram_id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `definition` longblob,
  PRIMARY KEY (`diagram_id`),
  UNIQUE KEY `UK_principal_name` (`principal_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tempstaffsubject`
--

DROP TABLE IF EXISTS `tempstaffsubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tempstaffsubject` (
  `SubjectID` int(11) NOT NULL,
  `StaffID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'schools_k12_dw'
--

--
-- Dumping routines for database 'schools_k12_dw'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-26 22:12:18
