Create DATABASE QuanLyBanHang;
use QuanLyBanHang;
CREATE TABLE Customer(
    cID INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    cName VARCHAR(20) ,
    cAge INT
);
CREATE TABLE Order1(
    oID INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    cID INT NOT NULL ,
    oDate DATETIME ,
    oTotalPrice DOUBLE,
    FOREIGN KEY (cID)references Customer(cID)
);
CREATE TABLE Product1(
    pID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pName VARCHAR(20) ,
    pPrice DOUBLE
);
CREATE TABLE OrderDetail(
    oID INT NOT NULL ,
    pID INT NOT NULL ,
    odQTY double,
    FOREIGN KEY (oID) references Order1(oID),
    FOREIGN KEY (pID)references Product(pID)
);

SELECT *FROM Customer;
SELECT *FROM Order1;
SELECT *FROM Product1;
SELECT *FROM OrderDetail;

INSERT INTO Customer(cName, cAge) VALUES ('Minh Quan',10),('Ngoc Oanh',20),('Hong Ha',50);
INSERT INTO Order1 (cID, oDate, oTotalPrice) VALUES (1,'2006-3-21',null),(2,'2006-3-23',null),(1,'2006-3-16',null);
INSERT INTO Product1( pName, pPrice) VALUES ('May Giat',3),('Tu lanh ',5),('Dieu hoa',7),('Quat',1),('Bep Dien',2);
SELECT *FROM OrderDetail;
SELECT C.cName ,C.cID , O.oID ,P.pID, P.pName FROM Customer C join Order1 O on C.cID = O.cID join OrderDetail OD on O.oID = OD.oID join Product1 P on OD.pID = P.pID;
SELECT C.cName, C.cID,O.oID FROM Customer C LEFT JOIN Order1 O on C.cID = O.cID where NOT EXISTS(SELECT *FROM order1 WHERE C.cID=O.cID);
SELECT O.oID,O.oDate, Sum( OD.odQTY*p.pPrice) FROM order1 O Join OrderDetail OD on O.oID = OD.oID join product1 p on OD.pID = p.pID GROUP BY O.oID