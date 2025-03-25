CREATE DATABASE SISDB
use SISDB
DROP TABLE Students
CREATE TABLE Students
(
student_id varchar(255) Primary Key,
first_name VARCHAR(255),
last_name VARCHAR(255),
date_of_birth date,
email varchar(255),
phone_number bigint
)
CREATE TABLE Teacher
(
teacher_id varchar(255) Primary Key,
first_name varchar(255),
last_name varchar(255),
email varchar(255)
)
CREATE TABLE Courses
(
course_id varchar(255) Primary Key,
course_name varchar(255),
credits int,
teacher_id varchar(255),
CONSTRAINT fk_tid Foreign Key(teacher_id) REFERENCES Teacher(teacher_id) ON DELETE CASCADE
)
CREATE TABLE Enrollments
(
enrollment_id VARCHAR(255) Primary Key,
student_id VARCHAR(255),
course_id VARCHAR(255),
enrollment_date DATE,
CONSTRAINT fk_sid FOREIGN KEY(student_id) REFERENCES Students(student_id)ON DELETE CASCADE,
CONSTRAINT fk_cid FOREIGN KEY(course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
)
CREATE TABLE Payments
(
payment_id varchar(255) Primary Key,
student_id varchar(255),
amount money,
payment_date date,
CONSTRAINT fk_psid FOREIGN KEY(student_id) REFERENCES Students(student_id) ON DELETE CASCADE
)

INSERT INTO Students VALUES
('S101', 'Alice', 'Johnson', '2002-01-12', 'alice.johnson@gmail.com', '9876543210'),
('S102', 'Bob', 'Smith', '2002-03-25', 'bob.smith@gmail.com', '9765432109'),
('S103', 'Charlie', 'Brown', '2002-05-08', 'charlie.brown@gmail.com', '9654321098'),
('S104', 'David', 'Williams', '2002-07-19', 'david.williams@gmail.com', '9543210987'),
('S105', 'Emily', 'Davis', '2002-02-28', 'emily.davis@gmail.com', '9432109876'),
('S106', 'Frank', 'Miller', '2002-09-10', 'frank.miller@gmail.com', '9321098765'),
('S107', 'Grace', 'Wilson', '2002-11-14', 'grace.wilson@gmail.com', '9210987654'),
('S108', 'Henry', 'Moore', '2002-04-03', 'henry.moore@gmail.com', '9109876543'),
('S109', 'Ivy', 'Taylor', '2002-08-22', 'ivy.taylor@gmail.com', '9998765432'),
('S110', 'Jack', 'Anderson', '2002-06-30', 'jack.anderson@gmail.com', '9987654321');

INSERT INTO Teacher VALUES
('T01', 'John', 'Smith', 'john.smith@gmail.com'),
('T02', 'Emma', 'Johnson', 'emma.johnson@gmail.com'),
('T03', 'Michael', 'Brown', 'michael.brown@gmail.com'),
('T04', 'Olivia', 'Davis', 'olivia.davis@gmail.com'),
('T05', 'William', 'Miller', 'william.miller@gmail.com'),
('T06', 'Sophia', 'Wilson', 'sophia.wilson@gmail.com'),
('T07', 'James', 'Moore', 'james.moore@gmail.com'),
('T08', 'Ava', 'Taylor', 'ava.taylor@gmail.com'),
('T09', 'Daniel', 'Anderson', 'daniel.anderson@gmail.com'),
('T10', 'Mia', 'Thomas', 'mia.thomas@gmail.com');

INSERT INTO Courses VALUES
('C01', 'Data Science', 3, 'T01'),
('C02', 'Data Structures', 4, 'T02'),
('C03', 'Algorithms', 4, 'T03'),
('C04', 'Database Systems', 3, 'T04'),
('C05', 'Operating Systems', 3, 'T05'),
('C06', 'Computer Networks', 3, 'T06'),
('C07', 'Machine Learning', 4, 'T07'),
('C08', 'Artificial Intelligence', 4, 'T08'),
('C09', 'Cyber Security', 3, 'T09'),
('C10', 'Software Testing', 3, 'T10');

INSERT INTO Enrollments VALUES
('E001','S101','C04','2024-01-10'),
('E002','S102','C02','2024-01-12'),
('E003','S103','C08','2024-01-16'),
('E004','S104','C05','2024-01-22'),
('E005','S105','C01','2024-01-26'),
('E006','S106','C09','2024-01-30'),
('E007','S107','C10','2024-01-31'),
('E008','S108','C03','2024-02-03'),
('E009','S109','C06','2024-02-05'),
('E010','S110','C07','2024-02-10');

INSERT INTO Payments VALUES
('P001','S101',2500,'2024-01-10'),
('P002','S102',2000,'2024-01-12'),
('P003','S103',2300,'2024-01-16'),
('P004','S104',2500,'2024-01-22'),
('P005','S105',3000,'2024-01-26'),
('P006','S106',3100,'2024-01-30'),
('P007','S107',2650,'2024-01-31'),
('P008','S108',2850,'2024-02-03'),
('P009','S109',3000,'2024-02-05'),
('P010','S110',3250,'2024-02-10');

--Task2 

--1.
INSERT INTO Students VALUES ('S111','John','Doe','1995-08-15','john.doe@example.com',1234567890)
SELECT*FROM Students

--2.
INSERT INTO Enrollments VALUES ('E011','S111','C02','2024-02-26')
SELECT*FROM Enrollments

--3.
UPDATE Teacher SET email = 'dav.olivia@gmail.com' where teacher_id='T04'
SELECT*FROM Teacher
--4.
Delete from Enrollments where student_id='S107' and course_id='C09'
SELECT * FROM Enrollments
--5.
UPDATE Courses SET teacher_id='T06' where course_id='C07'
SELECT * FROM Courses
--6.
DELETE FROM Students where student_id='S102'
SELECT * FROM Students
SELECT * FROM Enrollments
--7.
UPDATE Payments SET amount=3500 where payment_id='P003'
SELECT * FROM Payments

--Task3
--1.
SELECT a.student_id,a.first_name,a.last_name,p.payment_id,p.amount FROM Students a
INNER JOIN
Payments p ON a.student_id=p.student_id

--2.
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name

INSERT INTO Students VALUES('S112','Alwin','George','2000-04-13','alwin.george@gmail.com',9760583921)
INSERT INTO Students VALUES('S113','Michael','Phelps','2001-06-13','michaelp@gmail.com',9760584560)
INSERT INTO Students VALUES('S114','Jordan','John','2001-07-11','jordanj@gmail.com',9342183921)

INSERT INTO Enrollments VALUES ('E012','S112','C08','2024-03-06')

--3.
SELECT*FROM Students
SELECT*FROM Enrollments
SELECT a.student_id, a.first_name,a.last_name FROM Students a
LEFT JOIN
Enrollments b ON a.student_id = b.student_id
where b.enrollment_id is null

--4.
SELECT a.student_id, a.first_name, a.last_name, c.course_name
FROM Enrollments b
JOIN Students a ON a.student_id = b.student_id
JOIN Courses c ON c.course_id = b.course_id

--5.
SELECT t.teacher_id, t.first_name, t.last_name, c.course_name
FROM Teacher t
INNER JOIN
Courses c ON t.teacher_id = c.teacher_id

--6.
SELECT a.student_id, a.first_name, a.last_name, c.course_name,b.enrollment_date
FROM Enrollments b
JOIN Students a ON a.student_id = b.student_id
JOIN Courses c ON c.course_id = b.course_id

--7.
SELECT a.student_id, a.first_name, a.last_name
FROM Students a
LEFT JOIN Payments p ON a.student_id = p.student_id
where p.payment_id is null

--8.
SELECT c.course_id, c.course_name FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
where e.enrollment_id is null

--9.
SELECT student_id, count(enrollment_id) AS no_of_enrollments FROM Enrollments GROUP BY student_id HAVING count(enrollment_id)>1 

--10.
SELECT t.teacher_id, t.first_name,t.last_name FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id=c.teacher_id
where c.course_id is null
group by t.teacher_id,t.first_name,t.last_name

--Task4
--1.
INSERT INTO Enrollments VALUES ('E013','S113','C06','2024-03-18')
INSERT INTO Enrollments VALUES ('E014','S114','C06','2024-03-18')
SELECT course_id,count(student_id) as Avg_enrolled FROM Enrollments GROUP BY course_id

--2.
SELECT student_id,amount FROM Payments where amount = (SELECT max(amount) FROM Payments)

--3.
SELECT course_id, COUNT(student_id) AS enrollment_count
FROM Enrollments GROUP BY course_id
HAVING COUNT(student_id) = (
    SELECT MAX(enrollment_count) 
    FROM (
        SELECT course_id, COUNT(student_id) AS enrollment_count
        FROM Enrollments GROUP BY course_id) AS course_enrollments)

--4.
SELECT t.teacher_id, t.first_name, t.last_name, 
(SELECT SUM(p.amount) FROM Payments p
WHERE p.student_id IN (SELECT e.student_id FROM Enrollments e 
WHERE e.course_id IN (SELECT c.course_id FROM Courses c 
WHERE c.teacher_id = t.teacher_id))) AS total_payments FROM Teacher t

--5.
SELECT student_id,first_name, last_name FROM Students 
WHERE (SELECT student_id FROM Enrollments 
GROUP BY student_id HAVING count(enrollment_id) = 12) is not null 

--6.
SELECT teacher_id, first_name, last_name FROM Teacher
WHERE teacher_id NOT IN (SELECT DISTINCT teacher_id FROM Courses)

--7.
SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS avg_age FROM Students

--8.
INSERT INTO Courses VALUES ('C11', 'Robotics', 2, 'T05')
INSERT INTO Courses VALUES ('C12', 'UI Path', 3, 'T09')
SELECT course_id, course_name FROM Courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments)

--9.
INSERT INTO Enrollments VALUES('E015','S101','C03','2024-03-18')
INSERT INTO Payments VALUES('P011','S111',2000,'2024-02-28')
INSERT INTO Payments VALUES('P012','S101',2850,'2024-03-18')
SELECT e.student_id, e.course_id, (SELECT SUM(p.amount) FROM Payments p WHERE p.student_id = e.student_id) AS total_payments
FROM Enrollments e GROUP BY e.student_id, e.course_id

--10.
SELECT student_id, COUNT(payment_id) AS no_of_payments FROM Payments GROUP BY student_id HAVING COUNT(payment_id) > 1

--11.
SELECT s.student_id, s.first_name, s.last_name, SUM(p.amount) AS total_amount FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name

--12.
SELECT c.course_id, c.course_name, count(e.enrollment_id) FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name

--13.
SELECT s.student_id, s.first_name, s.last_name, AVG(p.amount) AS Avg_Amount FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name


