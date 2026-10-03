CREATE DATABASE IF NOT EXISTS DreamCompany;
USE DreamCompany;
#1
CREATE USER IF NOT EXISTS 'DreamDBA'@'localhost' IDENTIFIED BY '1234';

GRANT CREATE, INSERT, CREATE VIEW, SELECT ON DreamCompany.* TO 'DreamDBA'@'localhost';

DROP VIEW IF EXISTS DepartmentInfo;
DROP VIEW IF EXISTS StaffNames;
DROP TABLE IF EXISTS Staff;

CREATE TABLE Staff( 
  staff_name varchar(100),
  department varchar(50),
  salary INT 
);

INSERT INTO Staff VALUES
('Ali', 'toy', 50000),
('Ayse', 'toy', 70000),
('Mehmet', 'cs', 40000),
('Fatih', 'Eng', 900000),
('Zeynep', 'cs', 40000);

CREATE VIEW StaffNames AS
SELECT staff_name
FROM Staff;

CREATE VIEW DepartmentInfo AS
SELECT department, AVG(salary) AS averagesalary
FROM Staff

GROUP BY department;

SELECT * FROM Staff;
SELECT * FROM StaffNames;
SELECT * FROM DepartmentInfo;
#2
CREATE USER IF NOT EXISTS 'passiveUser'@'localhost' IDENTIFIED BY '1234';

GRANT SELECT  ON DreamCompany.DepartmentInfo  TO 'passiveUser'@'localhost';
DROP VIEW IF EXISTS DepartmentInfofilter;
CREATE VIEW DepartmentInfofilter AS
SELECT department, AVG(salary) AS averagesalary
FROM Staff
WHERE department = 'toy' OR department = 'cs'
GROUP BY department;
#3
GRANT SELECT  ON DreamCompany.DepartmentInfofilter  TO 'passiveUser'@'localhost';

CREATE USER IF NOT EXISTS 'DreamAssistant'@'localhost' IDENTIFIED BY '1234';
#4
CREATE USER IF NOT EXISTS 'TestUser'@'localhost' IDENTIFIED BY '1234';

GRANT DELETE  ON DreamCompany.Staff  TO 'DreamAssistant'@'localhost'  WITH GRANT OPTION;
GRANT SELECT  ON DreamCompany.DepartmentInfo  TO 'DreamAssistant'@'localhost'  WITH GRANT OPTION;
GRANT SELECT ON DreamCompany.StaffNames  TO 'DreamAssistant'@'localhost'  WITH GRANT OPTION;

#7 
grant insert on  DreamCompany.StaffNames to 'DreamAssistant'@'localhost'  ;
#8
REVOKE DELETE ON DreamCompany.Staff 
FROM 'DreamAssistant'@'localhost';

REVOKE SELECT ON DreamCompany.DepartmentInfo 
FROM 'DreamAssistant'@'localhost';

REVOKE INSERT ON DreamCompany.StaffNames 
FROM 'DreamAssistant'@'localhost';

REVOKE SELECT ON DreamCompany.StaffNames 
FROM 'DreamAssistant'@'localhost';

CREATE USER IF NOT EXISTS 'DreamTodd'@'localhost' IDENTIFIED BY '1234';

#9
CREATE USER IF NOT EXISTS 'DreamBoss'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT,insert,delete, update ON DreamCompany.Staff  TO 'DreamBoss'@'localhost'  WITH GRANT OPTION;
grant SELECT, INSERT, UPDATE, DELETE ON DreamCompany.StaffNames TO 'DreamBoss'@'localhost'WITH GRANT OPTION;
#10
CREATE USER IF NOT EXISTS 'DreamBossAssist'@'localhost' IDENTIFIED BY '1234';

REVOKE SELECT
ON DreamCompany.Staff FROM 'DreamBossAssist'@'localhost';
#11
CREATE USER IF NOT EXISTS 'Susan'@'localhost' IDENTIFIED BY '1234';


REVOKE SELECT
ON DreamCompany.StaffNames
FROM 'DreamBoss'@'localhost';
