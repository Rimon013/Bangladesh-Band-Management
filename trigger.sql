CREATE OR REPLACE TRIGGER INSERTION
AFTER INSERT ON VOLUNTEERING1
BEGIN
DBMS_OUTPUT.PUT_LINE('DATA INSERTED in volunteering1 table');
END;
/

--CREATE OR REPLACE TRIGGER UPDATEE
--AFTER UPDATE ON 
CREATE OR REPLACE TRIGGER INSERTION1
AFTER INSERT ON BOOKED
BEGIN
DBMS_OUTPUT.PUT_LINE('DATA INSERTED in booked table');
END;
/
CREATE OR REPLACE TRIGGER INSERTION2
AFTER INSERT ON VOLUNTEERING
BEGIN
DBMS_OUTPUT.PUT_LINE('DATA IS INSERTED IN VOLUNTEERING');
END;
/
CREATE OR REPLACE TRIGGER updated
AFTER UPDATE ON ORGANIZATION1
BEGIN
DBMS_OUTPUT.PUT_LINE('DATA IS UPDATED IN organization1');
END;
/
