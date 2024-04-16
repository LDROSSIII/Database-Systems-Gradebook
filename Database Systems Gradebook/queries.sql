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

/* update score for an assignment each student 2 points 8 */
UPDATE Score
SET Score = Score + 2
WHERE Assignment_ID = 1;

/* Compute student grade */
SELECT s.Student_ID, s.First_Name, s.Last_Name,
       SUM(sc.Score * (CASE a.Category
                       WHEN 'Assignments' THEN c.Participation_Percentage
                       WHEN 'Project and participation' THEN c.Homework_Percentage
                       WHEN 'Midterm exam' THEN c.Test_Percentage
                       WHEN 'Final Exam' THEN c.Project_Percentage
                       ELSE 0
                       END) / a.Max_Score) as Grade
FROM Student s
JOIN Score sc ON s.Student_ID = sc.Student_ID
JOIN Assignment a ON a.Assignment_ID = sc.Assignment_ID
JOIN Course c ON a.Course_ID = c.Course_ID
WHERE s.Student_ID = 1 AND c.Course_ID = 1
GROUP BY s.STUDENT_ID, s.STUDENT_FNAME, s.STUDENT_LNAME;

