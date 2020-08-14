Last login: Mon Aug 10 11:40:57 on ttys014
Dibyajyotis-MacBook-Air:dse-6.8.1 dibyajyoti$ pwd
/Users/dibyajyoti/Downloads/dse-6.8.1
Dibyajyotis-MacBook-Air:dse-6.8.1 dibyajyoti$ ./cqlsh
-bash: ./cqlsh: No such file or directory
Dibyajyotis-MacBook-Air:dse-6.8.1 dibyajyoti$ bin/cqlsh 
Connected to Test Cluster at 127.0.0.1:9042.
[cqlsh 6.8.0 | DSE 6.8.1 | CQL spec 3.4.5 | DSE protocol v2]
Use HELP for help.
cqlsh> 
cqlsh> 
cqlsh> describe keyspaces;

system_virtual_schema  system_auth     keyspace1           dse_insights_local
dse_system_local       system_views    dse_insights        killrvideo        
dse_security           system          system_distributed  dse_system        
solr_admin             dse_leases      system_traces     
system_schema          system_backups  dse_perf          

cqlsh> use killrvideo ;
cqlsh:killrvideo> describe tables;

videos_by_tag  videos

cqlsh:killrvideo> desc videos;

CREATE TABLE killrvideo.videos (
    video_id timeuuid PRIMARY KEY,
    added_date timestamp,
    title text
) WITH additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';

cqlsh:killrvideo> alter table videos alter title type uuid;
InvalidRequest: Error from server: code=2200 [Invalid query] message="Altering column types is no longer supported"
cqlsh:killrvideo> alter table videos rename video_id to video_identifier;
cqlsh:killrvideo> desc videos;

CREATE TABLE killrvideo.videos (
    video_identifier timeuuid PRIMARY KEY,
    added_date timestamp,
    title text
) WITH additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';

cqlsh:killrvideo> alter table videos rename video_identifier to video_id;
cqlsh:killrvideo> desc videos;

CREATE TABLE killrvideo.videos (
    video_id timeuuid PRIMARY KEY,
    added_date timestamp,
    title text
) WITH additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';

cqlsh:killrvideo> alter table videos alter title type uuid;
InvalidRequest: Error from server: code=2200 [Invalid query] message="Altering column types is no longer supported"
cqlsh:killrvideo> CREATE KEYSPACE eWS WITH replication ={'class':'SimpleStrategy','replication_factor':2};

cqlsh:killrvideo> 
cqlsh:killrvideo> 
cqlsh:killrvideo> 
cqlsh:killrvideo> CREATE TABLE Cloud_Log (
              ... instanceID UUID PRIMARY KEY,
              ... timestamp TIMESTAMP,
              ... ipAddress INET,
              ... cpuUtilization DOUBLE ,
              ... diskReadBytes TEXT,
              ... diskWriteBytes TEXT);
cqlsh:killrvideo> 
cqlsh:killrvideo> DESC cloud_log;

CREATE TABLE killrvideo.cloud_log (
    instanceid uuid PRIMARY KEY,
    cpuutilization double,
    diskreadbytes text,
    diskwritebytes text,
    ipaddress inet,
    timestamp timestamp
) WITH additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';


cqlsh:killrvideo> 
cqlsh:killrvideo> CREATE TABLE demo (
              ... instanceID UUID PRIMARY KEY,
              ... date1 TIMESTAMP,
              ... date2 TIMESTAMP);

cqlsh:killrvideo> 
cqlsh:killrvideo> 

cqlsh:killrvideo> INSERT INTO demo(instanceID,date1) values(8a6d3101-a20a-443d-87d9-a4949986e58e,toTimestamp(now()));
cqlsh:killrvideo> select * from demo;

 instanceid                           | date1                           | date2
--------------------------------------+---------------------------------+-------
 8a6d3101-a20a-443d-87d9-a4949986e58e | 2020-08-10 18:31:56.398000+0000 |  null

(1 rows)
cqlsh:killrvideo> INSERT INTO demo(instanceID,date1) values(8a6d3101-a20a-443d-87d9-a4949986e28e,now());
InvalidRequest: Error from server: code=2200 [Invalid query] message="Type error: cannot assign result of function system.now (type timeuuid) to date1 (type timestamp)"
cqlsh:killrvideo> INSERT INTO demo(instanceID,date1) values(8a6d3101-a20a-443d-87d9-a4949986e90e,toTimestamp(now()));
cqlsh:killrvideo> select * from demo;

 instanceid                           | date1                           | date2
--------------------------------------+---------------------------------+-------
 8a6d3101-a20a-443d-87d9-a4949986e58e | 2020-08-10 18:31:56.398000+0000 |  null
 8a6d3101-a20a-443d-87d9-a4949986e90e | 2020-08-10 18:32:40.718000+0000 |  null

(2 rows)
cqlsh:killrvideo> INSERT INTO demo(instanceID,date1) values(8a6d3101-a20a-443d-87d9-a4949986e90e,toTimestamp(toDate(now())));
cqlsh:killrvideo> select * from demo;

 instanceid                           | date1                           | date2
--------------------------------------+---------------------------------+-------
 8a6d3101-a20a-443d-87d9-a4949986e58e | 2020-08-10 18:31:56.398000+0000 |  null
 8a6d3101-a20a-443d-87d9-a4949986e90e | 2020-08-10 00:00:00.000000+0000 |  null

(2 rows)

cqlsh:killrvideo> INSERT INTO demo(instanceID,date1) values(8a6d3101-a20a-443d-87d9-a4949986e92e,toTimestamp(now()));
cqlsh:killrvideo> select * from demo;

 instanceid                           | date1                           | date2
--------------------------------------+---------------------------------+-------
 8a6d3101-a20a-443d-87d9-a4949986e58e | 2020-08-10 18:31:56.398000+0000 |  null
 8a6d3101-a20a-443d-87d9-a4949986e92e | 2020-08-10 18:33:29.599000+0000 |  null
 8a6d3101-a20a-443d-87d9-a4949986e90e | 2020-08-10 00:00:00.000000+0000 |  null

(3 rows)

cqlsh:killrvideo> INSERT INTO demo(instanceID,date1) values(8a6d3101-a20a-443d-87d9-a4949986e12e,toTimestamp(toDate(now())));
cqlsh:killrvideo> select * from demo;

 instanceid                           | date1                           | date2
--------------------------------------+---------------------------------+-------
 8a6d3101-a20a-443d-87d9-a4949986e58e | 2020-08-10 18:31:56.398000+0000 |  null
 8a6d3101-a20a-443d-87d9-a4949986e12e | 2020-08-10 00:00:00.000000+0000 |  null
 8a6d3101-a20a-443d-87d9-a4949986e92e | 2020-08-10 18:33:29.599000+0000 |  null
 8a6d3101-a20a-443d-87d9-a4949986e90e | 2020-08-10 00:00:00.000000+0000 |  null

(4 rows)

cqlsh:killrvideo> INSERT INTO demo(instanceID,date1,date2) values(8a6d3101-a20a-443d-87d9-a4949986e56e,toTimestamp(toDate(now())), '2020-01-01 19:00:00');
cqlsh:killrvideo> select * from demo;

 instanceid                           | date1                           | date2
