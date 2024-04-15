/* computing average/min/max of score of an assignment */
SELECT AVG(SCORE)
FROM GRADE WHERE assignment_id = 1;

SELECT MIN(SCORE)
FROM GRADE WHERE assignment_id = 2;

SELECT MAX(SCORE)
FROM GRADE WHERE assignment_id = 3;

/* list all of the students in given course */
SELECT Student.student_ID, Student.fname, Student.lname FROM Student
JOIN Enroll ON Student.student_id = Enroll.student_id WHERE Enroll.course_id = 2;

/* add two points to students course that name contains 'Q' */
UPDATE Score
SET Score = Score + 2
WHERE Assignment_ID = 1 AND Student_ID IN (
    SELECT Student_ID FROM Student WHERE LName LIKE '%Q%'
);