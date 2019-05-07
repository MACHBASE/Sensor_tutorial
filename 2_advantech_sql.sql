CREATE COLLECTORMANAGER localhost AT "127.0.0.1:9999";
SELECT * FROM m$sys_collectormanagers;

CREATE COLLECTOR localhost.advan_test FROM "C:\Machbase\machcollector_home\collector\advantech.tpl";
select * from M$SYS_COLLECTORS;
ALTER COLLECTOR localhost.advan_test START;

select time, temperature, humidity, RSSI, SNR from advantech_table limit 20;

create tagdata table tag (name varchar(20) primary key, time datetime basetime, value double summarized) tag_partition_count =1;
insert into tag metadata values ('TEMPERATURE');
insert into tag metadata values ('HUMIDITY');
insert into tag metadata values ('RSSI');
insert into tag metadata values ('SNR');


exec stream_create(event1, 'insert into tag select ''TEMPERATURE'', TIME, TEMPERATURE from advantech_table;');
exec stream_create(event2, 'insert into tag select ''HUMIDITY'', TIME, HUMIDITY from advantech_table;');
exec stream_create(event3, 'insert into tag select ''RSSI'', TIME, RSSI from advantech_table;');
exec stream_create(event4, 'insert into tag select ''SNR'', TIME, SNR from advantech_table;');

exec stream_start(event1);
exec stream_start(event2);
exec stream_start(event3);
exec stream_start(event4);

select * from tag where name = 'TEMPERATURE';
select * from tag where name = 'HUMIDITY';
select * from tag where name = 'RSSI';
select * from tag where name = 'SNR';