--------------------------------------+---------------------------------+---------------------------------
 8a6d3101-a20a-443d-87d9-a4949986e58e | 2020-08-10 18:31:56.398000+0000 |                            null
 8a6d3101-a20a-443d-87d9-a4949986e12e | 2020-08-10 00:00:00.000000+0000 |                            null
 8a6d3101-a20a-443d-87d9-a4949986e92e | 2020-08-10 18:33:29.599000+0000 |                            null
 8a6d3101-a20a-443d-87d9-a4949986e90e | 2020-08-10 00:00:00.000000+0000 |                            null
 8a6d3101-a20a-443d-87d9-a4949986e56e | 2020-08-10 00:00:00.000000+0000 | 2020-01-01 13:30:00.000000+0000

(5 rows)
cqlsh:killrvideo> delete date2 from demo where instanceid=8a6d3101-a20a-443d-87d9-a4949986e56e;
cqlsh:killrvideo> select * from demo;

 instanceid                           | date1                           | date2
--------------------------------------+---------------------------------+-------
 8a6d3101-a20a-443d-87d9-a4949986e58e | 2020-08-10 18:31:56.398000+0000 |  null
 8a6d3101-a20a-443d-87d9-a4949986e12e | 2020-08-10 00:00:00.000000+0000 |  null
 8a6d3101-a20a-443d-87d9-a4949986e92e | 2020-08-10 18:33:29.599000+0000 |  null
 8a6d3101-a20a-443d-87d9-a4949986e90e | 2020-08-10 00:00:00.000000+0000 |  null
 8a6d3101-a20a-443d-87d9-a4949986e56e | 2020-08-10 00:00:00.000000+0000 |  null

(5 rows)
cqlsh:killrvideo> INSERT INTO demo(instanceID,date1,date2) values(8a6d3101-a20a-443d-87d9-a4949986e56e,toTimestamp(toDate(now())), '2020-01-01 19:00:00');
cqlsh:killrvideo> select * from demo;

 instanceid                           | date1                           | date2
--------------------------------------+---------------------------------+---------------------------------
 8a6d3101-a20a-443d-87d9-a4949986e58e | 2020-08-10 18:31:56.398000+0000 |                            null
 8a6d3101-a20a-443d-87d9-a4949986e12e | 2020-08-10 00:00:00.000000+0000 |                            null
 8a6d3101-a20a-443d-87d9-a4949986e92e | 2020-08-10 18:33:29.599000+0000 |                            null
 8a6d3101-a20a-443d-87d9-a4949986e90e | 2020-08-10 00:00:00.000000+0000 |                            null
 8a6d3101-a20a-443d-87d9-a4949986e56e | 2020-08-10 00:00:00.000000+0000 | 2020-01-01 13:30:00.000000+0000

(5 rows)
cqlsh:killrvideo> INSERT INTO demo(instanceID,date1,date2) values(8a6d3101-a20a-443d-87d9-a4949986e88e,toTimestamp(now()), '2020-01-01 19:00:00');
cqlsh:killrvideo> select * from demo;

 instanceid                           | date1                           | date2
--------------------------------------+---------------------------------+---------------------------------
 8a6d3101-a20a-443d-87d9-a4949986e58e | 2020-08-10 18:31:56.398000+0000 |                            null
 8a6d3101-a20a-443d-87d9-a4949986e12e | 2020-08-10 00:00:00.000000+0000 |                            null
 8a6d3101-a20a-443d-87d9-a4949986e88e | 2020-08-10 18:41:46.015000+0000 | 2020-01-01 13:30:00.000000+0000
 8a6d3101-a20a-443d-87d9-a4949986e92e | 2020-08-10 18:33:29.599000+0000 |                            null
 8a6d3101-a20a-443d-87d9-a4949986e90e | 2020-08-10 00:00:00.000000+0000 |                            null
 8a6d3101-a20a-443d-87d9-a4949986e56e | 2020-08-10 00:00:00.000000+0000 | 2020-01-01 13:30:00.000000+0000

(6 rows)
cqlsh:killrvideo> BEGIN BATCH
              ... 
              ... INSERT INTO demo(instanceID,date1,date2) values(8a6d3101-a20a-333d-87d9-a4949986e88e,toTimestamp(now()), '2020-08-01 19:00:00');
              ... INSERT INTO demo(instanceID,date1,date2) values(8a6d3101-a20a-113d-87d9-a4949986e88e,toTimestamp(now()), '2020-08-02 19:00:00');
              ... INSERT INTO demo(instanceID,date1,date2) values(8a6d3101-a20a-223d-87d9-a4949986e88e,toTimestamp(now()), '2020-08-03 19:00:00');
              ... 
              ... UPDATE demo set date2='2020-08-22 13:00:00' where instanceID=8a6d3101-a20a-113d-87d9-a4949986e88e;
              ... APPLY BATCH;
cqlsh:killrvideo> select * from demo;

 instanceid                           | date1                           | date2
--------------------------------------+---------------------------------+---------------------------------
 8a6d3101-a20a-443d-87d9-a4949986e58e | 2020-08-10 18:31:56.398000+0000 |                            null
 8a6d3101-a20a-333d-87d9-a4949986e88e | 2020-08-10 18:44:40.520000+0000 | 2020-08-01 13:30:00.000000+0000
 8a6d3101-a20a-443d-87d9-a4949986e12e | 2020-08-10 00:00:00.000000+0000 |                            null
 8a6d3101-a20a-443d-87d9-a4949986e88e | 2020-08-10 18:41:46.015000+0000 | 2020-01-01 13:30:00.000000+0000
 8a6d3101-a20a-443d-87d9-a4949986e92e | 2020-08-10 18:33:29.599000+0000 |                            null
 8a6d3101-a20a-223d-87d9-a4949986e88e | 2020-08-10 18:44:40.520000+0000 | 2020-08-03 13:30:00.000000+0000
 8a6d3101-a20a-113d-87d9-a4949986e88e | 2020-08-10 18:44:40.520000+0000 | 2020-08-22 07:30:00.000000+0000
 8a6d3101-a20a-443d-87d9-a4949986e90e | 2020-08-10 00:00:00.000000+0000 |                            null
 8a6d3101-a20a-443d-87d9-a4949986e56e | 2020-08-10 00:00:00.000000+0000 | 2020-01-01 13:30:00.000000+0000

(9 rows)
cqlsh:killrvideo> CREATE TABLE demo_ttl (
              ... instanceID UUID PRIMARY KEY,
              ... cust_id int,
              ... OTP int);
cqlsh:killrvideo> 
cqlsh:killrvideo> 
cqlsh:killrvideo> drop table demo_ttl ;

cqlsh:killrvideo> CREATE TABLE demo_ttl (
              ... instanceID UUID PRIMARY KEY,
              ... cust_id int,
              ... OTP int);
cqlsh:killrvideo> 
cqlsh:killrvideo> 

cqlsh:killrvideo> INSERT INTO demo_ttl (instanceID,cust_id,OTP) values (uuid(),123,345) using ttl 100;
cqlsh:killrvideo> select ttl(OTP) from demo_ttl ;

 ttl(otp)
----------
       88

(1 rows)
cqlsh:killrvideo> select * from demo_ttl 
              ... ;

 instanceid                           | cust_id | otp
--------------------------------------+---------+-----
 fdad92ed-a019-4ff7-a62a-eb0148978242 |     123 | 345

(1 rows)
cqlsh:killrvideo> update demo_ttl using ttl 400 set cust_id=888 where instanceid=fdad92ed-a019-4ff7-a62a-eb0148978242;
cqlsh:killrvideo> select * from demo_ttl  ;

 instanceid                           | cust_id | otp
--------------------------------------+---------+-----
 fdad92ed-a019-4ff7-a62a-eb0148978242 |     888 | 345

(1 rows)
cqlsh:killrvideo> select ttl(OTP) from demo_ttl ;

 ttl(otp)
