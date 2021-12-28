CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_in_family_jewelry`()
BEGIN
DECLARE x  INT;
DECLARE random_number  INT;
SET x = 1;
insert_loop: loop
	if x>10 then
		leave insert_loop;
	end if;
    set random_number = FLOOR(RAND()*(1000-5+1))+5;
    if not concat('Noname', random_number) = any(select distinct name from family_jewelry) then
		insert family_jewelry(name, expected_value, max_value, min_value, code) values
			(concat('Noname', random_number), 10,2,4, 5);
		set x = x+1;
	end if;
    iterate insert_loop;
End loop;
	
END