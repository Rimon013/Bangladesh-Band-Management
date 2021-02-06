--insert into bands1
INSERT INTO BANDS1(bid,btitle,origin,vocalist,lead_guitar,bass_guitar,drummer)
SELECT bid,btitle,origin,vocalist,lead_guitar,bass_guitar,drummer FROM BANDS
where (origin = 'dhaka');

select* from BANDS1;
--insert into organization1
INSERT INTO ORGANIZATION1(oid,oname,place,types,organizing)
SELECT oid,oname,place,types,organizing FROM ORGANIZATION
WHERE (place = 'dhaka');
select * from ORGANIZATION1;
--insert into booked1
create or replace view myview as
SELECT b.bkid,b.perf_date,b.perf_place,b.distance_from_dhaka,b.bid,oid FROM BOOKED b inner join ORGANIZATION c using(oid)
where c.place = 'dhaka';
create or replace view myview1 as
SELECT d.bkid,d.perf_date,d.perf_place,d.distance_from_dhaka,bid,d.oid FROM BOOKED d inner join BANDS e using(bid)
where e.origin = 'dhaka';

create or replace view myview2 as
SELECT bkid,f.perf_date,f.perf_place,f.distance_from_dhaka,f.bid,f.oid FROM myview f inner join myview1 k using(bkid)
;
INSERT INTO BOOKED1(bkid,perf_date,perf_place,distance_from_dhaka,bid,oid)
SELECT * FROM myview2;

Select * from BOOKED1;
--insert into teams1;
INSERT INTO TEAMS1(tid,ttitle,tplace)
SELECT tid,ttitle,tplace FROM TEAMS
where (tplace = 'dhaka');
select * from TEAMS1;

insert into VOLUNTEERING1 values(1,'dhaka','19-SEP-2020',8000,1,2);
commit;