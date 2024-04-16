/* computing average/min/max of score of an assignment */
SELECT AVG(SCORE)
FROM GRADE WHERE assignment_id = 2001;

SELECT MIN(SCORE)
FROM GRADE WHERE assignment_id = 2002;

SELECT MAX(SCORE)
FROM GRADE WHERE assignment_id = 2003;

/* list all of the students in given course */

SELECT Student.student_ID, student_fname, student_lname FROM Student
JOIN Enrollment ON Student.student_id = Enrollment.student_id WHERE Enrollment.crs_num = 432;

/*List all of the students in a course and all of their scores on every assignment*/

SELECT Student.fname from Student s where Student.Student_ID in (select e.student_ID from ENROLLMENT e where e.Course_ID = 432;
SELECT Student.Student_ID, Student.fname from STUDENT s JOIN ENROLLMENT e where e.Course_ID = 432 and Student.Student_ID = e.Student_ID;

/*Add an assignment to a course*/

INSERT INTO Assignment
VALUES
(2004, 'Final', 100, (SELECT CATEGORY_ID from CATEGORY WHERE CATEGORY_TYPE = 'Final Exam'));

/*Change the percentages of the categories for a course*/

UPDATE Category
SET category_weight = 45
WHERE category_id = (SELECT CATEGORY_ID from CATEGORY WHERE CATEGORY_TYPE = 'Final Exam'); 

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

/* Compute student grade with the lowest score dropped*/

WITH MinScores AS (
  SELECT Student_ID, category_ID, MIN(score) AS min_score
  FROM Grade
  GROUP BY Student_ID, category_ID
)
SELECT s.fname, s.lname, 
       SUM(CASE WHEN g.score > ms.min_score THEN g.score * c.weight ELSE 0 END) / SUM(c.weight) AS total_grade
FROM Student s
JOIN Grade g ON s.Student_ID = g.Student_ID
JOIN Assignment a ON g.assignment_ID = a.assignment_ID
JOIN Category c ON a.category_ID = c.category_ID
JOIN MinScores ms ON g.Student_ID = ms.Student_ID AND g.category_ID = ms.category_ID
WHERE g.Course_ID = [Course_ID]
GROUP BY s.Student_ID;