----------
       26

(1 rows)

cqlsh:killrvideo> update demo_ttl using ttl 400 set cust_id=888 ,otp=900 where instanceid=fdad92ed-a019-4ff7-a62a-eb0148978242;
cqlsh:killrvideo> select ttl(OTP) from demo_ttl ;

 ttl(otp)
----------
      399

(1 rows)
cqlsh:killrvideo> select * from demo_ttl  ;

 instanceid                           | cust_id | otp
--------------------------------------+---------+-----
 fdad92ed-a019-4ff7-a62a-eb0148978242 |     888 | 900

(1 rows)
cqlsh:killrvideo> update demo_ttl using ttl 80 set cust_id=744132 ,otp=134 where instanceid=uuid();
cqlsh:killrvideo> select * from demo_ttl  ;

 instanceid                           | cust_id | otp
--------------------------------------+---------+-----
 fdad92ed-a019-4ff7-a62a-eb0148978242 |     888 | 900
 f88e4103-5b73-4eff-83ca-df0a6db52af0 |  744132 | 134

(2 rows)
cqlsh:killrvideo> select ttl(OTP) from demo_ttl ;

 ttl(otp)
----------
      355
       73

(2 rows)
cqlsh:killrvideo> select ttl(OTP),otp from demo_ttl ;

 ttl(otp) | otp
----------+-----
      349 | 900
       67 | 134

(2 rows)
cqlsh:killrvideo> select ttl(OTP),otp from demo_ttl ;

 ttl(otp) | otp
----------+-----
      346 | 900
       64 | 134

(2 rows)

cqlsh:killrvideo> CREATE TABLE item_payment_options
              ... ( item_id text PRIMARY KEY,
              ...   payment SET<text>
              ... );
cqlsh:killrvideo> 

cqlsh:killrvideo> INSERT INTO item_payment_options (item_id,payment) VALUES ('100',{'VISA','PAYPAL','PAYSWIPE'});
cqlsh:killrvideo> 
cqlsh:killrvideo> select * from item_payment_options ;

 item_id | payment
---------+--------------------------------
     100 | {'PAYPAL', 'PAYSWIPE', 'VISA'}

(1 rows)
cqlsh:killrvideo> INSERT INTO item_payment_options (item_id,payment) VALUES ('101',{'MasterCard','VISA','visa'});
cqlsh:killrvideo> 
cqlsh:killrvideo> select * from item_payment_options ;

 item_id | payment
---------+--------------------------------
     100 | {'PAYPAL', 'PAYSWIPE', 'VISA'}
     101 | {'MasterCard', 'VISA', 'visa'}

(2 rows)
cqlsh:killrvideo> INSERT INTO item_payment_options (item_id,payment) VALUES ('102',{'Zebronics','VISA','VISA'});
cqlsh:killrvideo> 
cqlsh:killrvideo> select * from item_payment_options ;

 item_id | payment
---------+--------------------------------
     102 |          {'VISA', 'Zebronics'}
     100 | {'PAYPAL', 'PAYSWIPE', 'VISA'}
     101 | {'MasterCard', 'VISA', 'visa'}

(3 rows)

cqlsh:killrvideo> update item_payment_options set payment=payment+{'ICICI'} where item_id='102';
cqlsh:killrvideo> select * from item_payment_options ;

 item_id | payment
---------+--------------------------------
     102 | {'ICICI', 'VISA', 'Zebronics'}
     100 | {'PAYPAL', 'PAYSWIPE', 'VISA'}
     101 | {'MasterCard', 'VISA', 'visa'}

(3 rows)
cqlsh:killrvideo> 
cqlsh:killrvideo> CREATE TABLE customer_search
              ... (cust_id int PRIMARY KEY,
              ... items_searched list<text>
              ... );
cqlsh:killrvideo> 

cqlsh:killrvideo> INSERT INTO customer_search (cust_id,items_searched) VALUES (100,['VISA','PAYPAL','PAYSWIPE']);
cqlsh:killrvideo> 
cqlsh:killrvideo> select * from customer_search;

 cust_id | items_searched
---------+--------------------------------
     100 | ['VISA', 'PAYPAL', 'PAYSWIPE']

(1 rows)
cqlsh:killrvideo> update customer_search set items_searched[0]='SBI' where cust_id=100;
cqlsh:killrvideo> select * from customer_search;

 cust_id | items_searched
---------+-------------------------------
     100 | ['SBI', 'PAYPAL', 'PAYSWIPE']

(1 rows)
cqlsh:killrvideo> update customer_search set items_searched+=['BOI','UCB','IDBI'] where cust_id=100;
cqlsh:killrvideo> select * from customer_search;

 cust_id | items_searched
---------+-----------------------------------------------------
     100 | ['SBI', 'PAYPAL', 'PAYSWIPE', 'BOI', 'UCB', 'IDBI']

(1 rows)

cqlsh:killrvideo> INSERT INTO customer_search (cust_id,items_searched) VALUES (101,['HDFC']);
cqlsh:killrvideo> 
cqlsh:killrvideo> select * from customer_search;

 cust_id | items_searched
---------+-----------------------------------------------------
     100 | ['SBI', 'PAYPAL', 'PAYSWIPE', 'BOI', 'UCB', 'IDBI']
     101 |                                            ['HDFC']

(2 rows)
cqlsh:killrvideo> delete items_searched[0] from customer_search where cust_id=101;
cqlsh:killrvideo> select * from customer_search;

 cust_id | items_searched
---------+-----------------------------------------------------
     100 | ['SBI', 'PAYPAL', 'PAYSWIPE', 'BOI', 'UCB', 'IDBI']
     101 |                                                null

(2 rows)
cqlsh:killrvideo> CREATE TABLE customer_payment
              ... (cust_id int PRIMARY KEY,
              ... payment map<text, text>
              ... );
cqlsh:killrvideo> 
cqlsh:killrvideo>  
cqlsh:killrvideo> INSERT INTO customer_payment (cust_id, payment) VALUES ( 101, {'SDF23':'Net Banking', 'NJM56':'Credit Card'} );
cqlsh:killrvideo> 
cqlsh:killrvideo> select * from customer_payment ;

 cust_id | payment
---------+--------------------------------------------------
     101 | {'NJM56': 'Credit Card', 'SDF23': 'Net Banking'}

(1 rows)

cqlsh:killrvideo> update customer_payment set payment=payment+ {'ABEQ':'COD','TWEW':'PAYTM'} where cust_id=101;
cqlsh:killrvideo> select * from customer_payment ;

 cust_id | payment
---------+----------------------------------------------------------------------------------
     101 | {'ABEQ': 'COD', 'NJM56': 'Credit Card', 'SDF23': 'Net Banking', 'TWEW': 'PAYTM'}

(1 rows)
cqlsh:killrvideo> desc customer_payment;

CREATE TABLE killrvideo.customer_payment (
    cust_id int PRIMARY KEY,
    payment map<text, text>
) WITH additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';


cqlsh:killrvideo> CREATE TYPE address
              ... ( door text,
              ...   street text,
              ...   area text,
              ...   city text,
              ...   pin int,
              ...   state text
              ... );

cqlsh:killrvideo> alter table killrvideo.customer_payment add del_add address;
cqlsh:killrvideo> desc customer_payment;

CREATE TABLE killrvideo.customer_payment (
    cust_id int PRIMARY KEY,
    del_add address,
    payment map<text, text>
) WITH additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';


