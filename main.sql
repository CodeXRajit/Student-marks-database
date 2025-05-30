DROP DATABASE IF EXISTS sql_student_data;
CREATE DATABASE sql_student_data;
USE sql_student_data;


CREATE TABLE students (
  student_id INT PRIMARY KEY,
  name VARCHAR(100),
  age INT,
  gender VARCHAR(10)
);


CREATE TABLE subjects (
  subject_id INT PRIMARY KEY,
  subject_name VARCHAR(50)
);


CREATE TABLE marks (
  student_id INT PRIMARY KEY,
  term VARCHAR(20),
  math INT,
  science INT,
  english INT,
  social_studies INT,
  nepali INT,
  total_marks INT ,
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);
DELIMITER $$

CREATE TRIGGER before_marks_insert
BEFORE INSERT ON marks
FOR EACH ROW
BEGIN
  SET NEW.total_marks = NEW.math + NEW.science + NEW.english + NEW.social_studies + NEW.nepali;
END$$

CREATE TRIGGER before_marks_update
BEFORE UPDATE ON marks
FOR EACH ROW
BEGIN
  SET NEW.total_marks = NEW.math + NEW.science + NEW.english + NEW.social_studies + NEW.nepali;
END$$

DELIMITER ;


CREATE TABLE attendance (
  attendance_id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT,
  date DATE,
  status VARCHAR(10),
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);
INSERT INTO students (student_id, name, age, gender) VALUES
(1, 'Ramesh Thapa', 14, 'M'),
(2, 'Sita Shrestha', 14, 'F'),
(3, 'Binod Thapa', 15, 'M'),
(4, 'Anita Shrestha', 15, 'F'),
(5, 'Rajesh Shrestha', 14, 'F'),
(6, 'Sunita Shrestha', 15, 'F'),
(7, 'Dipak Shrestha', 14, 'F'),
(8, 'Kiran Shrestha', 16, 'F'),
(9, 'Maya Shrestha', 15, 'F'),
(10, 'Sanjay Thapa', 14, 'M'),
(11, 'Puja Shrestha', 16, 'F'),
(12, 'Hari Thapa', 16, 'M'),
(13, 'Sarita Shrestha', 14, 'F'),
(14, 'Nirmal Thapa', 16, 'M'),
(15, 'Aayush Thapa', 14, 'M'),
(16, 'Pratiksha Shrestha', 14, 'F'),
(17, 'Gopal Shrestha', 15, 'F'),
(18, 'Anil Thapa', 16, 'M'),
(19, 'Meena Thapa', 16, 'M'),
(20, 'Kabita Shrestha', 16, 'F'),
(21, 'Deepak Shrestha', 14, 'F'),
(22, 'Reshma Shrestha', 15, 'F'),
(23, 'Bijay Shrestha', 15, 'F'),
(24, 'Manoj Shrestha', 14, 'F'),
(25, 'Rina Shrestha', 15, 'F'),
(26, 'Arjun Shrestha', 14, 'F'),
(27, 'Nisha Shrestha', 15, 'F'),
(28, 'Kushal Thapa', 14, 'M'),
(29, 'Priya Shrestha', 15, 'F'),
(30, 'Roshan Shrestha', 15, 'F'),
(31, 'Suman Thapa', 14, 'M'),
(32, 'Kajal Thapa', 14, 'M'),
(33, 'Rabi Shrestha', 14, 'F'),
(34, 'Shanti Thapa', 16, 'M'),
(35, 'Bibek Shrestha', 16, 'F'),
(36, 'Niraj Shrestha', 15, 'F'),
(37, 'Asmita Shrestha', 14, 'F'),
(38, 'Kritika Shrestha', 16, 'F'),
(39, 'Sudip Thapa', 14, 'M'),
(40, 'Nabina Thapa', 15, 'M'),
(41, 'Krishna Shrestha', 15, 'F'),
(42, 'Minu Shrestha', 16, 'F'),
(43, 'Santoshi Thapa', 15, 'M'),
(44, 'Jivan Thapa', 14, 'M'),
(45, 'Devika Shrestha', 16, 'F'),
(46, 'Sabin Thapa', 15, 'M'),
(47, 'Pushpa Shrestha', 16, 'F'),
(48, 'Sujan Thapa', 16, 'M'),
(49, 'Laxmi Shrestha', 16, 'F'),
(50, 'Basanta Thapa', 15, 'M');

