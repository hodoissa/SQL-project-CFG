
CREATE DATABASE Placement4;
USE Placement4;

CREATE TABLE student_data
(student_ID int NOT NULL,
preferred_language VARCHAR(50),
grade_average int NOT NULL,
budget_pcm DECIMAL(10,2)  NOT NULL,
CONSTRAINT PK_student primary key (student_ID));

INSERT into student_data
(student_id, preferred_language, grade_average, budget_pcm)
VALUES
(1752, 'English', 56, 500.00),
(1842, 'German', 86, 550.00),
(1865, 'French', 54, 600.00),
(1294, 'Italian', 68, 900.00),
(1709, 'Spanish', 74, 475.00),
(1610, 'Spanish', 48, 850.00);

CREATE TABLE student_course_of_study
(student_id INT NOT NULL,
Course VARCHAR(50),
CONSTRAINT PK_student PRIMARY KEY (student_ID),
CONSTRAINT FK_student_course_data FOREIGN KEY (student_ID) REFERENCES student_data(student_ID));

INSERT into student_course_of_study
(student_id, course)
VALUE
(1752, 'Business Studies'),
(1842, 'French'),
(1865, 'Medicine'),
(1294, 'Geography'),
(1709, 'History'),
(1610,  'Sports Science');

CREATE TABLE student_budget
(student_id INT NOT NULL,
Budget_pcm DECIMAL(10,2)  NOT NULL,
CONSTRAINT PK_student PRIMARY KEY (student_ID),
CONSTRAINT FK_student_budget_data FOREIGN KEY (student_ID) REFERENCES student_data(student_ID));

INSERT INTO student_budget
(student_id, budget_pcm)
VALUES
(1752, 500.00),
(1842, 550.00),
(1865, 600.00),
(1294, 900.00),
(1709, 475.00),
(1610, 850.00);

create table university_courses
(university_ID VARCHAR(10) NOT NULL,
university_name VARCHAR (50),
course VARCHAR(50),
constraint PK_university_courses primary key (university_ID)); 

INSERT INTO university_courses
(university_ID, university_name, course)
values
('MAU435','University of Madrid', 'Business Studies'),
-- ('MAU435','University of Madrid', 'French'),
-- ('MAU435','University of Madrid', 'Medicine'),
-- ('MAU435','University of Madrid', 'Geography'),
('UOB987','University of Bristol', 'History'),
-- ('UOB987','University of Bristol', 'Sports Science'),
-- ('UOB987','University of Bristol', 'Business Studies'),
-- ('UOB987','University of Bristol', 'French'),
-- ('UOB987','University of Bristol', 'Medicine'),
-- ('UOB987','University of Bristol', 'Geography'),
-- ('UOB987','University of Bristol', 'English'),
('MIL782','University of Milan', 'Sports Science'),
-- ('MIL782','University of Milan', 'Business Studies'),
-- ('MIL782','University of Milan', 'French'),
-- ('MIL782','University of Milan', 'Medicine'),
('HUB561','Humboldt University of Berlin', 'Business Studies'),
-- ('HUB561','Humboldt University of Berlin', 'French'),
-- ('HUB561','Humboldt University of Berlin', 'Medicine'),
-- ('HUB561','Humboldt University of Berlin', 'Geography'),
-- ('HUB561','Humboldt University of Berlin', 'History'),
-- ('HUB561','Humboldt University of Berlin', 'Sports Science'),
('TUM456','Technical University of Munich', 'Business Studies'),
-- ('TUM456','Technical University of Munich', 'French'),
-- ('TUM456','Technical University of Munich', 'Medicine'),
-- ('TUM456','Technical University of Munich', 'Geography'),
-- ('TUM456','Technical University of Munich', 'History'),
('CMU342','City of Mexico University', 'Business Studies'),
-- ('CMU342','City of Mexico University', 'French'),
('PAR472','University of Paris', 'Medicine') ;
-- ('PAR472','University of Paris', 'Geography'),
-- ('PAR472','University of Paris', 'History'),
-- ('PAR472','University of Paris', 'Sports Science'),
-- ('PAR472','University of Paris', 'Business Studies'),
-- ('PAR472','University of Paris', 'French'),
-- ('PAR472','University of Paris', 'Medicine');

CREATE TABLE cost_of_living
(location_id VARCHAR(50) NOT NULL,     
Average_cost_of_living_pcm INT NOT NULL,
CONSTRAINT PK_cost PRIMARY KEY (location_ID));

INSERT INTO cost_of_living
(location_id, Average_cost_of_living_pcm)
VALUES
('Bristol', 800),
('Madrid', 600),
('Barcelona' , 650),
('Mexico City' , 450),
('Munich' , 500),
('Milan' , 800),
('Berlin' , 780),
('Paris' , 750);

CREATE TABLE Universities 
(university_ID VARCHAR(10) NOT NULL,
university_name VARCHAR(50),
language_spoken VARCHAR(50),
world_ranking INT NOT NULL,
CONSTRAINT PK_universities PRIMARY KEY (university_ID),
CONSTRAINT FK_universities_course FOREIGN KEY (university_ID) REFERENCES university_courses(university_ID));
-- CONSTRAINT FK_universities_cost FOREIGN KEY (location_id) REFERENCES  cost_of_living(location_id)); 


INSERT into  Universities
(university_ID, university_name, language_spoken, world_ranking)  -- had to remove location_id column due to error: 
-- <Cannot add or update a child row: a foreign key constraint fails >
VALUES
('MAU435', 'University of Madrid', 'Spanish', 78),
('UOB987', 'University of Bristol', 'English', 44),
('MIL782', 'University of Milan', 'Italian', 43),
('HUB561', 'Humboldt University of Berlin', 'German', 19),
('TUM456', 'Technical University of Munich','German', 23),
('CMU342', 'City of Mexico University', 'Spanish', 55),
('PAR472', 'University of Paris', 'French', 43);

