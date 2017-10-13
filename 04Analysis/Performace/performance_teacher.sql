USE [School_K12_Performance]
GO
---Teacher
IF object_id(N'dbo.GetCourseAndStudentByStaff', N'IF') IS NOT NULL
DROP FUNCTION [dbo].[GetCourseAndStudentByStaff]
GO
IF object_id(N'dbo.GetStudentPerformanceByStaff', N'IF') IS NOT NULL
DROP FUNCTION [dbo].[GetStudentPerformanceByStaff]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Get All student and courses under Teacher (by StaffID)
CREATE FUNCTION [dbo].[GetCourseAndStudentByStaff] (@STAFF int)
RETURNS TABLE
AS
RETURN 
(
    Select fsc.StudentCourseID,stu.StudentName,co.CourseTitle,fsc.CourseDate,
	fsc.EnrollmentDate,fsc.WithdrawalDate
	from factStudentCourse fsc
	INNER JOIN dimStudent stu
	ON fsc.StudentID=stu.StudentID
	INNER JOIN dimCourse co
	ON co.CourseID=fsc.CourseID
	where StaffID=@STAFF	
);
GO
--Student Course Grades for teacher
CREATE FUNCTION [dbo].[GetStudentPerformanceByStaff] (@Student INT,@STAFF int)
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
	where stu.StudentID=@Student AND fsc.StaffID=@STAFF
	);
GO
--Get All student and courses under Teacher (by StaffID)
SELECT * FROM GetCourseAndStudentByStaff(25) ORDER BY CourseTitle;
GO
--Student Course Grades
SELECT * FROM GetStudentPerformanceByStaff(12,25) ORDER BY CourseTitle;


