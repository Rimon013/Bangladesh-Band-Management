clear screen;

DROP TABLE BANDS2 CASCADE CONSTRAINTS;
DROP TABLE BOOKED2 CASCADE CONSTRAINTS;
DROP TABLE ORGANIZATION2 CASCADE CONSTRAINTS;
DROP TABLE TEAMS2 CASCADE CONSTRAINTS;
DROP TABLE VOLUNTEERING2 CASCADE CONSTRAINTS;

CREATE TABLE BANDS2 (
	bid int , 
	btitle varchar2(20), 
	origin varchar2(20),
	vocalist varchar2(20), 
	lead_guitar varchar2(20),
	bass_guitar varchar2(20),
	drummer varchar2(20),
    PRIMARY KEY(bid));
	

CREATE TABLE ORGANIZATION2 (
	oid int,
	oname varchar2(20),
	place varchar2(20),
	types varchar2(10),
	organizing int,
	primary key(oid)
);

CREATE TABLE BOOKED2 (
	bkid int, 
	perf_date date,
	perf_place varchar2(20),
	distance_from_dhaka int,
	bid int,
	oid int,
	PRIMARY KEY(bkid),
	CONSTRAINT FK_PersonOrder FOREIGN KEY (bid)
    REFERENCES BANDS2(bid),
	CONSTRAINT FK_Person FOREIGN KEY (oid)
    REFERENCES ORGANIZATION2(oid));
	
CREATE TABLE TEAMS2 (
	tid int,
	ttitle varchar2(20),
	tplace varchar2(20),
	primary key(tid));

CREATE TABLE VOLUNTEERING2(
	vid int,
	vplace varchar2(20),
	vdate date,
	vrate number,
	oid int,
	tid int,
	primary key(vid),
	FOREIGN KEY(oid) REFERENCES ORGANIZATION2(oid),
	FOREIGN KEY(tid) REFERENCES TEAMS2(tid));
	
	


commit;
	