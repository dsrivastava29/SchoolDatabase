USE [School_K12_SpecialProgram]
GO
--- School Admin

--Total special Programs and Students count
Select sp.ProgramCode,sp.Program,
COUNT(fsp.SpecialProgramID) AS 'Total Special Programs',
COUNT(fsp.StudentID) AS 'Total Students'
from factSpecialProgram fsp
INNER JOIN dimStudent stu
ON stu.StudentID=fsp.StudentID
INNER JOIN dimSpecialProgram sp
ON sp.ProgramID=fsp.ProgramID
GROUP BY sp.ProgramCode,sp.Program

--Special Program Student
Select sp.ProgramCode,sp.Program,fsp.SpecialProgramID,
stu.StudentName,stu.SchoolYear,fsp.EntryDate
from factSpecialProgram fsp
INNER JOIN dimStudent stu
ON stu.StudentID=fsp.StudentID
INNER JOIN dimSpecialProgram sp
ON sp.ProgramID=fsp.ProgramID
GROUP BY sp.ProgramCode,sp.Program,fsp.SpecialProgramID,
stu.StudentName,stu.SchoolYear,fsp.EntryDate

--List of students with programs
Select stu.StudentName,sp.ProgramCode,sp.Program, fsp.EntryDate 
from factSpecialProgram fsp
INNER JOIN dimStudent stu
ON fsp.StudentID=stu.StudentID
INNER JOIN dimSpecialProgram sp
ON sp.ProgramID=fsp.ProgramID
Order By stu.StudentName,sp.ProgramCode
