  CREATE TABLE `cs532_banking`.`newaccount` (
  `ACCOUNTNO` INT NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(4000) DEFAULT NULL,
  `PASSWORD` varchar(4000) DEFAULT NULL,
  `REPASSWORD` varchar(4000) DEFAULT NULL,
  `AMOUNT` int(11) DEFAULT NULL,
  `ADDRESS` varchar(4000) DEFAULT NULL,
  `PHONE` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`ACCOUNTNO`)
); 

ALTER TABLE cs532_banking.newaccount AUTO_INCREMENT=1001;

CREATE TABLE `cs532_banking`.`transaction` (
  `tx_id` INT NOT NULL AUTO_INCREMENT,
  `accountno` INT NOT NULL,
  `time_stamp` date NULL,
  `amount` INT NULL,
  `balance` INT NULL,
  `description` VARCHAR(100) NULL,
  PRIMARY KEY (`tx_id`),
  FOREIGN KEY (`accountno`) 
  REFERENCES `cs532_banking`.`newaccount` (`accountno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );
    
