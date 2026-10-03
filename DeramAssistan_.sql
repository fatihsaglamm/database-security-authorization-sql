USE DreamCompany;
SELECT * FROM StaffNames;
SELECT * FROM DepartmentInfo;
GRANT SELECT  ON DreamCompany.StaffNames  TO 'DreamTodd'@'localhost';
INSERT INTO DreamCompany.StaffNames (staff_name) VALUES ('Ddemir');
SELECT * FROM StaffNames




