set serveroutput on; 
set linesize 300;

accept b prompt 'Enter date :'
accept c prompt 'Enter place :'
accept d prompt 'Enter distance :'
accept e prompt 'Enter bands :'
accept f prompt 'Enter organization number:'

declare 

	 user_date  BOOKED.perf_date%TYPE:='&b';
	 user_place  BOOKED.perf_place%TYPE:='&c';
	 user_distance BOOKED.distance_from_dhaka%TYPE:= &d;
	 user_bid VOLUNTEERING.oid%TYPE:= &e;
	 user_oid VOLUNTEERING.oid%TYPE:= &f;
	 counts BOOKED.bkid%TYPE;
	 i BOOKED.bkid%TYPE;
	 j number;
	 WRONG_DATE EXCEPTION;

begin

	select count(bkid) into counts from BOOKED;
	i:=(counts+1);
	dbms_output.put_line('id = ' || i);
	dbms_output.put_line('date  = ' || user_date);
	dbms_output.put_line('place  = ' || user_place);
	dbms_output.put_line('distance = ' || user_distance);
	dbms_output.put_line('bid = ' || user_bid);
	dbms_output.put_line('oid =' || user_oid);
	
	for r in (select perf_date from booked where user_oid=oid)loop
	if(user_date=r.perf_date)then
		raise WRONG_DATE;
	end if;
	end loop;
	
	
	j:=checkdate(user_date,user_bid);
	if(j=1)then
	dbms_output.put_line('FAILED');
	
	else
	dbms_output.put_line('SUCCEED');
	bookupdate(i,user_date,user_place,user_distance,user_bid,user_oid);
	commit;
	end if;
	
	
	EXCEPTION

	WHEN WRONG_DATE THEN
		DBMS_OUTPUT.PUT_LINE('you already booked that date');
	end;
	/