INSERT INTO marks (student_id, term, math, science, english, social_studies, nepali) VALUES
(1, 'First Term', 82, 67, 55, 51, 53),
(2, 'First Term', 88, 100, 98, 56, 39),
(3, 'First Term', 43, 56, 75, 54, 96),
(4, 'First Term', 53, 93, 58, 57, 83),
(5, 'First Term', 69, 91, 85, 84, 98),
(6, 'First Term', 61, 78, 95, 56, 98),
(7, 'First Term', 33, 66, 100, 60, 57),
(8, 'First Term', 41, 38, 71, 67, 67),
(9, 'First Term', 85, 66, 99, 86, 79),
(10, 'First Term', 69, 35, 34, 95, 88),
(11, 'First Term', 90, 92, 62, 38, 81),
(12, 'First Term', 37, 70, 39, 59, 39),
(13, 'First Term', 71, 52, 77, 81, 92),
(14, 'First Term', 42, 89, 81, 64, 75),
(15, 'First Term', 60, 92, 69, 76, 90),
(16, 'First Term', 59, 90, 60, 69, 69),
(17, 'First Term', 56, 67, 66, 99, 72),
(18, 'First Term', 92, 57, 37, 43, 62),
(19, 'First Term', 70, 80, 47, 94, 82),
(20, 'First Term', 51, 75, 38, 30, 76),
(21, 'First Term', 44, 70, 98, 58, 74),
(22, 'First Term', 52, 31, 56, 62, 33),
(23, 'First Term', 93, 40, 42, 44, 40),
(24, 'First Term', 63, 44, 49, 92, 41),
(25, 'First Term', 85, 67, 96, 33, 89),
(26, 'First Term', 89, 50, 49, 35, 42),
(27, 'First Term', 69, 96, 90, 46, 45),
(28, 'First Term', 77, 77, 72, 95, 79),
(29, 'First Term', 33, 90, 50, 60, 88),
(30, 'First Term', 75, 55, 79, 50, 81),
(31, 'First Term', 49, 55, 75, 92, 71),
(32, 'First Term', 37, 44, 95, 98, 36),
(33, 'First Term', 41, 30, 98, 64, 31),
(34, 'First Term', 36, 55, 100, 36, 45),
(35, 'First Term', 73, 84, 62, 59, 38),
(36, 'First Term', 70, 54, 97, 94, 70),
(37, 'First Term', 83, 88, 63, 71, 47),
(38, 'First Term', 48, 94, 43, 84, 94),
(39, 'First Term', 89, 93, 73, 52, 63),
(40, 'First Term', 46, 94, 61, 78, 95),
(41, 'First Term', 76, 74, 75, 81, 76),
(42, 'First Term', 91, 72, 32, 90, 40),
(43, 'First Term', 68, 67, 41, 92, 87),
(44, 'First Term', 64, 46, 81, 56, 43),
(45, 'First Term', 33, 33, 64, 55, 68),
(46, 'First Term', 41, 38, 66, 71, 63),
(47, 'First Term', 30, 31, 79, 67, 87),
(48, 'First Term', 87, 73, 82, 87, 55),
(49, 'First Term', 34, 35, 100, 77, 92),
(50, 'First Term', 53, 83, 30, 91, 76);

