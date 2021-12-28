CREATE DEFINER=`root`@`localhost` PROCEDURE `create_family_name`()
BEGIN
declare done bool default false;
    declare companion_name varchar(45);
    declare first_value_passed bool default false;
    declare F_Cursor cursor for select distinct `name` from family_companion;
    declare continue handler for not found set done = TRUE;
    set @create_statement = 'CREATE TABLE `companions_names` ( ';

    open F_Cursor;
    create_loop: loop
        fetch F_Cursor into companion_name;
        if (done)
            then 
                set @create_statement = concat(@create_statement, ");");
                leave create_loop;
        end if;
        if (first_value_passed) 
            then set @create_statement = concat(@create_statement, ",");
        end if;
        set @create_statement = concat(@create_statement, " `", companion_name, "` int");
        set first_value_passed = true;
    end loop;

    drop table if exists `companions_names`;
    prepare create_query from @create_statement;
    execute create_query;
    deallocate prepare create_query;

    close F_Cursor;
END