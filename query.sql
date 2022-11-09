-- Edit the follow two variables and remember to rename the c# class with singular word

set @table_schema = 'db_test';
set @table_name = 'customers';

select concat('public class ', CONCAT(UCASE(LEFT(@table_name, 1)), LCASE(SUBSTRING(@table_name, 2))), ' {' ) as res 
union
select concat('    ', P1, P2, CONCAT(UCASE(LEFT(P3, 1)), SUBSTRING(P3, 2)), P4, P5) res from  (
  select 'public ' P1, 
  case 
    when data_type = 'int' then 'int '
    when data_type = 'bigint' then 'int '  
    when data_type = 'varchar' then 'string '
    when data_type = 'datetime' then 'DateTime? '
    else data_type
  end as P2,
  replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(column_Name,'_a','A'),'_b','B'),'_c','C'),'_d','D'),'_e','E'),'_f','F'),'_g','G'),'_h','H'),'_i','I'),'_l','L'),'_m','M'),'_n','N'),'_o','O'),'_p','P'),'_q','Q'),'_r','R'),'_s','S'),'_t','T'),'_u','U'),'_v','V'),'_z','Z'),'_x','X'),'_y','Y'),'_k','K'),'_j','J') as P3,
  ' { get; set; }' as P4,
  if(column_key = 'PRI', ' // PK','') as P5
  from information_schema.columns
  where 1=1
  and table_schema=@table_schema
  and table_name like @table_name
  order by ordinal_position
) t
union
select '}' as res 

/*
Result:
public class Customers {
    public int Id { get; set; } // PK
    public string Name { get; set; }
    public string Surname { get; set; }
    public string Username { get; set; }
    public string Password { get; set; }
    public DateTime? DtCreation { get; set; }
}
    
*/
