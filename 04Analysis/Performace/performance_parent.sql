USE [School_K12_Performance]
GO
---Parent
IF object_id(N'dbo.GetStudentGradePerformanceByParent', N'IF') IS NOT NULL
DROP FUNCTION [dbo].[GetStudentGradePerformanceByParent]
GO
IF object_id(N'dbo.GetStudentTestPerformanceByParent', N'IF') IS NOT NULL
DROP FUNCTION [dbo].[GetStudentTestPerformanceByParent]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Student Course Grades for parent
CREATE FUNCTION [dbo].[GetStudentGradePerformanceByParent] (@Parent int)
RETURNS TABLE
AS
RETURN 
(
	SELECT fsc.StudentCourseID,STu.StudentName,co.CourseID,co.CourseTitle,
	sub.SubjectName,
	dgt.GradeType,fscg.NumericGrade,fscg.AlphaNumericGrade,fscg.AlphaGrade,
	fsc.GradeLevel,fsc.CourseDate,fsc.EnrollmentDate,fsc.WithdrawalDate
	FROM factStudentCourse fsc
	INNER JOIN factStudentCourseGrade fscg
	ON fscg.StudentCourseID=fsc.StudentCourseID
	INNER JOIN dimCourse co
	ON co.CourseID=fsc.CourseID
	INNER JOIN dimGradeType dgt
	ON fscg.GradeTypeID=dgt.GradeTypeID
	INNER JOIN dimStudent stu
	ON fsc.StudentID=stu.StudentID
	INNER JOIN dimSubject sub
	ON co.SubjectID=sub.SubjectID
	where stu.ParentId=@Parent
	);
GO
--Student Course Test performace for Parent
CREATE FUNCTION [dbo].[GetStudentTestPerformanceByParent] (@Parent int)
RETURNS TABLE
AS
RETURN 
(
		SELECT stu.StudentName ,sts.RawScore,sts.PossibleRawScore,sts.PossibleScaledScore,sts.ScaledScore,
		hsgt.TestDate, sub.SubjectName
		FROM dimStudent stu 
		JOIN  FactStandardizedTestScore sts
		ON stu.studentID = sts.studentID
		JOIN factHSGTScore hsgt
		ON sts.SubjectID = hsgt.SubjectID 
		JOIN dimSubject sub
		ON hsgt.SubjectID = sub.SubjectID 
		WHERE stu.ParentId=@Parent
		GROUP BY stu.StudentName ,sts.RawScore,sts.PossibleRawScore,sts.PossibleScaledScore,sts.ScaledScore,
		hsgt.TestDate, sub.SubjectName
	);
GO

--Student Course Grades for parent
SELECT * from GetStudentGradePerformanceByParent(12) ORDER BY GradeType;
GO

--Student Course Test performace for Parent
SELECT * from GetStudentTestPerformanceByParent(12) ORDER BY TestDate DESC;
GO



