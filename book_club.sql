-- Joshua Early
-- 2017

DROP TABLE Books;
DROP TABLE Members CASCADE CONSTRAINTS;
DROP TABLE Events;
DROP TABLE Category;

CREATE TABLE Books
(
	    BookID          INTEGER
,       Name            VARCHAR(30) NOT NULL
,       Pub_year        INTEGER
,       CatID           INTEGER
,       Fiction         VARCHAR(1)
,	    PRIMARY KEY (BookID)
,       CONSTRAINT CK_FICTION CHECK (fiction = 'Y' OR fiction = 'N')
);

CREATE TABLE Members
(
        MemID   INTEGER
,       First   VARCHAR(13)
,       Last    VARCHAR(13)
,       Street  VARCHAR(15)
,       City    VARCHAR(10)
,       Gender  VARCHAR(1)
,       DOB     VARCHAR(12)
,	    PRIMARY KEY (MemID)
, 	    CONSTRAINT CK_CITY CHECK (city = 'Roanoke' OR city = 'Salem')
,       CONSTRAINT CK_GENDER CHECK (gender = 'F' OR gender = 'M')
--,       CONSTRAINT CK_DOB CHECK (TO_CHAR(dob, 'MM/DD/YYYY') >= '01/01/1996')
);

CREATE TABLE Events
(
 	    MemID           INTEGER
,       Assign_date     VARCHAR(10)
,       BookID          INTEGER
,       Meet_date       VARCHAR(12)
,       Est_cost        INTEGER
,	    FOREIGN KEY (MemID) REFERENCES Members(MemID) 
,	    FOREIGN KEY (BookID) REFERENCES Books(BookID)
,       CONSTRAINT CK_EST_COST CHECK (Est_cost <= 150)
);

CREATE TABLE Category
(
	    CatID   INTEGER
,       Name    VARCHAR(10)
, 	    PRIMARY KEY (CatID)
);

insert into books values (100, 'The Whistler', 2016, 10, 'Y');
insert into books values (101, 'Paper Dolls', 2014, 10, 'Y');
insert into books values (102, 'Emma', 2015, 12, 'Y');
insert into books values (103, 'Fatherhood: On Being a Hero', 2015, 16, 'N');
insert into books values (104, 'Brooklyn', 2016, 14, 'Y');
insert into books values (105, 'Serena', 2014, 14, 'Y');

insert into members values (200, 'James', 'Earl', '75 Main St', 'Salem', 'M', '1/04/1971');
insert into members values (201, 'Sally', 'Earl', '75 Main St', 'Salem', 'F', '1/23/1969');
insert into members values (202, 'Laurie', 'Ingle', '2 Rosedale Ln', 'Roanoke', 'F', '8/09/1986');
insert into members values (203, 'Susan', 'Gleasom', '22 Jonson Rd', 'Roanoke', 'F', '4/26/1985');
insert into members values (204, 'Alexandria', 'Williams', '2345 Route 1', 'Salem', 'F', '10/07/1983');
insert into members values (205, 'Thomas', 'Raiver', '67 River Rd', 'Roanoke', 'M', '9/11/1965');

-- Adding another member to test City constraint
insert into members values (205, 'Thomas', 'Raiver', '67 River Rd', 'Blacksburg', 'M', '9/11/1965');

insert into events values (205, 'Jan 2016', 103, '6/5/2016', 100);
insert into events values (203, 'Oct 2015', 102, '1/3/2016', 150);
insert into events values (202, 'Mar 2016', 104, '6/28/2016', 49);
insert into events values (200, 'Dec 2016', 100, '1/2/2017', 97);
insert into events values (201, 'Jun 2015', 101, '9/8/2015', 120);
insert into events values (204, 'Aug 2016', 105, '12/12/2016', 130);

-- Adding another event to test Est_cost constraint
insert into events values (204, 'Aug 2016', 105, '12/12/2016', 151);

insert into category values (10, 'Mystery');
insert into category values (12, 'Romance');
insert into category values (14, 'Drama');
insert into category values (16, 'Historical');

-- Changes
update events set est_cost = 135 where Memid=203;
update events set meet_date = '6/5/2016' where MemID=200;
update events set meet_date = '1/2/2017' where MemID=205;
update books set catid=14 where bookid=101;
update events set memid=201 where bookid=100;
update members set last='Smizens' where memid=204;
