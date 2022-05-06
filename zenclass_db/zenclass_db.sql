-- Create Database

CREATE DATABASE students_db;

-- Change to students db

use students_db;

-- Display existing tables

show tables;

-- ===============================================================
-- 1. Create tables for the above list given
-- 2. insert at least 5 rows of values in each table

-- The Following are the tables has to be in your database & model deisgn:
-- users, codekata, attendance, topics, tasks, company_drives, mentors, students_activated_courses, courses, 
-- ===============================================================

-- Create Table called user
CREATE TABLE users (
    student_id int NOT NULL AUTO_INCREMENT,
    student_name varchar(45), 
    student_email varchar(40), 
    mentor_id INTEGER, 
    FOREIGN KEY (mentor_id) REFERENCES mentors(mentor_id)
);

-- Insert 5 Student User Infor
INSERT INTO users (student_name, student_email, mentor_id) VALUES ('Harry', 'harry@mail.com', 1);
INSERT INTO users (student_name, student_email, mentor_id) VALUES ('Hermione', 'hermione@mail.com', 2);
INSERT INTO users (student_name, student_email, mentor_id) VALUES ('Ron', 'ron@mail.com', 1);
INSERT INTO users (student_name, student_email, mentor_id) VALUES ('Luna', 'luna@mail.com', 5);
INSERT INTO users (student_name, student_email, mentor_id) VALUES ('Neville', 'neville@mail.com', 4);

-- Create table mentors
CREATE TABLE mentors (
    mentor_id int NOT NULL AUTO_INCREMENT,
    mentor_name varchar(45), 
    mentor_email varchar(40), 
    PRIMARY KEY (mentor_id)
);

-- Insert 5 Mentor User Infor
INSERT INTO mentors (mentor_name, mentor_email) VALUES ('Dumbledore', 'dumbledore@mail.com');
INSERT INTO mentors (mentor_name, mentor_email) VALUES ('McGonagall', 'mcgonagall@mail.com');
INSERT INTO mentors (mentor_name, mentor_email) VALUES ('Snape', 'snape@mail.com');
INSERT INTO mentors (mentor_name, mentor_email) VALUES ('Sprout', 'sprout@mail.com');
INSERT INTO mentors (mentor_name, mentor_email) VALUES ('Hagrid', 'hagrid@mail.com');
INSERT INTO mentors (mentor_name, mentor_email) VALUES ('Trelawney', 'tre@mail.com');


-- Create table codekata
CREATE TABLE codekata (
    codekata_id int NOT NULL AUTO_INCREMENT,
    codekata_problem varchar(100),
    PRIMARY KEY (codekata_id),
);

-- Insert codekata challenges
INSERT INTO codekata (codekata_problem) VALUES ('Find the HCF of the 2 integer');
INSERT INTO codekata (codekata_problem) VALUES ('Reverse the string');
INSERT INTO codekata (codekata_problem) VALUES ('Find the area of rectangle');
INSERT INTO codekata (codekata_problem) VALUES ('Find the area of a circle');
INSERT INTO codekata (codekata_problem) VALUES ('Find the length of a string');

-- Create Table for codekata Activities
CREATE TABLE codekata_activity (
    activity_id int NOT NULL AUTO_INCREMENT,
    codekata_id INTEGER,
    student_id INTEGER, 
    PRIMARY KEY (activity_id),
    FOREIGN KEY (student_id) REFERENCES users(student_id)
    FOREIGN KEY (codekata_id) REFERENCES codekata(codekata_id),
);

-- Insert for codekata Activities of Students
INSERT INTO codekata_activity (codekata_id, student_id) VALUES (1, 1);
INSERT INTO codekata_activity (codekata_id, student_id) VALUES (1, 2);
INSERT INTO codekata_activity (codekata_id, student_id) VALUES (2, 2);
INSERT INTO codekata_activity (codekata_id, student_id) VALUES (2, 3);
INSERT INTO codekata_activity (codekata_id, student_id) VALUES (2, 4);
INSERT INTO codekata_activity (codekata_id, student_id) VALUES (3, 1);
INSERT INTO codekata_activity (codekata_id, student_id) VALUES (3, 5);
INSERT INTO codekata_activity (codekata_id, student_id) VALUES (5, 1);
INSERT INTO codekata_activity (codekata_id, student_id) VALUES (5, 2);

-- Create table attendance
CREATE TABLE attendance (
    attendance_id int NOT NULL AUTO_INCREMENT,
    course_id INTEGER FOREIGN KEY REFERENCES courses(course_id),
    student_id INTEGER FOREIGN KEY REFERENCES users(student_id), 
    class_date DATE, 
    attendance BOOLEAN, 
    PRIMARY KEY (attendance_id)
); 

-- Insert attendance data
INSERT INTO attendance (course_id, student_id, class_date, attendance) VALUES (1, 1);

-- Create table topics
CREATE TABLE topic (
    topic_id int NOT NULL AUTO_INCREMENT,
    topic_name varchar(100),
    PRIMARY KEY (topic_id)
); 

INSERT INTO topic (topic_name) VALUES ("JavaScript");
INSERT INTO topic (topic_name) VALUES ("HTML/CSS");
INSERT INTO topic (topic_name) VALUES ("Python");
INSERT INTO topic (topic_name) VALUES ("Java");

-- Create table courses
CREATE TABLE courses (
    course_id int NOT NULL AUTO_INCREMENT,
    course_name varchar(100),
    topic_id INTEGER,
    PRIMARY KEY (course_id),
    FOREIGN KEY (topic_id) REFERENCES topic(topic_id)
); 

