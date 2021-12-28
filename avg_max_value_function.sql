CREATE DEFINER=`root`@`localhost` FUNCTION `avg_max_value`() RETURNS int
    DETERMINISTIC
BEGIN
	RETURN (select avg(max_value) from family_jewelry);
END