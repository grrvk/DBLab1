do $$
declare
   counter integer := 0;
begin
   while counter < 20000 loop
      CALL create_ticket(1, 10, 'Vika','Hranadzer', '380504444444', 'test@gmail.com');
	  counter := counter + 1;
   end loop;
end$$;