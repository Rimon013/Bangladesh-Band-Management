IDno     NAME       SEC                        
1		A			C      
2		B			D    
3		C 			A      
4		D 			B                      IDNO       SUBNO    
											


SUBNO    SUBNAME      TEACHER   
1		BANGLA        A          
2		ENG			  B          
3		MATH		  C          
4       PHYSICS       D         
5       CHEMISTRY     E          
6       ACCOUNTING    F          





















set serveroutput on; 
declare
A organization.oid%TYPE;
B organization.oid%TYPE:=&i;
BEGIN
UPDATE organization set organizing=organizing+1 where (select organization.oid   from organization 
inner join booked on organization.oid=booked.oid where booked.perf_date=to_char (sysdate))=B and oid = B;

--dbms_output.put_line(sysdate);
commit;
end;
/
