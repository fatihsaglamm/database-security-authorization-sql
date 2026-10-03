# 🔐 Database Security & Authorization with SQL

A database security project demonstrating user authorization, views, privileges, and Discretionary Access Control (DAC) using SQL.

The project models a fictional company database called `DreamCompany` and demonstrates how different database users can be given different levels of access using SQL `GRANT` and `REVOKE` commands.

## 📌 About the Project

The project focuses on database security and authorization.

A `Staff` table stores employee information including:

- Staff name
- Department
- Salary

Several database views and user accounts are then created to demonstrate controlled access to sensitive information.

The project includes examples of:

- User creation
- Database privileges
- Views
- Role-based access scenarios
- `GRANT`
- `REVOKE`
- `WITH GRANT OPTION`
- Restricted access to salary information
- Delegation of database privileges

## 🗄️ Database Structure

The project uses a database called:

```sql
DreamCompany
```

The main table is:

```sql
Staff
```

with the following structure:

```text
Staff
├── staff_name
├── department
└── salary
```

Two main views are also created:

### StaffNames

Contains only employee names.

```sql
CREATE VIEW StaffNames AS
SELECT staff_name
FROM Staff;
```

### DepartmentInfo

Displays the average salary for each department.

```sql
CREATE VIEW DepartmentInfo AS
SELECT department, AVG(salary) AS averagesalary
FROM Staff
GROUP BY department;
```

## 👥 Database Users

Different database users are created to demonstrate different authorization levels.

### DreamDBA

Represents the database administrator responsible for accessing the main database objects.

### passiveUser

Has restricted access to department salary information.

A filtered view is used to limit access to selected departments.

### DreamAssistant

Demonstrates delegated privileges such as:

- Reading employee names
- Reading department salary information
- Deleting staff records
- Granting selected permissions to other users

### DreamTodd

Demonstrates a user receiving access to the `StaffNames` view through another authorized user.

### DreamBoss

Receives broader permissions for the `Staff` and `StaffNames` objects with the ability to delegate permissions.

### DreamBossAssist

Represents delegated access from `DreamBoss`.

### Susan

Demonstrates further delegation of access permissions.

## 🔑 Authorization

The project demonstrates SQL authorization using commands such as:

```sql
GRANT SELECT
ON DreamCompany.DepartmentInfo
TO 'passiveUser'@'localhost';
```

and:

```sql
REVOKE SELECT
ON DreamCompany.StaffNames
FROM 'DreamAssistant'@'localhost';
```

## 🔄 Privilege Delegation

The `WITH GRANT OPTION` feature is used to allow selected users to grant their privileges to other users.

Example:

```sql
GRANT SELECT
ON DreamCompany.StaffNames
TO 'DreamAssistant'@'localhost'
WITH GRANT OPTION;
```

This demonstrates how database privileges can be transferred between users.

## 👁️ Restricted Views

The project also demonstrates how views can be used to restrict access to sensitive information.

For example, the `DepartmentInfofilter` view limits access to selected departments:

```sql
CREATE VIEW DepartmentInfofilter AS
SELECT department, AVG(salary) AS averagesalary
FROM Staff
WHERE department = 'toy' OR department = 'cs'
GROUP BY department;
```

This allows a user to access aggregated salary information without providing direct access to individual employee salaries.

## 📂 Project Structure

```text
database-security-authorization-sql/
│
├── sql/
│   ├── setup.sql
│   ├── DreamDBA.sql
│   ├── PassiveUser.sql
│   ├── DreamAssistant.sql
│   ├── DreamBoss.sql
│   ├── DreamBossAssistant.sql
│   ├── DreamTodd.sql
│   └── Susan.sql
│
├── README.md
└── .gitignore
```

## 🛠️ Technologies & Concepts

- SQL
- MySQL
- Database Management Systems
- Database Security
- Discretionary Access Control (DAC)
- User Authorization
- GRANT
- REVOKE
- WITH GRANT OPTION
- SQL Views
- Aggregate Functions
- Access Control
- Privilege Delegation

## ▶️ Running the Project

First, run:

```text
setup.sql
```

to create the database, tables, views, users, and privileges.

After that, the other SQL files can be executed using their corresponding database users to test the authorization rules.

For example:

```text
PassiveUser.sql
DreamAssistant.sql
DreamBoss.sql
DreamTodd.sql
Susan.sql
```

> Note: Replace example passwords in the SQL scripts with appropriate local development passwords before running the project.

## 🎓 Course Project

Developed as part of the **CNG352 - Database Management Systems** course at Middle East Technical University, Northern Cyprus Campus.

The project focuses on database security and Discretionary Access Control using SQL.

## 👤 Author

Fatih Sağlam
