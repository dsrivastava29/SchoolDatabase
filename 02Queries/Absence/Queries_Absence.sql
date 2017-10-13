
Role:School Administrator

--Students' Absence Record
select f.AbsenceCount,f.AbsenceDate, d.StudentName, s.StaffName
from factAbsence f INNER JOIN
dimStudent d ON d.StudentID = f.StudentID
INNER JOIN dimStaff s ON
s.StaffID = f.StaffID;


Role:School Teacher

--Students' Absence Record
use School_K12_Absence
go
select d.StudentID, f.AbsenceCount,f.AbsenceDate, d.StudentName, s.StaffName
from factAbsence f INNER JOIN
dimStudent d ON d.StudentID = f.StudentID
INNER JOIN dimStaff s ON
s.StaffID = f.StaffID
where d.StudentID=760;


Role:Parent

--Students' Absence Record
use School_K12_Absence
go
Select DISTINCT stu.grade,stu.studentName,stu.parentId from dimStudent stu
INNER JOIN factAbsence fab
ON stu.ParentId = fab.ParentId
INNER JOIN DimParent par
On fab.ParentId = par.ParentId
GROUP BY stu.grade,stu.studentName,stu.parentId


 