--Create table Dep
CREATE TABLE Dep
(
	Dep_Code VARCHAR2(20) PRIMARY KEY,
	Dep_Name VARCHAR2(20) NOT NULL
);
--Create table Staf
CREATE TABLE Staf
(
	Staf_Id VARCHAR2(16) PRIMARY KEY,
	Staf_Name VARCHAR2(15) NOT NULL,
	Staf_Tel VARCHAR2(20) NOT NULL,
	Staf_Email VARCHAR2(36) NOT NULL,
	Staf_Addr VARCHAR2(200) NOT NULL,
	Staf_Pw VARCHAR2(16) NOT NULL,
	Staf_DepCode VARCHAR2(20) NOT NULL REFERENCES Dep(Dep_Code)
);
--Create table Lect
CREATE TABLE Lect
(
	Lect_Code VARCHAR2(20) PRIMARY KEY,
	Lect_Name VARCHAR2(60) NOT NULL,
	Lect_StafId VARCHAR2(16) NOT NULL REFERENCES Staf(Staf_Id),
	Lect_TotalNumStus NUMBER(3) NOT NULL,
	Lect_BeginDate DATE NOT NULL,
	Lect_EndDate DATE NOT NULL,
	Lect_NumNaljas NUMBER(3) NOT NULL,
	Lect_BeginTime NUMBER(4) NOT NULL,
	Lect_EndTime NUMBER(4) NOT NULL,
	Lect_ThumbName VARCHAR2(20) NOT NULL
);
--Create table Stu
CREATE TABLE Stu
(
	Stu_Id VARCHAR2(16) PRIMARY KEY,
	Stu_Name VARCHAR2(15) NOT NULL,
	Stu_Tel VARCHAR2(20) NOT NULL,
	Stu_Email VARCHAR2(36) NOT NULL,
	Stu_Addr VARCHAR2(200) NOT NULL,
	Stu_Pw VARCHAR2(16) NOT NULL,
	Stu_LectCode VARCHAR2(20) REFERENCES Lect(Lect_Code)
);
--Create table Notice
CREATE TABLE Notice
(
	Notice_Idx NUMBER PRIMARY KEY,
	Notice_MemberId VARCHAR2(16) NOT NULL,
	Notice_Sub VARCHAR2(60) NOT NULL,
	Notice_Nalja DATE NOT NULL,
	Notice_Cont VARCHAR2(2000) NOT NULL
);
CREATE SEQUENCE Notice_Seq
START WITH 1
INCREMENT BY 1;
--Create table Quest
CREATE TABLE Quest
(
	Quest_Idx NUMBER PRIMARY KEY,
	Quest_MemberId VARCHAR2(16) NOT NULL,
	Quest_Sub VARCHAR2(60) NOT NULL,
	Quest_Nalja DATE NOT NULL,
	Quest_Cont VARCHAR2(2000) NOT NULL,
	Ans_Nalja DATE NOT NULL,
	Ans_Cont VARCHAR2(2000) NOT NULL
);
CREATE SEQUENCE Quest_Seq
START WITH 1
INCREMENT BY 1;
--Create table Eval
CREATE TABLE Eval
(
	Eval_Idx NUMBER PRIMARY KEY,
	Eval_OrderNum NUMBER NOT NULL,
	Eval_StuId VARCHAR2(16) NOT NULL REFERENCES Stu(Stu_Id),
	Eval_Score NUMBER(8),
	Eval_LectCode VARCHAR2(20) NOT NULL REFERENCES Lect(Lect_Code)
);
CREATE SEQUENCE Eval_Seq
START WITH 1
INCREMENT BY 1;
--Create table Attend
CREATE TABLE Attend
(
	Attend_Idx NUMBER PRIMARY KEY,
	Attend_Nalja DATE NOT NULL,
	Attend_StuId VARCHAR2(16) NOT NULL REFERENCES Stu(Stu_Id),
	Attend_LectCode VARCHAR2(20) NOT NULL REFERENCES Lect(Lect_Code),
	Attend_BeginTime DATE NOT NULL,
	Attend_IsBeginChecked NUMBER(1) NOT NULL,
	Attend_EndTime DATE,
	Attend_IsEndChecked NUMBER(1) NOT NULL
);
CREATE SEQUENCE Attend_Seq
START WITH 1
INCREMENT BY 1;
--Create table Guest
CREATE TABLE Guest
(
	Guest_Id VARCHAR2(16) PRIMARY KEY,
	Guest_Name VARCHAR2(15) NOT NULL,
	Guest_Tel VARCHAR2(20) NOT NULL,
	Guest_Email VARCHAR2(36) NOT NULL,
	Guest_Addr VARCHAR2(200) NOT NULL,
	Guest_Pw VARCHAR2(16) NOT NULL
);
--Create table Member
CREATE TABLE Member
(
	Member_Id VARCHAR2(16) PRIMARY KEY,
	Member_Pw VARCHAR2(16) NOT NULL,
	Member_Auth INT NOT NULL
);



insert into dep values ('admin', '행정팀');
insert into dep values ('sales', '영업팀');
insert into dep values ('teacher', '강사팀');

insert into guest values ('guest00', '게스트01', '01011112222', 'guest01@gmail.com', '서울', 'guest01');

insert into staf values ('admin00', '김행정', '01011112222', 'admin00@gmail.com', '서울', 'admin00', 'admin');
insert into staf values ('teacher00', '박강사', '01033334444', 'teacher00@gmail.com', '인천', 'teacher00', 'teacher');
insert into staf values ('sales00', '이영업', '01055556666', 'sales00@gmail.com', '경기', 'sales00', 'sales');

insert into stu values ('stu00', '이학생', '01088889999', 'stu00@naver.com', '대전', 'stu00', 'lect00');

insert into member values ('guest00', 'guest00', 0);
insert into member values ('stu00', 'stu00', 1);
insert into member values ('teacher00', 'teacher00', 2);
insert into member values ('sales00', 'sales00', 3);
insert into member values ('admin00', 'admin00', 4);
