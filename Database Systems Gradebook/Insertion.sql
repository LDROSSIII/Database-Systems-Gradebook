INSERT INTO PROFESSOR
VALUES
    (1001, 'Chunmei', 'Liu');

INSERT INTO COURSE
VALUES
    (432, 'CEA', 'Database Systems', 'Spring', '2024', (SELECT PROF_ID from PROFESSOR WHERE PROF_LNAME ='Liu'));

INSERT INTO STUDENT
VALUES
    (02998013, 'Logan', 'Ross'),
    (02998014, 'Khloe', 'Wright'),
    (02998015, 'Sara', 'Kanu'),
    (02998016, 'Quincy', 'Adams');

INSERT INTO ENROLLMENT
VALUES
    ((SELECT STUDENT_ID from STUDENT WHERE STUDENT_LNAME ='Ross'), (SELECT CRS_NUM from COURSE WHERE CRS_NAME = 'Database Systems')),
    ((SELECT STUDENT_ID from STUDENT WHERE STUDENT_LNAME ='Wright'), (SELECT CRS_NUM from COURSE WHERE CRS_NAME = 'Database Systems')),
    ((SELECT STUDENT_ID from STUDENT WHERE STUDENT_LNAME ='Kanu'), (SELECT CRS_NUM from COURSE WHERE CRS_NAME = 'Database Systems')),
    ((SELECT STUDENT_ID from STUDENT WHERE STUDENT_LNAME ='Adams'), (SELECT CRS_NUM from COURSE WHERE CRS_NAME = 'Database Systems'));

INSERT INTO CATEGORY
VALUES
    (501,'Assignments', 15, (SELECT CRS_NUM from COURSE WHERE CRS_NAME = 'Database Systems')),
    (502, 'Project and participation', 15, (SELECT CRS_NUM from COURSE WHERE CRS_NAME = 'Database Systems')),
    (503, 'Midterm exam', 30, (SELECT CRS_NUM from COURSE WHERE CRS_NAME = 'Database Systems')),
    (504, 'Final Exam', 40, (SELECT CRS_NUM from COURSE WHERE CRS_NAME = 'Database Systems'));

INSERT INTO ASSIGNMENT
VALUES
    (2001, 'Homework 1', 50, (SELECT CATEGORY_ID from CATEGORY WHERE CATEGORY_TYPE = 'Assignments'), (SELECT CRS_NUM from COURSE WHERE CRS_NAME = 'Database Systems')),
    (2002, 'Homework 2', 100, (SELECT CATEGORY_ID from CATEGORY WHERE CATEGORY_TYPE = 'Assignments'), (SELECT CRS_NUM from COURSE WHERE CRS_NAME = 'Database Systems')),
    (2003, 'Midterm', 100, (SELECT CATEGORY_ID from CATEGORY WHERE CATEGORY_TYPE = 'Midterm exam'), (SELECT CRS_NUM from COURSE WHERE CRS_NAME = 'Database Systems')),
    (2004, 'Participation', 25, (SELECT CATEGORY_ID from CATEGORY WHERE CATEGORY_TYPE = 'Project and participation'), (SELECT CRS_NUM from COURSE WHERE CRS_NAME = 'Database Systems')),
    (2005, 'Final', 100, (SELECT CATEGORY_ID from CATEGORY WHERE CATEGORY_TYPE = 'Final Exam'), (SELECT CRS_NUM from COURSE WHERE CRS_NAME = 'Database Systems'));

INSERT INTO GRADE
VALUES
    ((SELECT STUDENT_ID from STUDENT WHERE STUDENT_LNAME ='Ross'), (SELECT ASSIGNMENT_ID from ASSIGNMENT WHERE ASSIGNMENT_NAME = 'Homework 1'), 45),
    ((SELECT STUDENT_ID from STUDENT WHERE STUDENT_LNAME ='Ross'), (SELECT ASSIGNMENT_ID from ASSIGNMENT WHERE ASSIGNMENT_NAME = 'Homework 2'), 93),
    ((SELECT STUDENT_ID from STUDENT WHERE STUDENT_LNAME ='Ross'), (SELECT ASSIGNMENT_ID from ASSIGNMENT WHERE ASSIGNMENT_NAME = 'Midterm'), 84),
    ((SELECT STUDENT_ID from STUDENT WHERE STUDENT_LNAME ='Wright'), (SELECT ASSIGNMENT_ID from ASSIGNMENT WHERE ASSIGNMENT_NAME = 'Homework 1'), 50),
    ((SELECT STUDENT_ID from STUDENT WHERE STUDENT_LNAME ='Wright'), (SELECT ASSIGNMENT_ID from ASSIGNMENT WHERE ASSIGNMENT_NAME = 'Homework 2'), 97),
    ((SELECT STUDENT_ID from STUDENT WHERE STUDENT_LNAME ='Wright'), (SELECT ASSIGNMENT_ID from ASSIGNMENT WHERE ASSIGNMENT_NAME = 'Midterm'), 95),
    ((SELECT STUDENT_ID from STUDENT WHERE STUDENT_LNAME ='Kanu'), (SELECT ASSIGNMENT_ID from ASSIGNMENT WHERE ASSIGNMENT_NAME = 'Homework 1'), 49),
    ((SELECT STUDENT_ID from STUDENT WHERE STUDENT_LNAME ='Kanu'), (SELECT ASSIGNMENT_ID from ASSIGNMENT WHERE ASSIGNMENT_NAME = 'Homework 2'), 92),
    ((SELECT STUDENT_ID from STUDENT WHERE STUDENT_LNAME ='Kanu'), (SELECT ASSIGNMENT_ID from ASSIGNMENT WHERE ASSIGNMENT_NAME = 'Midterm'), 98),
    ((SELECT STUDENT_ID from STUDENT WHERE STUDENT_LNAME ='Adams'), (SELECT ASSIGNMENT_ID from ASSIGNMENT WHERE ASSIGNMENT_NAME = 'Homework 1'), 40),
    ((SELECT STUDENT_ID from STUDENT WHERE STUDENT_LNAME ='Adams'), (SELECT ASSIGNMENT_ID from ASSIGNMENT WHERE ASSIGNMENT_NAME = 'Homework 2'), 85),
    ((SELECT STUDENT_ID from STUDENT WHERE STUDENT_LNAME ='Adams'), (SELECT ASSIGNMENT_ID from ASSIGNMENT WHERE ASSIGNMENT_NAME = 'Midterm'), 89);
