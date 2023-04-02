 --Name: ALAGO VICTOR C.
 --BACHELORS ER DIAGRAM EXERCISE

 --CREATING TABLES AND PRIMARY KEYS


 CREATE TABLE ADMIN (
    admin_id varchar(8) UNIQUE NOT NULL,
    admin_email varchar(50) UNIQUE NOT NULL,
    admin_password varchar(20) NOT NULL,
    admin_name varchar(50) NOT NULL,
    CONSTRAINT admin_id_pk PRIMARY KEY (admin_id)
);

 CREATE TABLE CANDIDATE (
    candidate_email varchar(50) UNIQUE NOT NULL,
    candidate_name varchar (200) NOT NULL,
    candidate_birthday datetime NOT NULL,
    candidate_ress varchar (500) NOT NULL,
    CONSTRAINT candidate_pk PRIMARY KEY(candidate_email)
);

 CREATE TABLE STUDENT (
    student_id varchar(50) UNIQUE NOT NULL,
    student_unique_email varchar(50) UNIQUE NOT NULL,
    student_name varchar(300) NOT NULL,
    student_country varchar(25) NOT NULL,
    student_birthday date NOT NULL,
    student_gender varchar(6) NOT NULL,
    student_ress varchar(500) NOT NULL,
    intake_id varchar(100) NOT NULL,
    program_name varchar(100) NOT NULL,
    CONSTRAINT student_pk PRIMARY KEY(student_id, student_unique_email)    
);

 CREATE TABLE PAYMENT (
    payment_id varchar(10) UNIQUE NOT NULL,
    payment_date datetime NOT NULL,
    candidate_email varchar(50) NOT NULL,
    student_id varchar(50) NOT NULL,
    CONSTRAINT payment_pk PRIMARY KEY(payment_id)
);

 CREATE TABLE INTAKE (
    intake_id varchar(20) NOT NULL,
    intake_year integer NOT NULL,
    intake_season varchar(50) NOT NULL,
    program_name varchar(100) NOT NULL,
    CONSTRAINT intake_pk PRIMARY KEY (intake_id)
);

 CREATE TABLE PROGRAM (
    program_name varchar(100) NOT NULL,
    program_code integer NOT NULL,
    program_field varchar(100) NOT NULL,
    CONSTRAINT program_pk PRIMARY KEY (program_name)
);

 CREATE TABLE CURRICULUM (
    program_name varchar(100) NOT NULL,
    course_code integer NOT NULL
);

 CREATE TABLE COURSE (
    course_code integer UNIQUE NOT NULL,
    course_name varchar(50) NOT NULL,
    start_date date,
    end_date date,
    required_hours varchar(20) NOT NULL,
    CONSTRAINT course_pk PRIMARY KEY (course_code)
);

 CREATE TABLE TEACHER (
    teacher_unique_email varchar(50) UNIQUE NOT NULL,
    method_of_recruition varchar(100) NOT NULL,
    teacher_name varchar(100) NOT NULL,
    teacher_id varchar (50) UNIQUE NOT NULL,
    CONSTRAINT teacher_pk PRIMARY KEY (teacher_unique_email, teacher_id)
);

 CREATE TABLE TEACHER_PAYMENTS (
    teacher_IBAN varchar(20) UNIQUE NOT NULL,
    teacher_name varchar(100),
    teacher_country varchar(20),
    teacher_ress varchar(100),
    teacher_id varchar (50) NOT NULL
);

 CREATE TABLE SESSIONS (
    session_number varchar(20),
    session_type varchar(20),
    course_code varchar(20),
    teacher_id varchar (50),
    session_date date,
    session_start_time datetime,
    session_end_time datetime,
    room_number varchar(7),
    CONSTRAINT session_number_pk PRIMARY KEY (session_number)
);


 CREATE TABLE ROOM (
    room_number varchar(7) UNIQUE NOT NULL,
    floor varchar(7),
    room_type varchar(50),
    CONSTRAINT room_number_pk PRIMARY KEY(room_number)
);

 CREATE TABLE ATTENDANCE (
    session_number varchar(50),
    student_id varchar(50),
    status varchar(50),
    Excuse_file varchar(250)
);

 CREATE TABLE EXAMS_RECORDS (
    course_code varchar(50),
    course_name varchar(50),
    exam_type varchar(50),
    exam_score varchar(50),
    student_name varchar(50),
    student_id varchar(50)
);



--ADDING FOREIGN KEYS TO LINK THE TABLES

ALTER TABLE PAYMENT ADD FOREIGN KEY (candidate_email) REFERENCES CANDIDATE(candidate_email);

ALTER TABLE PAYMENT ADD FOREIGN KEY (student_id) REFERENCES STUDENT(student_id);

ALTER TABLE STUDENT ADD FOREIGN KEY (program_name) REFERENCES PROGRAM(program_name);

ALTER TABLE STUDENT ADD FOREIGN KEY (intake_id) REFERENCES INTAKE(intake_id);

ALTER TABLE CURRICULUM ADD FOREIGN KEY (program_name) REFERENCES PROGRAM(program_name);

ALTER TABLE CURRICULUM ADD FOREIGN KEY (course_code) REFERENCES COURSE(course_code);

ALTER TABLE SESSIONS ADD FOREIGN KEY (course_code) REFERENCES COURSE(course_code);

ALTER TABLE SESSIONS ADD FOREIGN KEY (teacher_id) REFERENCES TEACHER(teacher_id);
 
ALTER TABLE SESSIONS ADD FOREIGN KEY (room_number) REFERENCES ROOM(room_number);
 
ALTER TABLE TEACHER_PAYMENTS ADD FOREIGN KEY (teacher_id) REFERENCES TEACHER(teacher_id);
 
ALTER TABLE EXAMS_RECORDS ADD FOREIGN KEY (student_id) REFERENCES STUDENT(student_id);
 
ALTER TABLE EXAMS_RECORDS ADD FOREIGN KEY (course_code) REFERENCES COURSE(course_code);
 
ALTER TABLE ATTENDANCE ADD FOREIGN KEY (session_number) REFERENCES SESSIONS(session_number);
 
ALTER TABLE ATTENDANCE ADD FOREIGN KEY (student_id) REFERENCES STUDENT(student_id);

ALTER TABLE INTAKE ADD FOREIGN KEY (program_name) REFERENCES PROGRAM(program_name);
 
 
 --DROP ALL OBJECTS (I used this to clear my tables whenever I wanted to test my script again)

 --I used varchar for most of my important inputs like student_id and Admin_id because IDs are better to have a combination of numbers and alphabets e.g AB102

