INSERT INTO account (usergroupID, username,hash,salt) VALUES(1,'admin', 'ddcf4de8b8bea5c01ca12851bb810998','XIJD3Y0SAZREcJ2iIbC4Yy9PBeuUIHtZKKMFNBLl');
INSERT INTO address (street, zipcode,house_no,direction,state,city,phone,country,email) VALUES('Space','55421', '9899','N','Minnesota','Richfield','9999999999','USA','example@example.com');
INSERT INTO person(accountID,addressID,lastName,firstName,middleName,suffix,gender,birthDate,language,ethinicity) VALUES(1,1,'Goat','Wild','Worm','Mr.','Male','1990-12-12','English','White');