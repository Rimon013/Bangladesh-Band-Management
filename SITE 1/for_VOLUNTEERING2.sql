set serveroutput on; 
set linesize 300;

accept a prompt 'Enter place :'
accept b prompt 'Enter date :'
accept c prompt 'Enter payment :'

accept d prompt 'Enter organization number:'
accept e prompt 'Enter teams number:'
accept k prompt 'input again?:'

DECLARE 

	ID VOLUNTEERING2.vid%TYPE;
	PLACE VOLUNTEERING2.vplace%TYPE:= '&a';
	DATEE VOLUNTEERING2.vdate%TYPE:='&b';
	PAY VOLUNTEERING2.vrate%TYPE:= &c;
	ORGNO VOLUNTEERING2.oid%TYPE:= &d;
	TEAMNO VOLUNTEERING2.oid%TYPE:= &e;
	DATEEE VOLUNTEERING2.vdate%TYPE;
	NUM NUMBER:=5;
	YES_NO VOLUNTEERING2.vplace%TYPE:='&k';
	T VOLUNTEERING2.vplace%TYPE;
	A VOLUNTEERING2.vdate%TYPE;
	WRONG_DATE EXCEPTION;
	WRONG_TIME EXCEPTION;
	WRONG_PLACE EXCEPTION;
	WRONG_TEAM EXCEPTION;
	
BEGIN
	SELECT COUNT(vid) INTO ID FROM VOLUNTEERING2;
	ID:=(ID+1);
	
	FOR R IN 1..NUM LOOP
		--have to check date for organization number
		FOR W IN(SELECT perf_date,OID FROM BOOKED @MAIN1 where ORGNO=OID)LOOP
			IF (DATEE!=W.perf_date)THEN
					RAISE WRONG_DATE;
			else
				exit;
			END IF;
		END LOOP;
		--have to check team no in teams table
		FOR X IN (SELECT tplace FROM TEAMS where TEAMNO=TID)LOOP
			IF(X.tplace!='chittagong')THEN
					RAISE WRONG_TEAM;
			END IF;
		END LOOP;
		--have to check whether the team is free or not at that date
		FOR S IN(SELECT vdate FROM VOLUNTEERING2 WHERE TEAMNO=TID)LOOP
			IF(DATEE = S.vdate )THEN
					RAISE WRONG_TIME;
			END IF;
		END LOOP;
		--the concert has to be open
		FOR T IN(SELECT place,TYPES  FROM ORGANIZATION2 where ORGNO=OID)LOOP
			IF(PLACE!=T.place OR T.TYPES!='open' )THEN
				
				--dbms_output.put_line(PLACE||T.TYPES);
				RAISE WRONG_PLACE;
			END IF;
		END LOOP;
		
		dbms_output.put_line('ID'||CHR(9)||'PLACE'||CHR(9)||'DATE'||CHR(9)||CHR(9)||'PAY'||CHR(9)||'ORGNO'||CHR(9)||'TEAMNO'||CHR(10)||
							ID||CHR(9)||PLACE||CHR(9)||DATEE||CHR(9)||PAY||CHR(9)||ORGNO||CHR(9)||TEAMNO);
		INSERT INTO VOLUNTEERING2(vid,vplace,vdate,vrate,oid,tid)VALUES(ID,PLACE,DATEE,PAY,ORGNO,TEAMNO);
		--COMMIT;
						
		
		IF(YES_NO='NO')THEN
		EXIT;
		END IF;
	END LOOP;
	COMMIT;

EXCEPTION

	WHEN WRONG_TIME THEN
		DBMS_OUTPUT.PUT_LINE('THE TEAM IS BUSY IN ANOTHER PLACE');
		
	WHEN WRONG_DATE THEN
		DBMS_OUTPUT.PUT_LINE('THE DATE HAS NOT BOOKED YET FOR THAT ORGANIZATION');
	
	WHEN WRONG_PLACE THEN
		DBMS_OUTPUT.PUT_LINE('THIS IS THE OUTSIDE PLACE/OUT OF TYPES FOR TEAMS RANGE');
		
	WHEN WRONG_TEAM THEN
		DBMS_OUTPUT.PUT_LINE('THE TEAM NUMBER IS OUT OF BOUNDARY');

END;
/
	