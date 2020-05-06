/* This stored procedure is to count the number of rows that Stanton's 
hit zone is 5.  From previous examples, we have seen that zone 5 is in the middle and 
is one of the most popular locations for home runs to be hit. The procedure could be run to 
see how much the number of rows increases each game.
*/

DELIMITER //
CREATE PROCEDURE getStantonZoneCount ()
BEGIN 
	SELECT COUNT(*) 
	FROM stanton
	WHERE zone = 5;
END

//

DELIMITER;

CALL getStantonZoneCount();