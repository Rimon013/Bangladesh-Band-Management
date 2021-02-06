SET SERVEROUTPUT on;
variable cur REFCURSOR;
variable vur REFCURSOR;
VARIABLE rur REFCURSOR;
accept z prompt 'Enter BANDS title for checkconcert :'
accept id prompt 'Enter BANDS id for checking lowestpoint of org. :'
accept name prompt 'Enter TEAMS title for for description :'
DECLARe

A BANDS.btitle%TYPE:='&z';
--var cur REFCURSOR;
B BOOKED.bid%TYPE:='&id';
C BOOKED.bid%TYPE;
D teams1.ttitle%TYPE:='&name';
E BANDS.bid%TYPE;

BEGIN
myPackage.checkconcert(A,:cur);
--print cur;
--DBMS_OUTPUT.PUT_LINE(po_A||po_B||po_C);
--print cur;

C:=myPackage.lowestpoint(B,C);
DBMS_OUTPUT.PUT_LINE('INPUT ID'||CHR(9)||'LOWEST point for org no'||CHR(10)||B||CHR(9)||CHR(9)||C);


myPackage.teamrecord(D,:vur);

END;
/
