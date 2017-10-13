USE [School_K12_SpecialProgram]
GO
--- Parent
IF object_id(N'dbo.CheckChildsSpecialProgram', N'IF') IS NOT NULL
DROP FUNCTION [dbo].[CheckChildsSpecialProgram]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Check Students special program by Parent
CREATE FUNCTION [dbo].[CheckChildsSpecialProgram] (@Student int)
RETURNS TABLE
AS
RETURN 
(
	Select stu.StudentID,stu.StudentName,sp.ProgramCode,sp.Program, fsp.EntryDate 
	from factSpecialProgram fsp
	INNER JOIN dimStudent stu
	ON fsp.StudentID=stu.StudentID
	INNER JOIN dimSpecialProgram sp
	ON sp.ProgramID=fsp.ProgramID
	where stu.StudentID=@Student	
);
GO
-- Check Students special program
SELECT * FROM CheckChildsSpecialProgram(160);