CREATE TABLE placements
(placement_ID CHAR(4) NOT NULL,
company_name VARCHAR(50),
location_ID VARCHAR(50),
minimum_grade_average INT,
CONSTRAINT PK_placements primary key (placement_ID)); 

INSERT into placements
(placement_ID, company_name, location_ID, minimum_grade_average)
VALUES
('D184', 'Deloitte', 'Bristol', 55),
('B444', 'AirBus', 'Bristol', 50),
('H767', 'HSBC', 'Madrid', 56),
('M897', 'Madrid Banking Group', 'Madrid', 64),
('K436', 'KPMG', 'Barcelona', 70),
('B245', 'Barcelona Tourist Board', 'Barcelona', 53),
('P052', 'PWC', 'Munich', 68),
('L432', 'Loreal', 'Munich', 67),
('M439', 'ALFA', 'Mexico City', '50'),
('W887', 'Walmart', 'Mexico City', 49),
('L435', 'Loreal', 'Milan', 71),
('T912', 'Telecom Italia', 'Milan', 65),
('A665', 'Adidas', 'Berlin', 52),
('S334', 'Siemens', 'Berlin', 67),
('D154', 'Danone', 'Paris', 55);

CREATE TABLE placement_key_contacts
(placement_id CHAR(4) NOT NULL,
company_name varchar(50),
key_contact_name varchar(50),
Key_contact_phone_number float(11) NOT NULL,   -- phone numbers stored as float
CONSTRAINT FK_contacts_placement FOREIGN KEY (placement_id) REFERENCES placements(placement_id));

INSERT INTO placement_key_contacts
(placement_id, company_name, Key_contact_name, Key_contact_phone_number)
VALUES
('D184', 'Deloitte', 'H JACOBS', 07800887765 ),
('B444', 'AirBus', 'T MOORE', 07988765435 ),
('H767', 'HSBC', 'J COOK', 07656554241 ),
('M897', 'Madrid Banking Group', 'J NEW',  07987652453 ),
('K436', 'KPMG', 'E STOREY', 07826773352),
('B245', 'Barcelona Tourist Board', 'A KAWLEY', 07166524424 ),
('P052', 'PWC', 'A GODDARD', 07899665243),
('L432', 'Loreal', 'J BECKETT', 07866772215 ),
('M439', 'ALFA', 'S ELLIS', 07866775245),
('W887', 'Walmart', 'G SCOTT', 07898987662),
('L435', 'Loreal', 'P SMITH', 07898761324),
('T912', 'Telecom Italia', 'D JONES', 07261142456),
('A665', 'Adidas', 'E HITCHINGS', 07256177263),
('S334', 'Siemens', 'K MCGINTY', 07862673821),
('D154', 'Danone', 'A NEWMAN', 07826552415);



-- QUERIES

-- 1. Show all placements with a minimum grade between 60 and 70

USE Placement4;

SELECT company_name, minimum_grade_average
FROM placements
WHERE minimum_grade_average >= 60 
AND minimum_grade_average <= 70

-- 2. Location cost of living in ascending order

USE placement4;

SELECT
location_id, Average_cost_of_living_pcm
FROM cost_of_living
ORDER BY Average_cost_of_living_pcm ASC;

-- 3. List students by grade average in descending order

USE PLACEMENT4;

SELECT
student_ID, grade_average
FROM student_data
ORDER BY grade_average DESC;

-- 4. What placements are available to student 1294? 

USE Placement4;

SELECT 
p.placement_ID, p.company_name, p.location_ID, p.minimum_grade_average

FROM placements p
INNER JOIN
student_data s

WHERE s.student_ID = 1294
AND
s.grade_average >= p.minimum_grade_average

ORDER BY p.placement_ID;

-- 5. Which students do not get a placement?

USE Placement4;

SELECT s.student_id,
COUNT(s.student_id) AS number_of_unavailable_placements

FROM placements p
JOIN
student_data s

WHERE 
s.grade_average <= p.minimum_grade_average

GROUP BY s.student_ID
ORDER BY student_ID; 


-- 6. Show list of students and their course.

SELECT stu.student_id, cou.course
FROM student_data stu
JOIN student_course_of_study cou
ON stu.student_id = cou.student_id;

-- 7. Create a view to show students who have an above average grade
CREATE VIEW Above_Average_Student_Grades AS 
SELECT student_id, grade_average
FROM student_data
WHERE grade_average > (SELECT AVG(grade_average) FROM student_data)
ORDER BY grade_average DESC;

SELECT * FROM Above_Average_Student_Grades


-- 8. If a student is interested in joining Deloitte, how can they be contacted?

SELECT key_contact_name, key_contact_phone_number
FROM placement_key_contacts
WHERE company_name = 'Deloitte';


-- 9. Create a stored function for university rankings
DELIMITER // 
CREATE FUNCTION university_rank(
world_ranking INT)

RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE university_rank VARCHAR(10);
    IF world_ranking <= 43 THEN
    SET university_rank = 'HIGH';
    ELSEIF (world_ranking > 43 AND world_ranking <= 55) THEN
    SET university_rank = 'AVERAGE';
    ELSEIF world_ranking > 55 THEN       -- better to use ELSE as it captures everything else
    SET university_rank = 'LOW';
END IF;
    RETURN (university_rank);
END //
DELIMITER ;

SELECT university_name, university_rank(world_ranking)
FROM Universities
ORDER BY world_ranking DESC;





