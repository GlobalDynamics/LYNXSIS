CREATE TABLE IF NOT EXISTS account
(
        accountID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        username VARCHAR(20) NOT NULL,
        hash VARCHAR(500) NOT NULL,
        salt VARCHAR(50) NOT NULL,
        lastLogin DATE NULL
);

CREATE TABLE IF NOT EXISTS address
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

CREATE TABLE IF NOT EXISTS person
(
	personID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	accountID INT NOT NULL,
	addressID INT NOT NULL,
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

CREATE TABLE IF NOT EXISTS usergroup
(
        usergroupID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(100) NOT NULL,
        defaultGroup VARCHAR(1) NOT NULL
);

CREATE TABLE IF NOT EXISTS permissions
	(
		permissionID INT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
		moduleID INT NOT NULL,
		usergroupID INT NOT NULL,
		accessType INT
	)