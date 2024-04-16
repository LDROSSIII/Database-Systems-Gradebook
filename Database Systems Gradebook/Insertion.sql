INSERT INTO PROFESSOR
    ([PROFESSOR_ID], [FNAME], [LNAME])
VALUES
    (1, Chunmei, Liu)
GO

INSERT INTO COURSE
    ([CRS_NUM], [DEPARTMENT], [CRS_NAME], [SEMESTER], [SCHOOL_YEAR], [PROFESSOR_ID])
VALUES
    (1, 'CEA', 'Database Systems', 'Spring', '2024', 1)
GO

INSERT INTO STUDENT
    ([STUDENT_ID], [STUDENT_FNAME], [STUDENT_LNAME], [CRS_NUM])
VALUES
    (1, 'Logan', 'Ross'),
    (2, 'Khloe', 'Wright'),
    (3, 'Sara', 'Kanu')
GO

INSERT INTO ENROLLMENT
    ([STUDENT_ID], [CRS_NUM])
VALUES
    (1,1),
    (2,1),
    (3,1)
GO

INSERT INTO CATEGORY
    ([CATGORY_ID], [CATEGORY_TYPE], [CATEGORY_WEIGHT], [COURSE_NUM])
VALUES
    (1,'Assignments', 15, 1),
    (2, 'Project and participation', 15, 1),
    (3, 'Midterm exam', 30, 1),
    (4, 'Final Exam', 40, 1)
GO

INSERT INTO ASSIGNMENT
    ([ASSIGNMENT_ID], [MAX_SCORE], [CATEGORY_ID])
VALUES
    (1, 50, 1),
    (2, 100, 1),
    (3, 100, 3)
GO

INSERT INTO GRADE
    ([STUDENT_ID], [ASSIGNMENT_ID], [SCORE])
VALUES
    (1, 1, 45),
    (1, 2, 93),
    (1, 3, 84),
    (2, 1, 50),
    (2, 2, 97),
    (2, 3, 95),
    (3, 1, 49),
    (3, 2, 92),
    (3, 3, 98)
GO
