-- Joshua Early
-- 2017
-- Create initial Explorers schema for exercise

DROP TABLE Explorer;
DROP TABLE Room;
DROP TABLE Move_Log;
DROP SEQUENCE move_seq;


CREATE TABLE Room
(
	Room_ID			NUMBER
,	Name			VARCHAR2(20)
,	Next_Room_ID	NUMBER 
, CONSTRAINT Room_PK PRIMARY KEY (Room_ID)
); 

CREATE TABLE Explorer
(
	Name			VARCHAR2(20)
,	Room_ID			NUMBER
, CONSTRAINT Exp_PK PRIMARY KEY (Name)
, CONSTRAINT Exp_Room_FK FOREIGN KEY (Room_ID) REFERENCES Room
);

COMMIT; 


CREATE TABLE Move_Log
(
	Name		VARCHAR2(5)
,	Move_Num	NUMBER(3)
,	From_Room	NUMBER(3)
,	To_Room		NUMBER(3)
,	Move_Date	TIMESTAMP
);

CREATE SEQUENCE move_seq
	MINVALUE	-1
	START WITH	0;

COMMIT; 

-- Load rooms 

INSERT INTO Room (Room_ID, Name, Next_Room_ID)
VALUES (1, 'Start Room', 2);

INSERT INTO Room (Room_ID, Name, Next_Room_ID)
VALUES (2, 'Davis 216', 3);

INSERT INTO Room (Room_ID, Name, Next_Room_ID)
VALUES (3, 'Davis 225', 4);

INSERT INTO Room (Room_ID, Name, Next_Room_ID)
VALUES (4, 'the End Room', null);

-- Load explorer 

INSERT INTO Explorer (Name, Room_ID)
VALUES ('Dora', 1);

COMMIT; 
