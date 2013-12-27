CREATE TABLE IF NOT EXISTS account
(
        accountID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        personID INT NOT NULL,
        usergroupID INT NOT NULL,
        username VARCHAR(20),
        hash VARCHAR(500),
        salt VARCHAR(50),
        lastLogin DATE NULL
);

CREATE TABLE address
(
	addressID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	street VARCHAR(100) NOT NULL,
	zipcode VARCHAR(10) NOT NULL,
	apt VARCHAR(10) NOT NULL,
	house_no VARCHAR(10) NULL,
	direction VARCHAR(1) NOT NULL,
	state VARCHAR(15) NOT NULL,
	city VARCHAR(20) NOT NULL,
	phone VARCHAR(10) NOT NULL,
	country VARCHAR(20) NOT NULL,
	email VARCHAR(50) NULL
);

CREATE TABLE person
(
	personID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	accountID INT NOT NULL  REFERENCES account(accountID),
	addressID INT NOT NULL  REFERENCES address(addressID),
	lastName VARCHAR(50) NOT NULL,
	firstName VARCHAR(50) NOT NULL,
	middleName VARCHAR(50) NOT NULL,
	suffix VARCHAR(4) NOT NULL,
	gender VARCHAR(6) NOT NULL,
	birthDate DATE NOT NULL,
	language VARCHAR(15) NOT NULL,
	ethinicity VARCHAR(20) NOT NULL,
	FOREIGN KEY (accountID) REFERENCES account(accountID),
	FOREIGN KEY	(addressID) REFERENCES address(addressID)
);