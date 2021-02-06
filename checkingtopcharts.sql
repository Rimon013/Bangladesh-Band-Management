SET SERVEROUTPUT on;
CREATE or replace DIRECTORY USER_DIR AS 'E:\4.1\DDS LAB\Bangladesh Music Band database system\topcharts'; 
     GRANT READ ON DIRECTORY USER_DIR TO PUBLIC;
	 grant execute on UTL_FILE to public;

 DECLARE 
		namee organization.oname%TYPE:='&n';
		A bands.btitle%TYPE;
        V1 VARCHAR2(700); 
		V2 VARCHAR2(700);
		V3 VARCHAR2(700);
		V4 VARCHAR2(700);
		V5 VARCHAR2(700);
		V6 VARCHAR2(700);
		V7 VARCHAR2(700);
		V8 VARCHAR2(700);
        F1 UTL_FILE.FILE_TYPE;
		F2 UTL_FILE.FILE_TYPE;
		F3 UTL_FILE.FILE_TYPE;
		F4 UTL_FILE.FILE_TYPE;
		F5 UTL_FILE.FILE_TYPE;
		F6 UTL_FILE.FILE_TYPE;
		F7 UTL_FILE.FILE_TYPE;
		F8 UTL_FILE.FILE_TYPE;
 BEGIN
	for r in (
	 select btitle from bands inner join booked on bands.bid=booked.bid 
	 inner join organization on organization.oid=booked.oid where organization.oname=namee)loop
	if (r.btitle='warfaze')then
	 F1 := UTL_FILE.FOPEN('USER_DIR','warfaze.txt','R'); 
		dbms_output.put_line('The topcharted songs of warfaze'||CHR(10));
	  Loop
        BEGIN
    UTL_FILE.GET_LINE(F1,V1); 
    dbms_output.put_line(V1);
    EXCEPTION WHEN No_Data_Found THEN EXIT; END;
        end loop;
		end if;
	if (r.btitle='artcell')then
	 F2 := UTL_FILE.FOPEN('USER_DIR','artcell.txt','R'); 
	 dbms_output.put_line('The topcharted songs of artcell'||CHR(10));        
	 Loop
        BEGIN
    UTL_FILE.GET_LINE(F2,V2); 
    dbms_output.put_line(V2);
    EXCEPTION WHEN No_Data_Found THEN EXIT; END;
        end loop;
		end if;
	if (r.btitle='nemesis')then
	 F3 := UTL_FILE.FOPEN('USER_DIR','nemesis.txt','R'); 
	 dbms_output.put_line('The topcharted songs of nemesis'||CHR(10));
        Loop
        BEGIN
    UTL_FILE.GET_LINE(F3,V3); 
    dbms_output.put_line(V3);
    EXCEPTION WHEN No_Data_Found THEN EXIT; END;
        end loop;
		end if;
	if (r.btitle='arbovirus')then
	 F4 := UTL_FILE.FOPEN('USER_DIR','arbo.txt','R'); 
	 dbms_output.put_line('The topcharted songs of arbovirus  '||CHR(10));
        Loop
        BEGIN
    UTL_FILE.GET_LINE(F4,V4); 
    dbms_output.put_line(V4);
    EXCEPTION WHEN No_Data_Found THEN EXIT; END;
        end loop;
		end if;
	if (r.btitle='nagar baul')then
	 F5 := UTL_FILE.FOPEN('USER_DIR','nagar baul.txt','R'); 
	 dbms_output.put_line('The topcharted songs of nagar baul'||CHR(10));
        Loop
        BEGIN
    UTL_FILE.GET_LINE(F5,V5); 
    dbms_output.put_line(V5);
    EXCEPTION WHEN No_Data_Found THEN EXIT; END;
        end loop;
		end if;
	if (r.btitle='bay of bengal')then
	 F6 := UTL_FILE.FOPEN('USER_DIR','bayofbengal.txt','R'); 
	 dbms_output.put_line('The topcharted songs of bayofbengal'||CHR(10));
        Loop
        BEGIN
    UTL_FILE.GET_LINE(F6,V6); 
    dbms_output.put_line(V6);
    EXCEPTION WHEN No_Data_Found THEN EXIT; END;
        end loop;
		end if;
	if (r.btitle='metrical')then
	 F7 := UTL_FILE.FOPEN('USER_DIR','metrical.txt','R'); 
	 dbms_output.put_line('The topcharted songs of metrical'||CHR(10));
        Loop
        BEGIN
    UTL_FILE.GET_LINE(F7,V7); 
    dbms_output.put_line(V7);
    EXCEPTION WHEN No_Data_Found THEN EXIT; END;
        end loop;
		end if;
	if (r.btitle='stone')then
	 F8 := UTL_FILE.FOPEN('USER_DIR','stone.txt','R'); 
	 dbms_output.put_line('The topcharted songs of stone'||CHR(10));
        Loop
        BEGIN
    UTL_FILE.GET_LINE(F8,V8); 
    dbms_output.put_line(V8);
    EXCEPTION WHEN No_Data_Found THEN 
	dbms_output.put_line('Nothing');
	Exit; END;
        end loop;
		end if;
	end loop;
	   UTL_FILE.FCLOSE(F1); 
	   UTL_FILE.FCLOSE(F2);
	   UTL_FILE.FCLOSE(F3);
	   UTL_FILE.FCLOSE(F4);
	   UTL_FILE.FCLOSE(F5);
	   UTL_FILE.FCLOSE(F6);
	   UTL_FILE.FCLOSE(F7);
	   UTL_FILE.FCLOSE(F8);
     END; 
     /
	