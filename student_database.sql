CREATE TABLE Students (
    StudentID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    DateOfBirth DATE,
    Email VARCHAR2(100)
);

-- 3. Create the Courses table
CREATE TABLE Courses (
    CourseID NUMBER PRIMARY KEY,
    CourseName VARCHAR2(100),
    Instructor VARCHAR2(100)
);

-- 4. Create the Enrollments table (relationship table)
CREATE TABLE Enrollments (
    EnrollmentID NUMBER PRIMARY KEY,
    StudentID NUMBER REFERENCES Students(StudentID),
    CourseID NUMBER REFERENCES Courses(CourseID),
    EnrollmentDate DATE
);

INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Email)
VALUES (1, 'Ali', 'Khan', TO_DATE('2000-05-15', 'YYYY-MM-DD'), 'ali.khan@email.com');

INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Email)
VALUES (2, 'Sara', 'Ahmed', TO_DATE('1999-08-22', 'YYYY-MM-DD'), 'sara.ahmed@email.com');

INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Email)
VALUES (3, 'John', 'Doe', TO_DATE('2001-03-10', 'YYYY-MM-DD'), 'john.doe@email.com');

INSERT INTO Courses (CourseID, CourseName, Instructor)
VALUES (101, 'Database Systems', 'Dr. Smith');

INSERT INTO Courses (CourseID, CourseName, Instructor)
VALUES (102, 'Operating Systems', 'Prof. Johnson');

INSERT INTO Courses (CourseID, CourseName, Instructor)
VALUES (103, 'Data Structures', 'Dr. Lee');

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES (1001, 1, 101, TO_DATE('2023-09-01', 'YYYY-MM-DD'));

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES (1002, 2, 103, TO_DATE('2023-09-01', 'YYYY-MM-DD'));

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES (1003, 3, 102, TO_DATE('2023-09-01', 'YYYY-MM-DD'));

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;

SELECT 
    s.FirstName || ' ' || s.LastName AS StudentName,
    c.CourseName,
    e.EnrollmentDate
FROM 
    Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;
SELECT 
    s.FirstName, s.LastName
FROM 
    Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE 
    c.CourseName = 'Data Structures';
SELECT 
    s.FirstName, s.LastName, c.CourseName, e.EnrollmentDate
FROM 
    Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE 
    e.EnrollmentDate > TO_DATE('2023-01-01', 'YYYY-MM-DD');
SELECT 
    c.CourseName,
    COUNT(e.StudentID) AS NumberOfStudents
FROM 
    Enrollments e
JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY c.CourseName;
