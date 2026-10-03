USE DreamCompany;
SELECT * FROM DepartmentInfo;


GRANT SELECT, INSERT, UPDATE, DELETE
ON DreamCompany.StaffNames
TO 'DreamBossAssist'@'localhost'
WITH GRANT OPTION;