cqlsh:killrvideo> INSERT INTO customer_payment (cust_id, payment,del_add) VALUES ( 102, {'UADadn':'Net Banking', 'IBYY':'Credit Card'} ,
              ... {door:'P/55',street:'Race-course',area:'Vasantkunj',city:'Delhi',pin:100010,state:'NCR'}
              ... );
cqlsh:killrvideo> 
cqlsh:killrvideo> 
cqlsh:killrvideo> select * from customer_payment;

 cust_id | del_add                                                                                             | payment
---------+-----------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------
     102 | {door: 'P/55', street: 'Race-course', area: 'Vasantkunj', city: 'Delhi', pin: 100010, state: 'NCR'} |                                 {'IBYY': 'Credit Card', 'UADadn': 'Net Banking'}
     101 |                                                                                                null | {'ABEQ': 'COD', 'NJM56': 'Credit Card', 'SDF23': 'Net Banking', 'TWEW': 'PAYTM'}

(2 rows)
cqlsh:killrvideo> select cust_id,payment,del_add from customer_payment;

 cust_id | payment                                                                          | del_add
---------+----------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------
     102 |                                 {'IBYY': 'Credit Card', 'UADadn': 'Net Banking'} | {door: 'P/55', street: 'Race-course', area: 'Vasantkunj', city: 'Delhi', pin: 100010, state: 'NCR'}
     101 | {'ABEQ': 'COD', 'NJM56': 'Credit Card', 'SDF23': 'Net Banking', 'TWEW': 'PAYTM'} |                                                                                                null

(2 rows)
cqlsh:killrvideo> describe demo_ttl;

CREATE TABLE killrvideo.demo_ttl (
    instanceid uuid PRIMARY KEY,
    cust_id int,
    otp int
) WITH additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';

cqlsh:killrvideo> select * from demo_ttl 
              ... ;

 instanceid | cust_id | otp
------------+---------+-----

(0 rows)
cqlsh:killrvideo> select * from demo;

 instanceid                           | date1                           | date2
--------------------------------------+---------------------------------+---------------------------------
 8a6d3101-a20a-443d-87d9-a4949986e58e | 2020-08-10 18:31:56.398000+0000 |                            null
 8a6d3101-a20a-333d-87d9-a4949986e88e | 2020-08-10 18:44:40.520000+0000 | 2020-08-01 13:30:00.000000+0000
 8a6d3101-a20a-443d-87d9-a4949986e12e | 2020-08-10 00:00:00.000000+0000 |                            null
 8a6d3101-a20a-443d-87d9-a4949986e88e | 2020-08-10 18:41:46.015000+0000 | 2020-01-01 13:30:00.000000+0000
 8a6d3101-a20a-443d-87d9-a4949986e92e | 2020-08-10 18:33:29.599000+0000 |                            null
 8a6d3101-a20a-223d-87d9-a4949986e88e | 2020-08-10 18:44:40.520000+0000 | 2020-08-03 13:30:00.000000+0000
 8a6d3101-a20a-113d-87d9-a4949986e88e | 2020-08-10 18:44:40.520000+0000 | 2020-08-22 07:30:00.000000+0000
 8a6d3101-a20a-443d-87d9-a4949986e90e | 2020-08-10 00:00:00.000000+0000 |                            null
 8a6d3101-a20a-443d-87d9-a4949986e56e | 2020-08-10 00:00:00.000000+0000 | 2020-01-01 13:30:00.000000+0000

(9 rows)
cqlsh:killrvideo> desc demo;

CREATE TABLE killrvideo.demo (
    instanceid uuid PRIMARY KEY,
    date1 timestamp,
    date2 timestamp
) WITH additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';

cqlsh:killrvideo> alter table demo add testing int;
cqlsh:killrvideo> desc demo;

CREATE TABLE killrvideo.demo (
    instanceid uuid PRIMARY KEY,
    date1 timestamp,
    date2 timestamp,
    testing int
) WITH additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';

cqlsh:killrvideo> update demo set testing =999 where instanceid=8a6d3101-a20a-443d-87d9-a4949986e58e;
cqlsh:killrvideo> update demo set testing =9999 where instanceid=8a6d3101-a20a-443d-87d9-a4949986e56e;
cqlsh:killrvideo> desc demo;

CREATE TABLE killrvideo.demo (
    instanceid uuid PRIMARY KEY,
    date1 timestamp,
    date2 timestamp,
    testing int
) WITH additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';

cqlsh:killrvideo> select * from demo;

 instanceid                           | date1                           | date2                           | testing
--------------------------------------+---------------------------------+---------------------------------+---------
 8a6d3101-a20a-443d-87d9-a4949986e58e | 2020-08-10 18:31:56.398000+0000 |                            null |     999
 8a6d3101-a20a-333d-87d9-a4949986e88e | 2020-08-10 18:44:40.520000+0000 | 2020-08-01 13:30:00.000000+0000 |    null
 8a6d3101-a20a-443d-87d9-a4949986e12e | 2020-08-10 00:00:00.000000+0000 |                            null |    null
 8a6d3101-a20a-443d-87d9-a4949986e88e | 2020-08-10 18:41:46.015000+0000 | 2020-01-01 13:30:00.000000+0000 |    null
 8a6d3101-a20a-443d-87d9-a4949986e92e | 2020-08-10 18:33:29.599000+0000 |                            null |    null
 8a6d3101-a20a-223d-87d9-a4949986e88e | 2020-08-10 18:44:40.520000+0000 | 2020-08-03 13:30:00.000000+0000 |    null
 8a6d3101-a20a-113d-87d9-a4949986e88e | 2020-08-10 18:44:40.520000+0000 | 2020-08-22 07:30:00.000000+0000 |    null
 8a6d3101-a20a-443d-87d9-a4949986e90e | 2020-08-10 00:00:00.000000+0000 |                            null |    null
 8a6d3101-a20a-443d-87d9-a4949986e56e | 2020-08-10 00:00:00.000000+0000 | 2020-01-01 13:30:00.000000+0000 |    9999

(9 rows)

cqlsh:killrvideo> select * from demo where testing=999 allow filtering;

 instanceid                           | date1                           | date2 | testing
--------------------------------------+---------------------------------+-------+---------
 8a6d3101-a20a-443d-87d9-a4949986e58e | 2020-08-10 18:31:56.398000+0000 |  null |     999

(1 rows)

cqlsh:killrvideo> create index new_ind on killrvideo.demo(testing);
cqlsh:killrvideo> select * from demo where testing=999;

 instanceid                           | date1                           | date2 | testing
--------------------------------------+---------------------------------+-------+---------
 8a6d3101-a20a-443d-87d9-a4949986e58e | 2020-08-10 18:31:56.398000+0000 |  null |     999

(1 rows)
cqlsh:killrvideo> desc demo;

CREATE TABLE killrvideo.demo (
    instanceid uuid PRIMARY KEY,
    date1 timestamp,
    date2 timestamp,
    testing int
) WITH additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';
CREATE INDEX new_ind ON killrvideo.demo (testing);


cqlsh:killrvideo> drop index if exists new_ind;
cqlsh:killrvideo> desc indexes;;

'indexes' not found in keyspace 'killrvideo'
SyntaxException: <Error from server: code=2000 [Syntax error in CQL query] message="line 1:0 no viable alternative at input ';' ([;])">
cqlsh:killrvideo> desc demo;

CREATE TABLE killrvideo.demo (
    instanceid uuid PRIMARY KEY,
    date1 timestamp,
    date2 timestamp,
    testing int
) WITH additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';


cqlsh:killrvideo> select * from demo ;

 instanceid                           | date1                           | date2                           | testing
