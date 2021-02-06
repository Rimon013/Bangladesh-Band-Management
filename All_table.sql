clear screen;

DROP TABLE BANDS CASCADE CONSTRAINTS;
DROP TABLE BOOKED CASCADE CONSTRAINTS;
DROP TABLE ORGANIZATION CASCADE CONSTRAINTS;
DROP TABLE TEAMS CASCADE CONSTRAINTS;
DROP TABLE VOLUNTEERING CASCADE CONSTRAINTS;

CREATE TABLE BANDS (
	bid int , 
	btitle varchar2(20), 
	origin varchar2(20),
	vocalist varchar2(20), 
	lead_guitar varchar2(20),
	bass_guitar varchar2(20),
	drummer varchar2(20),
    PRIMARY KEY(bid));
	

CREATE TABLE ORGANIZATION (
	oid int,
	oname varchar2(20),
	place varchar2(20),
	types varchar2(10),
	organizing int,
	primary key(oid)
);

CREATE TABLE BOOKED (
	bkid int, 
	perf_date date,
	perf_place varchar2(20),
	distance_from_dhaka int,
	bid int,
	oid int,
	PRIMARY KEY(bkid),
	FOREIGN KEY(bid) REFERENCES BANDS(bid),
	FOREIGN KEY(oid) REFERENCES ORGANIZATION(oid));
	
CREATE TABLE TEAMS (
	tid int,
	ttitle varchar2(20),
	tplace varchar2(20),
	primary key(tid));

CREATE TABLE VOLUNTEERING(
	vid int,
	vplace varchar2(20),
	vdate date,
	vsalary number,
	oid int,
	tid int,
	--primary key(vid),
	FOREIGN KEY(oid) REFERENCES ORGANIZATION(oid),
	FOREIGN KEY(tid) REFERENCES TEAMS(tid));
	
	
insert into BANDS values(1,'artcell','dhaka','lincon','faisal','saef','shaju');
insert into BANDS values(2,'warfaze','dhaka','palash','kamal','naim','tipu');
insert into BANDS values(3,'nemesis','dhaka','zohad','sultan','ratul','dio');
insert into BANDS values(4,'nagar baul','chittagong','james','pablo','swapan','elahi');
insert into BANDS values(5,'stone','chittagong','ajoy','mithu','rafi','ovi');
insert into BANDS values(6,'arbovirus','dhaka','nafi','suharto','ranjan','nafeez');
insert into BANDS values(7,'metrical','chittagong','raihan','pratim','rehan','mohim');
insert into BANDS values(8,'bay of bengal','chittagong','bakhtiar','tanim','abid','pasha');


insert into ORGANIZATION values(1,'Austcse','dhaka','open',31);
insert into ORGANIZATION values(2,'Austeee','dhaka','private',22);
insert into ORGANIZATION values(3,'Austmpe','dhaka','private',7);
insert into ORGANIZATION values(4,'Austcultural','dhaka','open',2);
insert into ORGANIZATION values(5,'Du cultural','dhaka','open',65);
insert into ORGANIZATION values(6,'Cu cultural','chittagong','open',55);
insert into ORGANIZATION values(7,'chayanot','dhaka','open',22);
insert into ORGANIZATION values(8,'food festival','chittagong','open',15);
insert into ORGANIZATION values(9,'iiuccse','chittagong','private',8);
insert into ORGANIZATION values(10,'edu cultural','chittagong','private',12);
insert into ORGANIZATION values(11,'premier cultural','chittagong','private',18);
insert into ORGANIZATION values(12,'cuet rag fest','chittagong','open',41);
insert into ORGANIZATION values(13,'buet rag fest','dhaka','open',39);
insert into ORGANIZATION values(14,'Nsu sanskritik','dhaka','private',38);
insert into ORGANIZATION values(15,'moitree concert','dhaka','open',22);


insert into booked values(1,'19-SEP-2020','dhaka',10,1,1);
insert into booked values(2,'20-SEP-2020','dhaka',12,2,2);
insert into booked values(3,'21-SEP-2020','dhaka',13,3,3);
insert into booked values(4,'22-SEP-2020','dhaka',14,4,4);
insert into booked values(5,'23-SEP-2020','dhaka',15,5,5);
insert into booked values(6,'24-SEP-2020','chittagong',200,6,6);
insert into booked values(7,'25-SEP-2020','dhaka',50,7,7);
insert into booked values(8,'26-SEP-2020','chittagong',218,8,8);
insert into booked values(9,'27-SEP-2020','chittagong',245,4,9);
insert into booked values(10,'28-SEP-2020','chittagong',208,5,10);
insert into booked values(11,'28-SEP-2020','chittagong',208,4,11);
insert into booked values(12,'29-SEP-2020','chittagong',208,5,12);
insert into booked values(13,'29-SEP-2020','dhaka',15,6,13);
insert into booked values(14,'30-SEP-2020','dhaka',10,2,14);
insert into booked values(15,'30-SEP-2020','dhaka',10,4,15);



insert into TEAMS values(1,'A','chittagong');
insert into TEAMS values(2,'B','dhaka');
insert into TEAMS values(3,'C','chittagong');
insert into TEAMS values(4,'D','dhaka');
insert into TEAMS values(5,'E','chittagong');
insert into TEAMS values(6,'F','dhaka');
insert into TEAMS values(7,'G','chittagong');
insert into TEAMS values(8,'H','dhaka');
insert into TEAMS values(9,'I','chittagong');
insert into TEAMS values(10,'J','dhaka');

COMMIT;

	