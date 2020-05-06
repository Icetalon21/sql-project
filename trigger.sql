/* The purpose of this trigger is to be able to update the description on a type of 
event.  There may be a strike out but the reason may be different than previously stated.
*/

SELECT *
FROM information_schema.TABLES;

SELECT TABLE_NAME
FROM information_schema.TABLES
WHERE ENGINE = 'MYISAM'
	AND TABLE_SCHEMA = 'sql_project';

SELECT TABLE_NAME
FROM information_schema.TABLES
WHERE ENGINE = 'InnoDB'
	AND TABLE_SCHEMA = 'sql_project';

CREATE TABLE Batter_Details_Log (
User VARCHAR(255),
pitcher INT(15),
events VARCHAR(50),
oldDescription VARCHAR(50), 
newDescription VARCHAR(50),
LogDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

SELECT USER();
 

DELIMITER //
CREATE TRIGGER Judge_Batter_Details_After_Update
	AFTER UPDATE ON judge 
	FOR EACH ROW
BEGIN
	INSERT INTO Batter_Details_Log 
	(User, pitcher, events, oldDescription, newDescription)
	VALUES
	(USER(), OLD.pitcher, OLD.events, OLD.description, NEW.description);
END


//

DELIMITER ;


DROP trigger Judge_Batter_Details_After_Update;


SHOW TRIGGERS;


UPDATE judge
SET description = 'home run!!'
WHERE events = 'home_run';


SELECT *
FROM Batter_Details_Log
GROUP BY pitcher;