INSERT INTO courses (course_name, topic_id) VALUES ("Web Development with MERN Stack", 1);
INSERT INTO courses (course_name, topic_id) VALUES ("Learn Programming with Python", 3);
INSERT INTO courses (course_name, topic_id) VALUES ("Build Web Layouts with HTML/CSS", 2);
INSERT INTO courses (course_name, topic_id) VALUES ("Work with JSON", 1);
INSERT INTO courses (course_name, topic_id) VALUES ("Web Development with Java", 4);

-- Create table students_activated_courses
CREATE TABLE students_activated_courses (
    activated_id int NOT NULL AUTO_INCREMENT,
    course_id INTEGER,
    student_id INTEGER,
    PRIMARY KEY (activated_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (student_id) REFERENCES users(student_id)
)

INSERT INTO students_activated_courses (course_id, student_id) VALUES (1, 1);
INSERT INTO students_activated_courses (course_id, student_id) VALUES (2, 2);
INSERT INTO students_activated_courses (course_id, student_id) VALUES (2, 3);
INSERT INTO students_activated_courses (course_id, student_id) VALUES (3, 1);
INSERT INTO students_activated_courses (course_id, student_id) VALUES (4, 1);
INSERT INTO students_activated_courses (course_id, student_id) VALUES (5, 4);
INSERT INTO students_activated_courses (course_id, student_id) VALUES (5, 5);

-- Create table tasks
CREATE TABLE task (
    task_id int NOT NULL AUTO_INCREMENT,
    task_name varchar(100),
    course_id INTEGER,
    PRIMARY KEY (task_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
); 

INSERT INTO task (task_name, course_id) VALUES ("Create a web app", 1);
INSERT INTO task (task_name, course_id) VALUES ("Create a web layout", 2);
INSERT INTO task (task_name, course_id) VALUES ("Create a scrapper", 3);
INSERT INTO task (task_name, course_id) VALUES ("Web Development with MERN Stack", 4);
INSERT INTO task (task_name, course_id) VALUES ("Web Development with MERN Stack", 5);

CREATE TABLE task_activities (
    task_activities_id int NOT NULL AUTO_INCREMENT,
    task_id INTEGER,
    student_id INTEGER, 
    PRIMARY KEY (task_activities_id),
    FOREIGN KEY (student_id) REFERENCES users(student_id),
    FOREIGN KEY (task_id) REFERENCES task(task_id)
); 

INSERT INTO task_activities (task_id, student_id) VALUES (1, 1);
INSERT INTO task_activities (task_id, student_id) VALUES (3, 3);
INSERT INTO task_activities (task_id, student_id) VALUES (2, 2);
INSERT INTO task_activities (task_id, student_id) VALUES (1, 1);
INSERT INTO task_activities (task_id, student_id) VALUES (4, 4);

-- Create table company_drives
CREATE TABLE company_drives (
    company_drive_id int NOT NULL AUTO_INCREMENT,
    company_name varchar(100),
    drive_date DATE,
    PRIMARY KEY (company_drive_id)
); 

INSERT INTO company_drives (company_name, drive_date) VALUES ("Amazon", "2021-05-10");
INSERT INTO company_drives (company_name, drive_date) VALUES ("Google", "2021-05-20");
INSERT INTO company_drives (company_name, drive_date) VALUES ("Swiggy", "2021-05-20");
INSERT INTO company_drives (company_name, drive_date) VALUES ("Paypal", "2021-05-05");
INSERT INTO company_drives (company_name, drive_date) VALUES ("Zoho", "2021-05-10");

-- Create table company_drives
CREATE TABLE drive_activities (
    drive_activity_id int NOT NULL AUTO_INCREMENT,
    company_drive_id INTEGER,
    student_id INTEGER, 
    PRIMARY KEY (drive_activity_id),
    FOREIGN KEY (student_id) REFERENCES users(student_id),
    FOREIGN KEY (student_id) REFERENCES company_drives(company_drive_id)
); 

INSERT INTO drive_activities (company_drive_id, student_id) VALUES (1, 1);
INSERT INTO drive_activities (company_drive_id, student_id) VALUES (1, 2);
INSERT INTO drive_activities (company_drive_id, student_id) VALUES (2, 1);
INSERT INTO drive_activities (company_drive_id, student_id) VALUES (2, 2);
INSERT INTO drive_activities (company_drive_id, student_id) VALUES (3, 3);
INSERT INTO drive_activities (company_drive_id, student_id) VALUES (4, 5);
INSERT INTO drive_activities (company_drive_id, student_id) VALUES (5, 3);
INSERT INTO drive_activities (company_drive_id, student_id) VALUES (5, 4);



-- =============================================================================
-- The following are the queries need to be executed
-- =============================================================================


-- 3. get number problems solved in codekata by combining the users
SELECT COUNT(codekata_id) FROM codekata_activity INNER JOIN users ON codekata_activity.student_id = users.student_id;

-- 4. display the no of company drives attended by a user
SELECT student_name, COUNT(company_name)  FROM company_drives 
INNER JOIN drive_activities ON company_drives.company_drive_id = drive_activities.company_drive_id 
INNER JOIN users ON drive_activities.student_id = users.student_id
group by student_name;

-- 5. combine and display students_activated_courses and courses for a specific user groping them based on the course
SELECT course_name, COUNT(student_id) FROM courses
INNER JOIN students_activated_courses ON courses.course_id = students_activated_courses.course_id
group by course_name;

-- 6. list all the mentors
SELECT mentor_name FROM `mentors`;

-- 7. list the number of students that are assigned for a mentor
SELECT mentor_name, COUNT(student_name) AS no_students FROM users
INNER JOIN mentors ON users.mentor_id = mentors.mentor_id
group by mentor_name;