INSERT INTO attendance (student_id, date, status) VALUES
(1, '2025-05-01', 'Absent'),
(2, '2025-05-01', 'Present'),
(3, '2025-05-01', 'Absent'),
(4, '2025-05-01', 'Absent'),
(5, '2025-05-01', 'Absent'),
(6, '2025-05-01', 'Absent'),
(7, '2025-05-01', 'Absent'),
(8, '2025-05-01', 'Absent'),
(9, '2025-05-01', 'Present'),
(10, '2025-05-01', 'Absent'),
(11, '2025-05-01', 'Absent'),
(12, '2025-05-01', 'Absent'),
(13, '2025-05-01', 'Present'),
(14, '2025-05-01', 'Present'),
(15, '2025-05-01', 'Absent'),
(16, '2025-05-01', 'Present'),
(17, '2025-05-01', 'Absent'),
(18, '2025-05-01', 'Present'),
(19, '2025-05-01', 'Present'),
(20, '2025-05-01', 'Present'),
(21, '2025-05-01', 'Absent'),
(22, '2025-05-01', 'Present'),
(23, '2025-05-01', 'Present'),
(24, '2025-05-01', 'Absent'),
(25, '2025-05-01', 'Absent'),
(26, '2025-05-01', 'Present'),
(27, '2025-05-01', 'Absent'),
(28, '2025-05-01', 'Absent'),
(29, '2025-05-01', 'Present'),
(30, '2025-05-01', 'Present'),
(31, '2025-05-01', 'Present'),
(32, '2025-05-01', 'Present'),
(33, '2025-05-01', 'Absent'),
(34, '2025-05-01', 'Present'),
(35, '2025-05-01', 'Present'),
(36, '2025-05-01', 'Present'),
(37, '2025-05-01', 'Present'),
(38, '2025-05-01', 'Present'),
(39, '2025-05-01', 'Present'),
(40, '2025-05-01', 'Absent'),
(41, '2025-05-01', 'Absent'),
(42, '2025-05-01', 'Absent'),
(43, '2025-05-01', 'Present'),
(44, '2025-05-01', 'Absent'),
(45, '2025-05-01', 'Present'),
(46, '2025-05-01', 'Absent'),
(47, '2025-05-01', 'Absent'),
(48, '2025-05-01', 'Absent'),
(49, '2025-05-01', 'Absent'),
(50, '2025-05-01', 'Present'),
(1, '2025-05-02', 'Present'),
(2, '2025-05-02', 'Present'),
(3, '2025-05-02', 'Present'),
(4, '2025-05-02', 'Present'),
(5, '2025-05-02', 'Absent'),
(6, '2025-05-02', 'Absent'),
(7, '2025-05-02', 'Absent'),
(8, '2025-05-02', 'Present'),
(9, '2025-05-02', 'Absent'),
(10, '2025-05-02', 'Absent'),
(11, '2025-05-02', 'Absent'),
(12, '2025-05-02', 'Absent'),
(13, '2025-05-02', 'Present'),
(14, '2025-05-02', 'Present'),
(15, '2025-05-02', 'Present'),
(16, '2025-05-02', 'Absent'),
(17, '2025-05-02', 'Present'),
(18, '2025-05-02', 'Present'),
(19, '2025-05-02', 'Absent'),
(20, '2025-05-02', 'Absent'),
(21, '2025-05-02', 'Absent'),
(22, '2025-05-02', 'Present'),
(23, '2025-05-02', 'Absent'),
(24, '2025-05-02', 'Present'),
(25, '2025-05-02', 'Present'),
(26, '2025-05-02', 'Absent'),
(27, '2025-05-02', 'Present'),
(28, '2025-05-02', 'Absent'),
(29, '2025-05-02', 'Present'),
(30, '2025-05-02', 'Absent'),
(31, '2025-05-02', 'Present'),
(32, '2025-05-02', 'Absent'),
(33, '2025-05-02', 'Absent'),
(34, '2025-05-02', 'Absent'),
(35, '2025-05-02', 'Present'),
(36, '2025-05-02', 'Absent'),
(37, '2025-05-02', 'Absent'),
(38, '2025-05-02', 'Present'),
(39, '2025-05-02', 'Absent'),
(40, '2025-05-02', 'Absent'),
(41, '2025-05-02', 'Absent'),
(42, '2025-05-02', 'Absent'),
(43, '2025-05-02', 'Present'),
(44, '2025-05-02', 'Absent'),
(45, '2025-05-02', 'Present'),
(46, '2025-05-02', 'Present'),
(47, '2025-05-02', 'Present'),
(48, '2025-05-02', 'Absent'),
(49, '2025-05-02', 'Absent'),
(50, '2025-05-02', 'Present'),
(1, '2025-05-03', 'Absent'),
(2, '2025-05-03', 'Absent'),
(3, '2025-05-03', 'Present'),
(4, '2025-05-03', 'Present'),
(5, '2025-05-03', 'Absent'),
(6, '2025-05-03', 'Present'),
(7, '2025-05-03', 'Present'),
(8, '2025-05-03', 'Present'),
(9, '2025-05-03', 'Absent'),
(10, '2025-05-03', 'Absent'),
(11, '2025-05-03', 'Present'),
(12, '2025-05-03', 'Absent'),
(13, '2025-05-03', 'Absent'),
(14, '2025-05-03', 'Present'),
(15, '2025-05-03', 'Present'),
(16, '2025-05-03', 'Present'),
(17, '2025-05-03', 'Absent'),
(18, '2025-05-03', 'Absent'),
(19, '2025-05-03', 'Absent'),
(20, '2025-05-03', 'Absent'),
(21, '2025-05-03', 'Absent'),
(22, '2025-05-03', 'Absent'),
(23, '2025-05-03', 'Absent'),
(24, '2025-05-03', 'Absent'),
(25, '2025-05-03', 'Absent'),
(26, '2025-05-03', 'Present'),
(27, '2025-05-03', 'Present'),
(28, '2025-05-03', 'Present'),
(29, '2025-05-03', 'Absent'),
(30, '2025-05-03', 'Absent'),
(31, '2025-05-03', 'Present'),
(32, '2025-05-03', 'Absent'),
(33, '2025-05-03', 'Present'),
(34, '2025-05-03', 'Absent'),
(35, '2025-05-03', 'Present'),
(36, '2025-05-03', 'Absent'),
(37, '2025-05-03', 'Absent'),
(38, '2025-05-03', 'Present'),
(39, '2025-05-03', 'Present'),
(40, '2025-05-03', 'Present'),
(41, '2025-05-03', 'Present'),
(42, '2025-05-03', 'Present'),
(43, '2025-05-03', 'Absent'),
(44, '2025-05-03', 'Absent'),
(45, '2025-05-03', 'Present'),
(46, '2025-05-03', 'Present'),
(47, '2025-05-03', 'Absent'),
(48, '2025-05-03', 'Absent'),
(49, '2025-05-03', 'Present'),
(50, '2025-05-03', 'Absent'),
(1, '2025-05-04', 'Absent'),
(2, '2025-05-04', 'Present'),
(3, '2025-05-04', 'Present'),
(4, '2025-05-04', 'Absent'),
(5, '2025-05-04', 'Present'),
(6, '2025-05-04', 'Absent'),
(7, '2025-05-04', 'Present'),
(8, '2025-05-04', 'Present'),
(9, '2025-05-04', 'Absent'),
(10, '2025-05-04', 'Absent'),
(11, '2025-05-04', 'Absent'),
(12, '2025-05-04', 'Absent'),
(13, '2025-05-04', 'Absent'),
(14, '2025-05-04', 'Absent'),
(15, '2025-05-04', 'Absent'),
(16, '2025-05-04', 'Absent'),
(17, '2025-05-04', 'Absent'),
(18, '2025-05-04', 'Present'),
(19, '2025-05-04', 'Present'),
(20, '2025-05-04', 'Present'),
(21, '2025-05-04', 'Absent'),
(22, '2025-05-04', 'Present'),
(23, '2025-05-04', 'Absent'),
(24, '2025-05-04', 'Present'),
(25, '2025-05-04', 'Present'),
(26, '2025-05-04', 'Absent'),
(27, '2025-05-04', 'Absent'),
(28, '2025-05-04', 'Present'),
(29, '2025-05-04', 'Present'),
(30, '2025-05-04', 'Present'),
(31, '2025-05-04', 'Absent'),
(32, '2025-05-04', 'Absent'),
(33, '2025-05-04', 'Absent'),
(34, '2025-05-04', 'Absent'),
(35, '2025-05-04', 'Present'),
(36, '2025-05-04', 'Present'),
(37, '2025-05-04', 'Present'),
(38, '2025-05-04', 'Absent'),
(39, '2025-05-04', 'Present'),
(40, '2025-05-04', 'Absent'),
(41, '2025-05-04', 'Absent'),
(42, '2025-05-04', 'Absent'),
(43, '2025-05-04', 'Absent'),
(44, '2025-05-04', 'Present'),
(45, '2025-05-04', 'Absent'),
(46, '2025-05-04', 'Absent'),
(47, '2025-05-04', 'Absent'),
(48, '2025-05-04', 'Absent'),
(49, '2025-05-04', 'Present'),
(50, '2025-05-04', 'Present'),
(1, '2025-05-05', 'Present'),
(2, '2025-05-05', 'Present'),
(3, '2025-05-05', 'Absent'),
(4, '2025-05-05', 'Present'),
(5, '2025-05-05', 'Present'),
(6, '2025-05-05', 'Present'),
(7, '2025-05-05', 'Present'),
(8, '2025-05-05', 'Absent'),
(9, '2025-05-05', 'Absent'),
(10, '2025-05-05', 'Absent'),
(11, '2025-05-05', 'Present'),
(12, '2025-05-05', 'Present'),
(13, '2025-05-05', 'Absent'),
(14, '2025-05-05', 'Present'),
(15, '2025-05-05', 'Absent'),
(16, '2025-05-05', 'Present'),
(17, '2025-05-05', 'Present'),
(18, '2025-05-05', 'Absent'),
(19, '2025-05-05', 'Absent'),
(20, '2025-05-05', 'Present'),
(21, '2025-05-05', 'Present'),
(22, '2025-05-05', 'Present'),
(23, '2025-05-05', 'Present'),
(24, '2025-05-05', 'Present'),
(25, '2025-05-05', 'Absent'),
(26, '2025-05-05', 'Present'),
(27, '2025-05-05', 'Present'),
(28, '2025-05-05', 'Absent'),
(29, '2025-05-05', 'Present'),
(30, '2025-05-05', 'Absent'),
(31, '2025-05-05', 'Present'),
(32, '2025-05-05', 'Absent'),
(33, '2025-05-05', 'Absent'),
(34, '2025-05-05', 'Present'),
(35, '2025-05-05', 'Absent'),
(36, '2025-05-05', 'Absent'),
(37, '2025-05-05', 'Present'),
(38, '2025-05-05', 'Absent'),
(39, '2025-05-05', 'Present'),
(40, '2025-05-05', 'Present'),
(41, '2025-05-05', 'Present'),
(42, '2025-05-05', 'Absent'),
(43, '2025-05-05', 'Absent'),
(44, '2025-05-05', 'Absent'),
(45, '2025-05-05', 'Present'),
(46, '2025-05-05', 'Absent'),
(47, '2025-05-05', 'Present'),
(48, '2025-05-05', 'Present'),
(49, '2025-05-05', 'Absent'),
(50, '2025-05-05', 'Present');
INSERT INTO subjects (subject_id, subject_name) VALUES
(1, 'Math'),
(2, 'Science'),
(3, 'English'),
(4, 'Social Studies'),
(5, 'Nepali');