--------------------------------------+---------------------------------+---------------------------------+---------
 8a6d3101-a20a-443d-87d9-a4949986e58e | 2020-08-10 18:31:56.398000+0000 |                            null |     999
 8a6d3101-a20a-333d-87d9-a4949986e88e | 2020-08-10 18:44:40.520000+0000 | 2020-08-01 13:30:00.000000+0000 |    null
 8a6d3101-a20a-443d-87d9-a4949986e12e | 2020-08-10 00:00:00.000000+0000 |                            null |    null
 8a6d3101-a20a-443d-87d9-a4949986e88e | 2020-08-10 18:41:46.015000+0000 | 2020-01-01 13:30:00.000000+0000 |    null
 8a6d3101-a20a-443d-87d9-a4949986e92e | 2020-08-10 18:33:29.599000+0000 |                            null |    null
 8a6d3101-a20a-223d-87d9-a4949986e88e | 2020-08-10 18:44:40.520000+0000 | 2020-08-03 13:30:00.000000+0000 |    null
 8a6d3101-a20a-113d-87d9-a4949986e88e | 2020-08-10 18:44:40.520000+0000 | 2020-08-22 07:30:00.000000+0000 |    null
 8a6d3101-a20a-443d-87d9-a4949986e90e | 2020-08-10 00:00:00.000000+0000 |                            null |    null
 8a6d3101-a20a-443d-87d9-a4949986e56e | 2020-08-10 00:00:00.000000+0000 | 2020-01-01 13:30:00.000000+0000 |    9999

(9 rows)
cqlsh:killrvideo> select writetime(date1) from demo;

 writetime(date1)
------------------
 1597084316382088
 1597085080475753
 1597084453079928
 1597084906011908
 1597084409598177
 1597085080475753
 1597085080475753
 1597084374356474
 1597084877664478

(9 rows)
cqlsh:killrvideo> select uuid() from demo;

 system.uuid()
--------------------------------------
 1e39ef46-b0bd-4f9e-b558-4dd228602f39
 76a72717-21a6-40a2-bac6-c22cc2d46868
 499ef573-3e03-4d24-8ad6-f413111bafee
 ee4a8664-cf78-4072-90c2-f28391d77671
 634ee04b-99e9-4499-8bf7-e272e7683ad9
 15bdd86f-b7bf-4c21-a24f-0a339f1635f1
 7655c6b8-6bff-4197-9bb8-3e799f92ea35
 9db0eca0-f789-43ee-9f57-b83abcf8a9fa
 1640d843-806f-43d6-8e9d-e748cc3b1d88

(9 rows)
cqlsh:killrvideo> select toTimestamp(now()) from demo;

 system.totimestamp(system.now())
----------------------------------
  2020-08-10 20:13:57.527000+0000
  2020-08-10 20:13:57.527000+0000
  2020-08-10 20:13:57.527000+0000
  2020-08-10 20:13:57.527000+0000
  2020-08-10 20:13:57.527000+0000
  2020-08-10 20:13:57.527000+0000
  2020-08-10 20:13:57.527000+0000
  2020-08-10 20:13:57.527000+0000
  2020-08-10 20:13:57.527000+0000

(9 rows)

cqlsh:killrvideo> select cast(now() as timestamp) from demo;

 cast(system.now() as timestamp)
---------------------------------
 2020-08-10 20:14:30.831000+0000
 2020-08-10 20:14:30.831000+0000
 2020-08-10 20:14:30.831000+0000
 2020-08-10 20:14:30.831000+0000
 2020-08-10 20:14:30.831000+0000
 2020-08-10 20:14:30.831000+0000
 2020-08-10 20:14:30.831000+0000
 2020-08-10 20:14:30.831000+0000
 2020-08-10 20:14:30.831000+0000

(9 rows)
cqlsh:killrvideo> select token(testing) from demo;

 system.token(testing)
-----------------------
   7071430368280192841
                  null
                  null
                  null
                  null
                  null
                  null
                  null
  -6996037208776625863

(9 rows)
cqlsh:killrvideo> select token(date2) from demo;

 system.token(date2)
----------------------
                 null
  6841475932216675524
                 null
  1876118327253411250
                 null
 -5931565132876569988
   -83841963854774290
                 null
  1876118327253411250

(9 rows)
cqlsh:killrvideo> select cast(now() as date) from demo;

 cast(system.now() as date)
----------------------------
                 2020-08-10
                 2020-08-10
                 2020-08-10
                 2020-08-10
                 2020-08-10
                 2020-08-10
                 2020-08-10
                 2020-08-10
                 2020-08-10

(9 rows)
cqlsh:killrvideo> select cast(now() as date) from demo;

 cast(system.now() as date)
----------------------------
                 2020-08-10
                 2020-08-10
                 2020-08-10
                 2020-08-10
                 2020-08-10
                 2020-08-10
                 2020-08-10
                 2020-08-10
                 2020-08-10

(9 rows)
cqlsh:killrvideo> select cast(toTimestamp(now()) as date) from demo;

 cast(system.totimestamp(system.now()) as date)
------------------------------------------------
                                     2020-08-10
                                     2020-08-10
                                     2020-08-10
                                     2020-08-10
                                     2020-08-10
                                     2020-08-10
                                     2020-08-10
                                     2020-08-10
                                     2020-08-10

(9 rows)
cqlsh:killrvideo> select cast(toTimestamp(now()) as timestamp) from demo;

 system.totimestamp(system.now())
----------------------------------
  2020-08-10 20:16:15.799000+0000
  2020-08-10 20:16:15.799000+0000
  2020-08-10 20:16:15.799000+0000
  2020-08-10 20:16:15.799000+0000
  2020-08-10 20:16:15.799000+0000
  2020-08-10 20:16:15.799000+0000
  2020-08-10 20:16:15.799000+0000
  2020-08-10 20:16:15.799000+0000
  2020-08-10 20:16:15.799000+0000

(9 rows)
cqlsh:killrvideo> select cast(toTimestamp(toDate(now())) as timestamp) from demo;

 system.totimestamp(system.todate(system.now()))
-------------------------------------------------
                 2020-08-10 00:00:00.000000+0000
                 2020-08-10 00:00:00.000000+0000
                 2020-08-10 00:00:00.000000+0000
                 2020-08-10 00:00:00.000000+0000
                 2020-08-10 00:00:00.000000+0000
                 2020-08-10 00:00:00.000000+0000
                 2020-08-10 00:00:00.000000+0000
                 2020-08-10 00:00:00.000000+0000
                 2020-08-10 00:00:00.000000+0000

(9 rows)
cqlsh:killrvideo> select * from demo;

 instanceid                           | date1                           | date2                           | testing
--------------------------------------+---------------------------------+---------------------------------+---------
 8a6d3101-a20a-443d-87d9-a4949986e58e | 2020-08-10 18:31:56.398000+0000 |                            null |     999
 8a6d3101-a20a-333d-87d9-a4949986e88e | 2020-08-10 18:44:40.520000+0000 | 2020-08-01 13:30:00.000000+0000 |    null
 8a6d3101-a20a-443d-87d9-a4949986e12e | 2020-08-10 00:00:00.000000+0000 |                            null |    null
 8a6d3101-a20a-443d-87d9-a4949986e88e | 2020-08-10 18:41:46.015000+0000 | 2020-01-01 13:30:00.000000+0000 |    null
 8a6d3101-a20a-443d-87d9-a4949986e92e | 2020-08-10 18:33:29.599000+0000 |                            null |    null
 8a6d3101-a20a-223d-87d9-a4949986e88e | 2020-08-10 18:44:40.520000+0000 | 2020-08-03 13:30:00.000000+0000 |    null
 8a6d3101-a20a-113d-87d9-a4949986e88e | 2020-08-10 18:44:40.520000+0000 | 2020-08-22 07:30:00.000000+0000 |    null
 8a6d3101-a20a-443d-87d9-a4949986e90e | 2020-08-10 00:00:00.000000+0000 |                            null |    null
 8a6d3101-a20a-443d-87d9-a4949986e56e | 2020-08-10 00:00:00.000000+0000 | 2020-01-01 13:30:00.000000+0000 |    9999

