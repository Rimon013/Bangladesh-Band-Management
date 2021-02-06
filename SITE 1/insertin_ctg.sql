--insert into bands2
INSERT INTO BANDS2(bid,btitle,origin,vocalist,lead_guitar,bass_guitar,drummer)
SELECT bid,btitle,origin,vocalist,lead_guitar,bass_guitar,drummer FROM BANDS
where (origin = 'chittagong');

select* from BANDS2;
--insert into organization2
INSERT INTO ORGANIZATION2(oid,oname,place,types,organizing)
SELECT oid,oname,place,types,organizing FROM ORGANIZATION
WHERE (place = 'chittagong');
select * from ORGANIZATION2;
--insert into booked2
create or replace view myview as
SELECT b.bkid,b.perf_date,b.perf_place,b.distance_from_dhaka,b.bid,oid FROM BOOKED b inner join ORGANIZATION c using(oid)
where c.place = 'chittagong';
create or replace view myview1 as
SELECT d.bkid,d.perf_date,d.perf_place,d.distance_from_dhaka,bid,d.oid FROM BOOKED d inner join BANDS e using(bid)
where e.origin = 'chittagong';

create or replace view myview2 as
SELECT bkid,f.perf_date,f.perf_place,f.distance_from_dhaka,f.bid,f.oid FROM myview f inner join myview1 k using(bkid)
;
INSERT INTO BOOKED2(bkid,perf_date,perf_place,distance_from_dhaka,bid,oid)
SELECT * FROM myview2;

Select * from BOOKED2;
--insert into teams2;
INSERT INTO TEAMS2(tid,ttitle,tplace)
SELECT tid,ttitle,tplace FROM TEAMS
where (tplace = 'chittagong');
select * from TEAMS2;

insert into VOLUNTEERING2 values(1,'chittagong','24-SEP-2020',10000,6,1);
commit;