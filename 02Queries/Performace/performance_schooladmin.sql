USE School_K12_Performance
GO
---School Admin

--Student Count per course/ subject
Select co.CourseTitle,sub.SubjectName,count(st.StudentName) AS StudentCount
from factStudentCourse fsc 
INNER JOIN factStudentCourseGrade fscg
ON fsc.StudentCourseID = fscg.StudentCourseID
INNER JOIN dimCourse co 
ON co.CourseID = fsc.CourseID 
INNER JOIN dimSubject sub
ON sub.SubjectID = co.SubjectID
INNER JOIN dimStudent st
ON fsc.StudentID = st.StudentID
group by co.CourseTitle,sub.SubjectName

--Students per course
Select fsc.CourseID,dco.CourseTitle,COUNT(StudentID) AS TotalStudent
from factStudentCourse fsc
INNER JOIN dimCourse dco
ON dco.CourseID=fsc.CourseID
group by fsc.CourseID,dco.CourseTitle

--Students per subject
Select dco.SubjectID,sub.SubjectName,COUNT(StudentID) AS TotalStudent
from factStudentCourse fsc
INNER JOIN dimCourse dco
ON dco.CourseID=fsc.CourseID
INNER JOIN dimSubject sub
ON sub.SubjectID=dco.SubjectID
group by dco.SubjectID,sub.SubjectName

--Student Course Grades
select fsc.StudentCourseID,fsc.StudentID,co.CourseID,co.CourseTitle,
 sub.SubjectName,
 dgt.GradeType,fscg.NumericGrade,fscg.AlphaNumericGrade,fscg.AlphaGrade,
 fsc.GradeLevel,fsc.CourseDate,fsc.EnrollmentDate,fsc.WithdrawalDate
from factStudentCourse fsc
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
where stu.StudentID=12

--All students grade subject/ course wise
Select st.StudentName,sub.SubjectName,co.CourseTitle,AlphaGrade,fscg.NumericGrade
from factStudentCourse fsc 
INNER JOIN factStudentCourseGrade fscg
ON fsc.StudentCourseID = fscg.StudentCourseID
INNER JOIN dimCourse co 
ON co.CourseID = fsc.CourseID 
INNER JOIN dimSubject sub
ON sub.SubjectID = co.SubjectID
INNER JOIN dimStudent st
ON fsc.StudentID = st.StudentID
group by st.StudentName,sub.SubjectName,co.CourseTitle,AlphaGrade,fscg.NumericGrade
order by st.StudentName,sub.SubjectName,co.CourseTitle

--HSGT Test Score
Select fsgt.HSGTScoreID,ds.StudentID,ds.StudentName,fsgt.TestDate,fsgt.LatestTest,
sub.SubjectName,fsgt.RawScore,fsgt.PossibleRawScore,fsgt.PossibleScaledScore
from factHSGTScore fsgt
INNER JOIN dimStudent ds
ON fsgt.StudentID=ds.StudentID
INNER JOIN dimSubject sub
ON sub.SubjectID=fsgt.SubjectID
Order by ds.StudentName
