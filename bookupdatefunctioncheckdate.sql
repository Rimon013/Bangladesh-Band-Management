create or replace function checkdate(dateee in BOOKED.perf_date%TYPE,bnd in  BOOKED.bid%TYPE)
return number
is
flag number:=0;

BEGIN

	for r in (select perf_date   from BOOKED where bid=bnd)LOOP

		if(r.perf_date=dateee)then
		flag:=1;
	
		end if;
	end loop;
	
	return flag;
/*if(f=1)then
	flag =0;
	
return flag;
else
	flag =1;
return flag;
end if;
*/

END checkdate;
/