(9 rows)
cqlsh:killrvideo> select * from item_payment_options;

 item_id | payment
---------+--------------------------------
     102 | {'ICICI', 'VISA', 'Zebronics'}
     100 | {'PAYPAL', 'PAYSWIPE', 'VISA'}
     101 | {'MasterCard', 'VISA', 'visa'}

(3 rows)

cqlsh:killrvideo> select item_id,count(item_id) from item_payment_options group by item_id;

 item_id | system.count(item_id)
---------+-----------------------
     102 |                     1
     100 |                     1
     101 |                     1

(3 rows)

Warnings :
Aggregation query used without partition key


cqlsh:killrvideo> 
cqlsh:killrvideo> CREATE TABLE payment_details
              ... (customer_id text,
              ...  date text,
              ...  paid_at timestamp,
              ...  amount float,
              ...  PRIMARY KEY (customer_id,date,paid_at)
              ... );
cqlsh:killrvideo> 
cqlsh:killrvideo> INSERT INTO payment_details (customer_id,date,paid_at,amount)
              ... VALUES ('C111','2017-04-03','2017-04-03 07:01:00',7300);
cqlsh:killrvideo> INSERT INTO payment_details (customer_id,date,paid_at,amount)
              ... VALUES ('C234','2017-04-03','2017-04-03 07:02:00',2100);
cqlsh:killrvideo> INSERT INTO payment_details (customer_id,date,paid_at,amount)
              ... VALUES ('C234','2017-04-03','2017-04-03 08:01:00',1300);
cqlsh:killrvideo> INSERT INTO payment_details (customer_id,date,paid_at,amount)
              ... VALUES ('C111','2017-04-03','2017-04-03 05:10:00',1900);
cqlsh:killrvideo> INSERT INTO payment_details (customer_id,date,paid_at,amount)
              ... VALUES ('C111','2017-04-03','2017-04-03 08:01:00',3600);
cqlsh:killrvideo> 
cqlsh:killrvideo> 
cqlsh:killrvideo> select * from payment_details 
              ... ;

 customer_id | date       | paid_at                         | amount
-------------+------------+---------------------------------+--------
        C234 | 2017-04-03 | 2017-04-03 01:32:00.000000+0000 |   2100
        C234 | 2017-04-03 | 2017-04-03 02:31:00.000000+0000 |   1300
        C111 | 2017-04-03 | 2017-04-02 23:40:00.000000+0000 |   1900
        C111 | 2017-04-03 | 2017-04-03 01:31:00.000000+0000 |   7300
        C111 | 2017-04-03 | 2017-04-03 02:31:00.000000+0000 |   3600

(5 rows)
cqlsh:killrvideo> select customer_id,date,sum(amount) from payment_details group by customer_id,date;

 customer_id | date       | system.sum(amount)
-------------+------------+--------------------
        C234 | 2017-04-03 |               3400
        C111 | 2017-04-03 |              12800

(2 rows)

Warnings :
Aggregation query used without partition key

cqlsh:killrvideo> select customer_id,count(*) from payment_details group by customer_id;

 customer_id | count
-------------+-------
        C234 |     2
        C111 |     3

(2 rows)

Warnings :
Aggregation query used without partition key

cqlsh:killrvideo> 
cqlsh:killrvideo> 
cqlsh:killrvideo> select * from payment_details  ;

 customer_id | date       | paid_at                         | amount
-------------+------------+---------------------------------+--------
        C234 | 2017-04-03 | 2017-04-03 01:32:00.000000+0000 |   2100
        C234 | 2017-04-03 | 2017-04-03 02:31:00.000000+0000 |   1300
        C111 | 2017-04-03 | 2017-04-02 23:40:00.000000+0000 |   1900
        C111 | 2017-04-03 | 2017-04-03 01:31:00.000000+0000 |   7300
        C111 | 2017-04-03 | 2017-04-03 02:31:00.000000+0000 |   3600

(5 rows)
cqlsh:killrvideo> desc payment_details 

CREATE TABLE killrvideo.payment_details (
    customer_id text,
    date text,
    paid_at timestamp,
    amount float,
    PRIMARY KEY (customer_id, date, paid_at)
) WITH CLUSTERING ORDER BY (date ASC, paid_at ASC)
    AND additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';


cqlsh:killrvideo> CREATE OR REPLACE FUNCTION killrvideo.Rupee2Dollar_conv (amount int)
              ... RETURNS NULL ON NULL INPUT
              ... RETURNS int
              ... LANGUAGE java
              ... AS'
              ... int result=0;
              ... if(amount == 0){
              ... amount=0;}
              ... else{
              ... result=amount/72;
              ... }
              ... return result;
              ... ';
cqlsh:killrvideo>  CREATE OR REPLACE FUNCTION killrvideo.Rupee2Dollar_conv (amount float)
              ...  RETURNS NULL ON NULL INPUT
              ...  RETURNS float
              ...  LANGUAGE java
              ...  AS'
              ...  Float d= new Float(amount);
              ...  Float result= new Float(0);
              ...  if(d == null){
              ...  amount=0.0f;}
              ...  else{
              ...  result=(float)(amount/72*100)/100;
              ...  }
              ...   return result;
              ...  ';
cqlsh:killrvideo> 
cqlsh:killrvideo> select Rupee2Dollar_conv(amount) from payment_details;

 killrvideo.rupee2dollar_conv(amount)
--------------------------------------
                             29.16666
                             18.05556
                             26.38889
                            101.38889
                                   50

(5 rows)

cqlsh:killrvideo> desc function killrvideo.Rupee2Dollar_conv;

CREATE FUNCTION killrvideo.rupee2dollar_conv(amount float)
    RETURNS NULL ON NULL INPUT
    RETURNS float
    LANGUAGE java
    AS $$
 Float d= new Float(amount);
 Float result= new Float(0);
 if(d == null){
 amount=0.0f;}
 else{
 result=(float)(amount/72*100)/100;
 }
  return result;
 $$;

CREATE FUNCTION killrvideo.rupee2dollar_conv(amount int)
    RETURNS NULL ON NULL INPUT
    RETURNS int
    LANGUAGE java
    AS $$
int result=0;
if(amount == 0){
amount=0;}
else{
result=amount/72;
}
return result;
$$;

cqlsh:killrvideo> select customer_id,Rupee2Dollar_conv(amount) from payment_details;

 customer_id | killrvideo.rupee2dollar_conv(amount)
-------------+--------------------------------------
        C234 |                             29.16666
        C234 |                             18.05556
        C111 |                             26.38889
        C111 |                            101.38889
        C111 |                                   50

(5 rows)
cqlsh:killrvideo> select customer_id,amount,Rupee2Dollar_conv(amount) from payment_details;
'
 customer_id | amount | killrvideo.rupee2dollar_conv(amount)
