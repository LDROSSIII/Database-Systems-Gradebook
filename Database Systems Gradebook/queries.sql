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

/*List all of the students in a course and all of their scores on every assignment*/

SELECT Student.fname from Student s where Student.Student_ID in (select e.student_ID from ENROLLMENT e where e.Course_ID = 1;
SELECT Student.Student_ID, Student.fname from STUDENT s JOIN ENROLLMENT e where e.Course_ID = 1 and Student.Student_ID = e.Student_ID;

/*Add an assignment to a course*/

INSERT INTO Assignment (course_id, name, total_points, due_date)
VALUES (<course_id>, 'New Assignment', <total_points>, 'YYYY-MM-DD');

/*Change the percentages of the categories for a course*/

UPDATE Category
SET weight = <new_weight>
WHERE category_id = <category_id>; 

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

SELECT SUM(score * weight / total_points) * 100 AS Grade
FROM (
    SELECT g.*, c.weight, a.total_points,
            ROW_NUMBER() OVER (PARTITION BY a.category_id ORDER BY score ASC) AS row_num
    FROM Grade g
    JOIN Assignment a ON g.assignment_ID = a.assignment_ID
    JOIN Category c ON a.Category_ID = c.Category_ID
    WHERE g.Student_ID = <student_id>
) AS ranked
WHERE row_num > 1;
