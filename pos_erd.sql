-- Author: Joshua Early
-- 2017
DROP TABLE Orders;
DROP TABLE Order_Line;

CREATE TABLE Orders
(
		OrderID		INTEGER(10)
	,	CustID		INTEGER(10)
	,	OrderDate	VARCHAR(20)
	,	Status		INTEGER(1)
);

CREATE TABLE Order_Line
(
		OrderID		INTEGER(10)	
	,	ProdID		INTEGER(10) NOT NULL
	,	Qty			INTEGER(10) NOT NULL
);

INSERT INTO Orders VALUES (500, 546, '8/8/2006', 1)