-------------+--------+--------------------------------------
        C234 |   2100 |                             29.16666
        C234 |   1300 |                             18.05556
        C111 |   1900 |                             26.38889
        C111 |   7300 |                            101.38889
        C111 |   3600 |                                   50

(5 rows)
cqlsh:killrvideo> select customer_id,amount,Rupee2Dollar_conv(amount) from payment_details; CREATE OR REPLACE FUNCTION killrvideo.Rupee2Dollar_conv (amount float)
              ...  RETURNS NULL ON NULL INPUT
              ...  RETURNS float
              ...  LANGUAGE java
              ...  AS'
              ...  Float d= new Float(amount);
              ...  Float result= new Float(0);
              ...  if(d == null){
              ...  amount=0.0f;}
              ...  else{
              ...  result=(float)(amount/74.88*100)/100;
              ...  }
              ...   return result;
              ...  ';

 customer_id | amount | killrvideo.rupee2dollar_conv(amount)
-------------+--------+--------------------------------------
        C234 |   2100 |                             29.16666
        C234 |   1300 |                             18.05556
        C111 |   1900 |                             26.38889
        C111 |   7300 |                            101.38889
        C111 |   3600 |                                   50

(5 rows)
cqlsh:killrvideo> 
cqlsh:killrvideo> 
cqlsh:killrvideo>  CREATE OR REPLACE FUNCTION killrvideo.Rupee2Dollar_conv (amount float)
              ...  RETURNS NULL ON NULL INPUT
              ...  RETURNS float
              ...  LANGUAGE java
              ...  AS'
              ...  Float d= new Float(amount);
              ...  Float result= new Float(0);
              ...  if(d == null){
              ...  amount=0.0f;}
              ...  else{
              ...  result=(float)(amount/74.88*100)/100;
              ...  }
              ...   return result;
              ...  ';
cqlsh:killrvideo> 
cqlsh:killrvideo> 
cqlsh:killrvideo> 
cqlsh:killrvideo> select customer_id,amount,Rupee2Dollar_conv(amount) from payment_details;

 customer_id | amount | killrvideo.rupee2dollar_conv(amount)
-------------+--------+--------------------------------------
        C234 |   2100 |                             28.04487
        C234 |   1300 |                             17.36111
        C111 |   1900 |                             25.37393
        C111 |   7300 |                             97.48932
        C111 |   3600 |                             48.07692

(5 rows)
cqlsh:killrvideo> select customer_id,amount,Rupee2Dollar_conv(amount) from payment_details;

 customer_id | amount | killrvideo.rupee2dollar_conv(amount)
-------------+--------+--------------------------------------
        C234 |   2100 |                             28.04487
        C234 |   1300 |                             17.36111
        C111 |   1900 |                             25.37393
        C111 |   7300 |                             97.48932
        C111 |   3600 |                             48.07692

(5 rows)
cqlsh:killrvideo>  CREATE OR REPLACE FUNCTION killrvideo.Rupee2Dollar_conv (amount float)
              ...  RETURNS NULL ON NULL INPUT
              ...  RETURNS float
              ...  LANGUAGE java
              ...  AS'
              ...  Float d= new Float(amount);
              ...  Float result= new Float(0);
              ...  if(d == null){
              ...  amount=0.0f;}
              ...  else{
              ...  result=(float) Math.round((amount/74.88*100)/100);
              ...  }
              ...   return result;
              ...  ';
cqlsh:killrvideo> 
cqlsh:killrvideo> select customer_id,amount,Rupee2Dollar_conv(amount) from payment_details;

 customer_id | amount | killrvideo.rupee2dollar_conv(amount)
-------------+--------+--------------------------------------
        C234 |   2100 |                                   28
        C234 |   1300 |                                   17
        C111 |   1900 |                                   25
        C111 |   7300 |                                   97
        C111 |   3600 |                                   48

(5 rows)
cqlsh:killrvideo>  CREATE OR REPLACE FUNCTION killrvideo.Rupee2Dollar_conv (amount float)
              ...  RETURNS NULL ON NULL INPUT
              ...  RETURNS float
              ...  LANGUAGE java
              ...  AS'
              ...  Float d= new Float(amount);
              ...  Float result= new Float(0);
              ...  if(d == null){
              ...  amount=0.0f;}
              ...  else{
              ...  result=(float) Math.ceil((amount/74.88*100)/100);
              ...  }
              ...   return result;
              ...  ';
cqlsh:killrvideo> 
cqlsh:killrvideo> select customer_id,amount,Rupee2Dollar_conv(amount) from payment_details;

 customer_id | amount | killrvideo.rupee2dollar_conv(amount)
-------------+--------+--------------------------------------
        C234 |   2100 |                                   29
        C234 |   1300 |                                   18
        C111 |   1900 |                                   26
        C111 |   7300 |                                   98
        C111 |   3600 |                                   49

(5 rows)

cqlsh:killrvideo>  CREATE OR REPLACE FUNCTION killrvideo.Rupee2Dollar_conv (amount float)
              ...  RETURNS NULL ON NULL INPUT
              ...  RETURNS float
              ...  LANGUAGE java
              ...  AS'
              ...  Float d= new Float(amount);
              ...  Float result= new Float(0);
              ...  if(d == null){
              ...  amount=0.0f;}
              ...  else{
              ...  result=(float)(amount/74.88*100)/100;
              ...  }
              ...   return result;
              ...  ';
cqlsh:killrvideo> 
cqlsh:killrvideo> 
cqlsh:killrvideo> select customer_id,amount,Rupee2Dollar_conv(amount) from payment_details;

 customer_id | amount | killrvideo.rupee2dollar_conv(amount)
-------------+--------+--------------------------------------
        C234 |   2100 |                             28.04487
        C234 |   1300 |                             17.36111
        C111 |   1900 |                             25.37393
        C111 |   7300 |                             97.48932
        C111 |   3600 |                             48.07692

(5 rows)
cqlsh:killrvideo> desc payment_details;

CREATE TABLE killrvideo.payment_details (
    customer_id text,
    date text,
    paid_at timestamp,
    amount float,
    PRIMARY KEY (customer_id, date, paid_at)
) WITH CLUSTERING ORDER BY (date ASC, paid_at ASC)
    AND additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';

cqlsh:killrvideo> select * from payment_details;

 customer_id | date       | paid_at                         | amount
-------------+------------+---------------------------------+--------
        C234 | 2017-04-03 | 2017-04-03 01:32:00.000000+0000 |   2100
        C234 | 2017-04-03 | 2017-04-03 02:31:00.000000+0000 |   1300
        C111 | 2017-04-03 | 2017-04-02 23:40:00.000000+0000 |   1900
        C111 | 2017-04-03 | 2017-04-03 01:31:00.000000+0000 |   7300
        C111 | 2017-04-03 | 2017-04-03 02:31:00.000000+0000 |   3600

(5 rows)
cqlsh:killrvideo> INSERT INTO payment_details (customer_id,date,paid_at,amount)
              ... VALUES ('C222','2020-04-03','2020-04-03 08:01:00',0);
cqlsh:killrvideo> 
cqlsh:killrvideo> select * from payment_details;

 customer_id | date       | paid_at                         | amount
-------------+------------+---------------------------------+--------
        C222 | 2020-04-03 | 2020-04-03 02:31:00.000000+0000 |      0
        C234 | 2017-04-03 | 2017-04-03 01:32:00.000000+0000 |   2100
        C234 | 2017-04-03 | 2017-04-03 02:31:00.000000+0000 |   1300
        C111 | 2017-04-03 | 2017-04-02 23:40:00.000000+0000 |   1900
        C111 | 2017-04-03 | 2017-04-03 01:31:00.000000+0000 |   7300
        C111 | 2017-04-03 | 2017-04-03 02:31:00.000000+0000 |   3600

