create or replace package myPackage as
	

	procedure checkconcert(band_name in  BANDS.btitle%TYPE,p_cur OUT SYS_REFCURSOR);
	
	function lowestpoint(id in out BOOKED.bid%TYPE,point out booked.bid%TYPE)
	return BOOKED.bid%TYPE;
	
	procedure teamrecord(team_name in TEAMS.ttitle%TYPE,c_cur OUT SYS_REFCURSOR);
		--procedure checkconcert1=(band_name in  BANDS.btitle%TYPE,p_cur OUT SYS_REFCURSOR);
		
END myPackage;
/