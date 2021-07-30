-- Author: Joshua Early
-- 2017

CREATE VIEW Upper_Class_Students_v (First, Last, Rank, GPA, Gender, Dorm, Room, Campus, Zip) AS 
SELECT Student1.First, Student1.Last, Student1.Rank, Student1.GPA, Student1.Gender, Room_Assign.Dorm_Name, Room_Assign.Room_no, Dorm.Campus, Campus.Zip
FROM Student1
INNER JOIN Room_Assign
ON Student1.SID=Room_Assign.SID
INNER JOIN Dorm
ON Room_Assign.Dorm_Name=Dorm.Name
INNER JOIN Campus
ON Campus.Name=Dorm.Campus
WHERE Student1.Rank='JR' OR Student1.Rank='SR';

SELECT Dorm, Room
FROM Upper_Class_Students_v
WHERE Gender='F'
ORDER BY "Dorm" ASC, "Room" ASC;

SELECT First, Last, Zip
FROM Upper_Class_Students_v
WHERE Rank='SR' AND (Campus='Annandale' OR Campus='Manassas');

SELECT Campus, COUNT(Room) AS Room
FROM Upper_Class_Students_v
GROUP BY Campus;



CREATE VIEW Upper_Class_Students_v AS 
SELECT Student1.First AS "First", Student1.Last AS "Last", Student1.Rank AS "Rank", Student1.GPA, Student1.Gender AS "Gender", Room_Assign.Dorm_Name AS "Dorm", Room_Assign.Room_no AS "Room", Dorm.Campus AS "Campus", Campus.Zip
FROM Student1
INNER JOIN Room_Assign
ON Student1.SID=Room_Assign.SID
INNER JOIN Dorm
ON Room_Assign.Dorm_Name=Dorm.Name
INNER JOIN Campus
ON Campus.Name=Dorm.Campus
WHERE Student1.Rank='JR' OR Student1.Rank='SR';

SELECT "Dorm", "Room"
FROM Upper_Class_Students_v
WHERE "Gender"='F'
ORDER BY "Dorm" ASC, "Room" ASC;

SELECT "First", "Last", Zip
FROM Upper_Class_Students_v
WHERE "Rank"='SR' AND ("Campus"='Annandale' OR "Campus"='Manassas');

SELECT "Campus", COUNT("Room") AS "Room"
FROM Upper_Class_Students_v
GROUP BY "Campus";
