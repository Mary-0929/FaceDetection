Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.4.3 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create sql project;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'project' at line 1
mysql> create database sqlproject
    -> ;
Query OK, 1 row affected (0.01 sec)
mysql> use sqlproject
Database changed
mysql> CREATE TABLE Students (
    ->     student_id INT PRIMARY KEY,
    ->     name VARCHAR(100),
    ->     age INT,
    ->     department VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> CREATE TABLE Courses (
    ->     course_id INT PRIMARY KEY,
    ->     course_name VARCHAR(100),
    ->     credits INT
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> CREATE TABLE Enrollments (
    ->     enrollment_id INT PRIMARY KEY,
    ->     student_id INT,
    ->     course_id INT,
    ->     grade VARCHAR(2),
    ->     FOREIGN KEY (student_id) REFERENCES Students(student_id),
    ->     FOREIGN KEY (course_id) REFERENCES Courses(course_id)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> -- Students
Query OK, 0 rows affected (0.00 sec)

mysql> INSERT INTO Students VALUES (1, 'Alice', 20, 'Computer Science');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Students VALUES (2, 'Bob', 22, 'Mathematics');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Students VALUES (3, 'Charlie', 21, 'Physics');
Query OK, 1 row affected (0.00 sec)

mysql>
mysql> -- Courses
Query OK, 0 rows affected (0.00 sec)

mysql> INSERT INTO Courses VALUES (101, 'Data Structures', 4);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Courses VALUES (102, 'Calculus', 3);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Courses VALUES (103, 'Quantum Mechanics', 4);
Query OK, 1 row affected (0.00 sec)

mysql>
mysql> -- Enrollments
Query OK, 0 rows affected (0.00 sec)

mysql> INSERT INTO Enrollments VALUES (1, 1, 101, 'A');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Enrollments VALUES (2, 1, 102, 'B+');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Enrollments VALUES (3, 2, 102, 'A-');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Enrollments VALUES (4, 3, 103, 'B');
Query OK, 1 row affected (0.00 sec)

mysql> -- Get all students
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT * FROM Students;
+------------+---------+------+------------------+
| student_id | name    | age  | department       |
+------------+---------+------+------------------+
|          1 | Alice   |   20 | Computer Science |
|          2 | Bob     |   22 | Mathematics      |
|          3 | Charlie |   21 | Physics          |
+------------+---------+------+------------------+
3 rows in set (0.00 sec)

mysql>
mysql> -- Get all courses a student is enrolled in
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT s.name, c.course_name, e.grade
    -> FROM Students s
    -> JOIN Enrollments e ON s.student_id = e.student_id
    -> JOIN Courses c ON c.course_id = e.course_id
    -> WHERE s.name = 'Alice';
+-------+-----------------+-------+
| name  | course_name     | grade |
+-------+-----------------+-------+
| Alice | Data Structures | A     |
| Alice | Calculus        | B+    |
+-------+-----------------+-------+
2 rows in set (0.00 sec)

mysql>
mysql> -- Average age of students in each department
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT department, AVG(age) AS avg_age
    -> FROM Students
    -> GROUP BY department;
+------------------+---------+
| department       | avg_age |
+------------------+---------+
| Computer Science | 20.0000 |
| Mathematics      | 22.0000 |
| Physics          | 21.0000 |
+------------------+---------+
3 rows in set (0.00 sec)

mysql>
mysql> -- Count of students enrolled in each course
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT c.course_name, COUNT(e.student_id) AS student_count
    -> FROM Courses c
    -> LEFT JOIN Enrollments e ON c.course_id = e.course_id
    -> GROUP BY c.course_name;
+-------------------+---------------+
| course_name       | student_count |
+-------------------+---------------+
| Data Structures   |             1 |
| Calculus          |             2 |
| Quantum Mechanics |             1 |
+-------------------+---------------+
3 rows in set (0.00 sec)