(6 rows)

cqlsh:killrvideo> select customer_id,amount,Rupee2Dollar_conv(amount) from payment_details;

 customer_id | amount | killrvideo.rupee2dollar_conv(amount)
-------------+--------+--------------------------------------
        C222 |      0 |                                    0
        C234 |   2100 |                             28.04487
        C234 |   1300 |                             17.36111
        C111 |   1900 |                             25.37393
        C111 |   7300 |                             97.48932
        C111 |   3600 |                             48.07692

(6 rows)

cqlsh:killrvideo> desc function killrvideo.Rupee2Dollar_conv;

CREATE FUNCTION killrvideo.rupee2dollar_conv(amount float)
    RETURNS NULL ON NULL INPUT
    RETURNS float
    LANGUAGE java
    AS $$
 Float d= new Float(amount);
 Float result= new Float(0);
 if(d == null){
 amount=0.0f;}
 else{
 result=(float)(amount/74.88*100)/100;
 }
  return result;
 $$;

CREATE FUNCTION killrvideo.rupee2dollar_conv(amount int)
    RETURNS NULL ON NULL INPUT
    RETURNS int
    LANGUAGE java
    AS $$
int result=0;
if(amount == 0){
amount=0;}
else{
result=amount/72;
}
return result;
$$;

cqlsh:killrvideo> select customer_id,amount,Rupee2Dollar_conv(amount) from payment_details;

 customer_id | amount | killrvideo.rupee2dollar_conv(amount)
-------------+--------+--------------------------------------
        C222 |      0 |                                    0
        C234 |   2100 |                             28.04487
        C234 |   1300 |                             17.36111
        C111 |   1900 |                             25.37393
        C111 |   7300 |                             97.48932
        C111 |   3600 |                             48.07692

(6 rows)
cqlsh:killrvideo> INSERT INTO payment_details (customer_id,date,paid_at)
              ... VALUES ('C333','2020-04-13','2020-04-13 08:01:00');
cqlsh:killrvideo> 
cqlsh:killrvideo> select customer_id,amount,Rupee2Dollar_conv(amount) from payment_details;

 customer_id | amount | killrvideo.rupee2dollar_conv(amount)
-------------+--------+--------------------------------------
        C222 |      0 |                                    0
        C234 |   2100 |                             28.04487
        C234 |   1300 |                             17.36111
        C333 |   null |                                 null
        C111 |   1900 |                             25.37393
        C111 |   7300 |                             97.48932
        C111 |   3600 |                             48.07692

(7 rows)

cqlsh:killrvideo> drop function killrvideo.rupee2dollar_conv(int);
cqlsh:killrvideo> drop function killrvideo.rupee2dollar_conv;
cqlsh:killrvideo>  CREATE OR REPLACE FUNCTION killrvideo.Rupee2Dollar_conv (amount float)
              ...  RETURNS NULL ON NULL INPUT
              ...  RETURNS float
              ...  LANGUAGE java
              ...  AS'
              ...  Float d= new Float(amount);
              ...  Float result= new Float(0);
              ...  if(d == null){
              ...  amount=0.0f;}
              ...  else{
              ...  result=(float)(amount/74.88*100)/100;
              ...  }
              ...   return result;
              ...  ';
cqlsh:killrvideo> 
cqlsh:killrvideo>  select * from payment_details 
              ... ;

 customer_id | date       | paid_at                         | amount
-------------+------------+---------------------------------+--------
        C222 | 2020-04-03 | 2020-04-03 02:31:00.000000+0000 |      0
        C234 | 2017-04-03 | 2017-04-03 01:32:00.000000+0000 |   2100
        C234 | 2017-04-03 | 2017-04-03 02:31:00.000000+0000 |   1300
        C333 | 2020-04-13 | 2020-04-13 02:31:00.000000+0000 |   null
        C111 | 2017-04-03 | 2017-04-02 23:40:00.000000+0000 |   1900
        C111 | 2017-04-03 | 2017-04-03 01:31:00.000000+0000 |   7300
        C111 | 2017-04-03 | 2017-04-03 02:31:00.000000+0000 |   3600

(7 rows)
cqlsh:killrvideo> desc payment_details;

CREATE TABLE killrvideo.payment_details (
    customer_id text,
    date text,
    paid_at timestamp,
    amount float,
    PRIMARY KEY (customer_id, date, paid_at)
) WITH CLUSTERING ORDER BY (date ASC, paid_at ASC)
    AND additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';


cqlsh:killrvideo> alter table killrvideo.payment_details with compaction={ 'class':'SizeTieredCompactionStrategy','min_threshold':'2'};
cqlsh:killrvideo> desc payment_details ;

CREATE TABLE killrvideo.payment_details (
    customer_id text,
    date text,
    paid_at timestamp,
    amount float,
    PRIMARY KEY (customer_id, date, paid_at)
) WITH CLUSTERING ORDER BY (date ASC, paid_at ASC)
    AND additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '2'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';


cqlsh:killrvideo> alter table killrvideo.payment_details with caching={'keys':'ALL'};
cqlsh:killrvideo> desc payment_details ;

CREATE TABLE killrvideo.payment_details (
    customer_id text,
    date text,
    paid_at timestamp,
    amount float,
    PRIMARY KEY (customer_id, date, paid_at)
) WITH CLUSTERING ORDER BY (date ASC, paid_at ASC)
    AND additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '2'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';

cqlsh:killrvideo> alter table killrvideo.payment_details with caching={'keys':'ALL','rows_per_partition':120};
cqlsh:killrvideo> desc payment_details ;

CREATE TABLE killrvideo.payment_details (
    customer_id text,
    date text,
    paid_at timestamp,
    amount float,
    PRIMARY KEY (customer_id, date, paid_at)
) WITH CLUSTERING ORDER BY (date ASC, paid_at ASC)
    AND additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': '120'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '2'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';

cqlsh:killrvideo> select * from payment_details ;

 customer_id | date       | paid_at                         | amount
-------------+------------+---------------------------------+--------
        C222 | 2020-04-03 | 2020-04-03 02:31:00.000000+0000 |      0
        C234 | 2017-04-03 | 2017-04-03 01:32:00.000000+0000 |   2100
        C234 | 2017-04-03 | 2017-04-03 02:31:00.000000+0000 |   1300
        C333 | 2020-04-13 | 2020-04-13 02:31:00.000000+0000 |   null
        C111 | 2017-04-03 | 2017-04-02 23:40:00.000000+0000 |   1900
        C111 | 2017-04-03 | 2017-04-03 01:31:00.000000+0000 |   7300
        C111 | 2017-04-03 | 2017-04-03 02:31:00.000000+0000 |   3600

(7 rows)

cqlsh:killrvideo> alter table payment_details add new text;
cqlsh:killrvideo> alter table payment_details drop new ;
cqlsh:killrvideo> 
  [Restored 11-Aug-2020 at 8:17:54 PM]
Last login: Tue Aug 11 20:17:54 on ttys014
Restored session: Tue Aug 11 20:16:28 IST 2020
Dibyajyotis-MacBook-Air:dse-6.8.1 dibyajyoti$ 
  [Restored 11-Aug-2020 at 8:21:25 PM]
Last login: Tue Aug 11 20:21:25 on ttys013
Restored session: Tue Aug 11 20:20:08 IST 2020
Dibyajyotis-MacBook-Air:dse-6.8.1 dibyajyoti$ 
