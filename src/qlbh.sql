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
CREATE TABLE Product(
    pID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cName VARCHAR(20) ,
    cPrice DOUBLE
);
CREATE TABLE OrderDetail(
    oID INT NOT NULL ,
    pID INT NOT NULL ,
    odQTY double,
    FOREIGN KEY (oID) references Order1(oID),
    FOREIGN KEY (pID)references Product(pID)
);