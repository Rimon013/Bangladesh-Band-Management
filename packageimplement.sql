SET SERVEROUTPUT on;

  --Variable C number;
create or replace package body myPackage as 
		procedure checkconcert(band_name  in BANDS.btitle%TYPE,p_cur OUT SYS_REFCURSOR )
		as
		/*type xx is RECORD
		(D BANDS.btitle%TYPE,
		E ORGANIZATION.place%TYPE,
		F BOOKED.perf_date%TYPE
		)
		;

		 var xx%TABLETYPE;
		var1 var;*/
		begin
		
		OPEN p_cur for
		SELECT BANDS.btitle ,ORGANIZATION.place,BOOKED.perf_date  from BANDS 
		 inner join BOOKED on BANDS.bid=BOOKED.bid 
		inner join ORGANIZATION on BOOKED.oid=ORGANIZATION.oid 
		where ORGANIZATION.types='open' and BANDS.btitle=band_name;
		/*for i in 1..var1.count
		loop
		*/
		END checkconcert;
		
	
	
	
		function lowestpoint(id in out BOOKED.bid%TYPE,point out booked.bid%TYPE)
		return BOOKED.bid%TYPE
		is
		a booked.bid%type;
		b booked.bid%TYPE;
	
		begin
		select booked.bid,min(organizing) into a,b from organization 
		inner join booked on booked.oid=organization.oid group by booked.bid having booked.bid=id;
		return b;
	
		end lowestpoint;
	
	
	
	
	
		PROCEDURE TEAMRECORD(TEAM_NAME IN TEAMS.TTITLE%TYPE,C_CUR OUT SYS_REFCURSOR)
		AS
		A VOLUNTEERING.VDATE%TYPE;
		B TEAMS.TTITLE%TYPE;
		C VOLUNTEERING.OID%TYPE;
	
		begin
		open C_CUR FOR 
		select teams.ttitle,VOLUNTEERING.vdate,BANDS.btitle,organization.oname,Volunteering.Vsalary from teams 
		inner join Volunteering on teams.tid=Volunteering.tid
		inner join organization on organization.oid=Volunteering.oid 
		inner join booked on booked.oid=organization.oid 
		inner join bands on bands.bid=booked.bid 
		where teams.ttitle=TEAM_NAME and Volunteering.Vdate=booked.perf_date;
		--open D_CUR FOR
		--SELECT * from BANDS where bid=C;
		END TEAMRECORD;
	
	
	
END myPackage;	
/

		
		
	
	