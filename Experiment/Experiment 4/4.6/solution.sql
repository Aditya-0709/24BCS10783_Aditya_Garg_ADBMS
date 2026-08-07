-- We have a student table that also stores the Course_id of a student's favorite course. Our task has two parts related to using a SELF JOIN:

--     Find pairs of students that belong to the same department.
--     Identify students who have chosen the same Course_id as their favorite. Display the St_id, St_Name, and Course_id and order it in increasing Course_id.


SELECT s.St_id,s.St_Name,s.Department,
ss.St_id,ss.St_Name,ss.Department
FROM Student AS s 
JOIN Student AS ss 
ON s.Department=ss.Department
WHERE s.St_id!=ss.St_id;


SELECT s.St_id,s.St_Name,s.Course_id
FROM Student AS s 
JOIN Student AS ss 
ON s.Course_id=ss.Course_id
WHERE s.St_id!=ss.St_id
ORDER BY s.Course_id;
    