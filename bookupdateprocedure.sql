create or replace procedure bookupdate(id BOOKED.bkid%TYPE,datee in  BOOKED.perf_date%TYPE,
									   place in BOOKED.perf_place%TYPE,dis in BOOKED.distance_from_dhaka%TYPE,
									   bnd in  BOOKED.bid%TYPE, org in  BOOKED.oid%TYPE)
			is
			

begin	

	insert into BOOKED(bkid,perf_date,perf_place,distance_from_dhaka,bid,oid) values(id,datee,place,dis,bnd,org);
	commit;
	
end;
/
	