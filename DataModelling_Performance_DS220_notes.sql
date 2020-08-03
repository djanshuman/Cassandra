Data Modelling
==============
1. Analyze requirments of the domain. 
2. Identify entities and relationships : CONCEPTUAL DATA MODEL
3. Idetify queries: WORKFLOW AND ACCESS PATTERNS . This is the unique step in cassandra unlike RDBMS. Here before mapping the
conceptual data model to actual logical or physical model we brainstorm on access patterns, how the application will be accessed.
Who will be the end user ? What is will be dataset and keyspace ,table size. Datatype etc. This is important to 
avoid any surprises after application is deployed. 
4. Specify the Schema - LOGICAL DATA MODEL . Here we actually design our keyspace, identify no of tables etc.
5. Get something working with CQL - PHYSICAL DATA MODEL. Here we add the datatypes to column in tables and execute queries
to test our schema and objective.
6. Optimize and tune : Revisit our steps to validate and ensure if any scope of optimization.


DATA Modeling Methodology
=========================

CONCEPTUAL 
DATA
MODEL
|
|
------------->MAPPING OF CONCEPTUAL TO LOGICAL --> LOGICAL DATAMODEL->	PHYSICAL DATA MODEL-> OPTIMIZATION TUNING
^
|
|
|				
APPLICATION
WORKFLOW

1.Recommended Developing CONCEPTUAL DATA MODELLING AND Application workflow analysis of queries and access patterns are done in parrallel
to ensure logical and physical data model are good fit.
2. Queries are driving force in apache cassandra . It is very crucial to understand application workflow,
types of queries your application will support.
3. Design table around your queries.


Keyspaces: Just like container containing tables.
They determine the class of replication strategy,topology and replication factor.

Tables: Contain data

DataType: 
1. text (UTF-8 encoded string), same as varchar
2.int - signed ,32 bits
3.UUID : Universal unique Identifier , UUID()
4. timeUUID : now (), sortable
5. timestamp: stores date and time, 64-bit integer , yyyy-mm-dd hh:mm:ssZ
	  
COPY command: 
To copy data from csv files or external data sources.
synxtax: COPY table (col1,col2,col3) from 'x.csv';
COPY table (col1,col2,col3) from 'z.csv' with HEADER=TRUE; This command skips the first line as header.

Select command:
select * from table_name;
select col1,col2,col3 from table_name;
select count(*) from table_name;
select * from table1 limit 10;

Warning : We should not directly use above commands as is due to expensive I/O operations. These are just sample
examples. Use of partition key is a must.

truncate: all rows delete from table wheras schema is preserved.
syntax: truncate table;
1.truncate sends a JMX command to all nodes  to delete the SSTable that hold data.
2.if any of the nodes are down then commands will fail.

Alter: add/delete/modify column in table.
Syntax: alter table <table_name> add <column_name> < datatype>;
alter table <table_name> drop <column_name>;

Source: execute cql scripts.
1. The file name must be enclosed in single quotes.
2. Execute file containing cql statements.
3. Output is in sequence.
example : SOURCE './myscript.sql';

Other data types:
1. BLOB
2. Counter
3. Inet
4. Boolean


Partition
=========

PRIMARY KEY = PARTITION_KEY + CLUSTERING COLUMNS (UNIQUENESS)
PARTITION KEY= PART OF A PRIMARY KEY WHICH DETERMINES THE NODE WHERE DATA TO BE PLACED ON. ( FOR PLACEMENT)
COMPOSITE PRIMARY KEY (TWO PARTITION KEY INSIDE BRACKETS) -> PRIMARY KEY ( (ID,NAME), ADDED_DATE,TITLE)


1. Collections
2. Counters
3. UDTs
4. UDFs and UDAs

COllections
============

1.collections are multivalued columns
2. Group and store data together in a column
3. Retrieved entirely.
3. Cannot nest a collection inside another collection unless FROZEN IS USED.

UDT:

 CREATE TYPE IF NOT EXISTS video_encoding (
        encoding TEXT,
        height INT,
        width INT,
        bit_rates SET<TEXT>
     );

encoding frozen<video_encoding>,
  

cqlsh:killrvideo> select encoding from videos_by_genre where genre='Musical' limit 10;

 encoding
----------------------------------------------------------------------------------------------------
 {encoding: '1080p', height: 1080, width: 1920, bit_rates: {'3000 Kbps', '4500 Kbps', '6000 Kbps'}}
 {encoding: '1080p', height: 1080, width: 1920, bit_rates: {'3000 Kbps', '4500 Kbps', '6000 Kbps'}}
 {encoding: '1080p', height: 1080, width: 1920, bit_rates: {'3000 Kbps', '4500 Kbps', '6000 Kbps'}}

SET
===
1.Stored unordered retrieved inorder.
2.Typed collection of unique values
2. datatype is mentioned in brackets.

create table users(
x1 text,
x2 timestamp,
x3 uuid,
x4 set<text>)

LIST
===
1. Like set collections of values in cell.
2. Can be duplicate and stored in particular order.

x3 list<text>

MAP
===
typed collection of key,value pairs.
key is unique

alter table users add to_do<timestamp,text>
to_do={'2010-1-1':'hello','2013-2-3',"SWAP"}

UDT (user defined type)
======================
1. attach multiple data fields to a column.
2. can be any datatype including collections and UDT
2. Allow embedding more complex data within a single column.

COUNTERS
1. They are 64 bit Integers and non-primary key column.
2. Is used for incrementing or decrementing value.
3. Separate table with Primary_key + counter column.
4. Update table counter count using primary key .
5. Cannot insert of assign values, Default value is 0
6. Counter columns cannot be indexed or deleted.


UDF
===
1. Custom functions using java and javascript.
2. These func are only available inside the keyspace where it is defined.

In cassandra.yml:
java:
enable_user_defined_functions: true
javascript and other lang:
enable_scripted_user_defined_functions:true

UDA
===

Conceptual data modelling:
==========================
1. Similar to ER diagrams.
2. Identifying objects,entities ,relationship(m:n,1:n) and the attributes types.
3. Identify the purpose, constraints of the model.

key attributes:
1. each object has a key attribute.
composite key attributes:
1. two attributes grouped together as key for the object.
multi-valued attributes:
1. if a attribute can be multi values then they are multivalued.

Application workflow access patterns:
=====================================
Apache cassandra is query driven. 
We have to figure out the queries that are to be executed against our databases in process.
Dependencies /flow graph on how a task is performed.
How a data is accessed .
Basically its a map kind of thing of our application. for example have a user login to our site.

Q1
|
|
User login --------> Q2 show latest video
|
|
|--------------------
show user info		|
				show videos uploaded by other user

queries:

q1: Find specific email id of user
q2: find the latest videos
q3: show user information using user_id
q4: show video uploaded by a specific id with latest video first

Mapping of conceptual data model to logical model:

conceptual data model (ER diagrams) + Access patterns (Queries)
---------------------------------------------------------------
			|		|
			|		|
			|		|
			|		|
			----------------
			|Rules + Pattern|
			-----------------
				|
				|
			logical data model
			
Now we the logical level shows column names and properties.
physical level also shows column data type.

table_name
col1  CQLtype ---K  partition key
col2  CQLtype ---C	clustering column (ASC)
col3  CQLtype ---C  clustering column (DESC)
col4  CQLtype ---S   static column
col5  CQLtype ---IDX secondary index
[col6]  CQLtype ---LIST collection column (LIST)
<col7>  CQLtype ---MAP  collection column (MAP)
{col8}  CQLtype ---set  collection column (SET)
*col9*	CQLtype -- UDT  UDT column

Physical diagram
===============
we adding CQL datatypes to the above logical diagram to obtain physical diagram.

Data modelling principles
=========================
1. Know your data :

Data captured by conceptual model
Define what is stored in database
preserve properties so that data is organised correctly.

Knowing Primary key is the crucial step as primary key adds uniqueness+ data placement.

2. Know your queries
Queries directly affect schema design.

queries are captured by application workflow model.
Table schema design changes if query changes as the data modelling was done based on probable queries analysis.

i. Singe partition per query is ideal: Most efficient access pattern. Query access only one partition and retrieve results.
partition can be single row or multi row.
ii. Partition + QUery: Acceptable. The query has to access multiple partitions to retrieve results. Few of these
is acceptable.
iii. Table scan/multi-table scan: Involes querying access all partition. least efficient and should be avoided.
Linear search all node.

3. Nest data 

i. Nest data - clustering column
clustering column - primary data nesting mechanism
ii. Nest data using UDT
Mostly in 1:1 relationship.
easier working in mutiple collection columns.

4. Duplicate data:(Better to duplicate then to join)
In Apache cassandra we dont do joins while read. We just want to query and send the data efficiently to client app
quickly. This is where data modelling comes. As we dont have joins on read we should do our conceptual+application workflow
analysis properly to come up with correct objects and queries so that we have correct tables or write while injecting data.

Infact(Joins) we do it while writing by duplicating.When we perform write we materialize the join on disk.

example : we have videos_by_tag(tag_id is the primary key) , videos_by_actor(actor id is the primary key), 
videos_by_genre(genre id is the primary key)
in above tables we have same columns in all 3 tables ie. video attributes and only p.k is different so basically
we are nesting duplicates per partition .
Query results are precomputed and materialized. data can be duplicated across tables,rows and partitions.

* We duplicate data while write so that queries can have constant time access.

Mapping rules:
==============
1. Entites and relationship
2. equality search attribute
3. inequality search attribute
4. ordering attributes
5. key attributes

Since cassandra is query driven. First frame a query with equality and inequality/range operators on column
and ordering.

Now follow steps
================
1. Based on ER we have objects or table ready --> MR1
2. check the query for equality now thats the partition key and make that P.K in MR2
3. Now check for inequality of range scan column in query make those as clustering column in MR3
4. Now check for order by columns. Make them in MR4
5. Now this step is to ensure uniqueness. Make any extra column as clustering column if u found it is necessary to maintain
unique rows.

We are done with our Logical Model now so.
Conceptual data model ( ER diagram) + Application workflow (Queries / Application access patterns) 
									|
									|
									|
							<Mapping Rules> 
									|
									|
							< Logical data model>

Physical data modelling:
=======================
In this step we just need to add the correct CQL types to the logical data model.

Loading data methods:
====================

1. DSE Bulk loaded:
Datastax enterprise bulk loader for large datasets.
i. Moves cassandra data to/from files  in the filesystem.
ii. uses both JSON and CSV formats.
iii. CLI and used for loading large amount of data fast.

example: dsebulk load -url file1.csv -k ks1 -t table1


2. Copy command - 
i.Copy from exports from csv.
ii.Copy to exportd to csv.
The process verifies primary key and updates existing records.
if column is missing then set null

3. SSTable loader
i.Bulk load external data into a cluster.
ii. Load pre-existing sstables into:
	a new cluster or existing cluster
	a cluster with same number of nodes or different no of nodes.
	a cluster with a different replication strategy or partitioner.

example : sstableloader -d 110.82.155.1 /var/lib/cassandra/data/killrvideo/users/

	

OPTIMIZATION AND TUNING
======================
What are the reasons that cause people to re-visit a data model?
1. Requirement change in the domain.
2. Unforeseen load on a particular node.
3. Data is becoming inbalanced.
4. The datamodel is no longer efficient


Analysis and validations
=========================
Import considerations:

1. Natural or surrogate keys. : Surrogate keys is good for partition key.
2. Are write conflicts(Overwrites) possible ? / Upserts ?
3. what data types to use ?
4. how large are partitions ?
5. how much data duplication is required ?
6. Are client side joins required and at what cost?
7. Are data consistency anomalies possible ?
8. How to enable transactions and data aggregations ?
	
Write techniques
================
Schema data consistency refers to the correctness of data copies.

1. Data consistency with batches:

i. With data duplication been done for denormalization now we should worry about data consistency
and should handle it.
2. All copies of same data in our schema should have same values.
3. Adding, updating ,deleting data may require multiple Inserts,updates and deletes.
4. Logged batches were built for maintaining consistency.
5. Have a documented plan.

Logged batches in DSE are written once as a script and sent to the co-ordinator node.
Once the batch is accepted by node it then takes the execution responsibility of eventually
running and executing it in every node.

Usual scenario:

VIDEO TABLE
-----------
video_id K
uploaded_timestamp
title
description
type
release_date
{tags}
<preview_thumbnails>

videos_by_title 
---------------
title K
video_id C  ^|
uploaded_timestamp
description
type
release_date
{tags}
<preview_thumbnails>

Insert a new video:
-------------------
Insert into video(video_id,....) values (1,...)
Insert into videos_by_title(title,video_id,...) values('JAW',1,...)

Update a title of existing video_id:
-------------------------------------
if a table has title as P.k then updating a title of same p.k will actually
update the title with new name but old records actually stays in disk.
So we go for : Fresh Insert of new rows then delete the old row with old title

UPDATE VIDEOS SET TITLE='JAWS' WHERE VIDEO_ID=1;
INSERT INTO VIDEOS_BY_TITLE(TITLE,VIDEO_ID,...) VALUES("JAWS",1,..)
DELETE FROM VIDEOS_BY_TITLE WHERE TITLE='JAW' AND VIDEO_ID=1;

IN Above procedure if any statement fails to execute then data will be inconsistent.

LOGGED BATCH EXAMPLE:

TO INSERT A NEW VIDEO:
=====================
	
	BEGIN BATCH
		Insert into video(video_id,....) values (1,...)
		Insert into videos_by_title(title,video_id,...) values('JAW',1,...)
	APPLY BATCH;

TO UPDATE THE TITLE OF A VIDEO
=============================
	BEGING BATCH
		UPDATE VIDEOS SET TITLE='JAWS' WHERE VIDEO_ID=1;
		INSERT INTO VIDEOS_BY_TITLE(TITLE,VIDEO_ID,...) VALUES("JAWS",1,..)
		DELETE FROM VIDEOS_BY_TITLE WHERE TITLE='JAW' AND VIDEO_ID=1;
	APPLY BATCH;

MORE ON BATCHES:
1. When the logged batches is executed it is written to a log in co-ordinator and replica nodes before execution.
2. batches succeeds when writes have been applied or hinted off.
3. replicas take over if the co-ordinator fails in mid-batch
4. Get us near to acid property as rollback not required . Cassandra ensures the writes succeeds finally.
5. However batch isolation not possible. There might be a window to read both old and new data when execution is going on.

Lightweight transactions:

Compare and Set(CAS) operations with ACID properties
1. does a read to check a condition and performs insert/update/delete if the condition is true.
2. essentially an acid transactions at partition level
3. more expensive then regular reads and write.


CLient ------> Co-ordinator-> node1
1.check for partition
2. if not exists then do write

Sample Insert:
insert into () values () IF NOT EXISTS;

Sample update:
Generate a password reset token then reset password:
update users set reset_token=123 where user_id='pmcadin'

update users set reset_token=null,password='abc' where user_id='pmcadin'
IF reset_token=123;

									
READ TECHNIQUES
===============

Secondary Index:
1.Secondary index allow a table to be created upon a column which is usually prohibited.
2. Created seconday index doesnt require change in table design.
3. Can be created on any column including collections except counters and static columns.

Secondary index creates additional datastructure on nodes holding table partitions.
A secondary index is further divided into many local indexs on nodes.
1. These are local indexes on nodes indexing values in rows stored locally.
2. Querying only on s-index column will require accessing local index on all nodes which is expensive.
3. Querying on s-index + partition key requires only accessing local index on nodes-efficient.

How does the request work:
1. Client sends request to co-ordinator node.
2. co-ordinator checks if partition exists in query along with s-index col.
3. if not then it queries all nodes for local index row sets.
4. co-ordi receives all local row set from all nodes and consolidates them.
5. sends back to client.

Things to considered for s-index 

Should be use in case of :
1. Low cardinality.
2. On smaller data set.
3. for search in both partition_key+index column in large partition

Should not be used where:

1. High Cardinality
2. table involving counter columns.
3. On columns where frequent update/deletes happen .


STATIC COLUMNS:
==============
Static columns are shared across a partitions for all rows.
Partition Key & Clustering Columns cannot be defined as static.

In a table there must be a clustering column then static column can be defined.
It is basically common rows which are shared and doesnt require to be inserted for same partition+clustering col
combinations. Also retrieval can be done in distinct keyword(should not be done in clustering col . 
Only PartitionKey+static col) and returns only 1 row whereas non-static columns would require returning more rows which is in efficient.

cqlsh:killr_video> create table test(
               ... x1 int,
               ... x2 text,
               ... x3 text static,
               ... primary key(x1,x2));

cqlsh:killr_video> 
cqlsh:killr_video> desc test ;

CREATE TABLE killr_video.test (
    x1 int,
    x2 text,
    x3 text static,
    PRIMARY KEY (x1, x2)
) WITH CLUSTERING ORDER BY (x2 ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99PERCENTILE';

cqlsh:killr_video> insert into test(x1,x2,x3) values(0,'hello','I am shared');
cqlsh:killr_video> select * from test ;

@ Row 1
----+-------------
 x1 | 0
 x2 | hello
 x3 | I am shared

(1 rows)
cqlsh:killr_video> insert into test(x1,x2,x3) values(1,'hello','I am still shared');
cqlsh:killr_video> select * from test ;

@ Row 1
----+-------------------
 x1 | 1
 x2 | hello
 x3 | I am still shared

@ Row 2
----+-------------------
 x1 | 0
 x2 | hello
 x3 | I am shared

(2 rows)
cqlsh:killr_video> insert into test(x1,x2,x3) values(0,'new','I am still shared');
cqlsh:killr_video> select * from test ;

@ Row 1
----+-------------------
 x1 | 1
 x2 | hello
 x3 | I am still shared

@ Row 2
----+-------------------
 x1 | 0
 x2 | hello
 x3 | I am still shared

@ Row 3
----+-------------------
 x1 | 0
 x2 | new
 x3 | I am still shared

(3 rows)
cqlsh:killr_video> insert into test(x1,x2,x3) values(1,'Cool','I am shared');
cqlsh:killr_video> select * from test ;

@ Row 1
----+-------------------
 x1 | 1
 x2 | Cool
 x3 | I am shared

@ Row 2
----+-------------------
 x1 | 1
 x2 | hello
 x3 | I am shared

@ Row 3
----+-------------------
 x1 | 0
 x2 | hello
 x3 | I am still shared

@ Row 4
----+-------------------
 x1 | 0
 x2 | new
 x3 | I am still shared

(4 rows)
cqlsh:killr_video> update test set x3='I am updated now' where x1=0;
cqlsh:killr_video> select * from test ;

@ Row 1
----+------------------
 x1 | 1
 x2 | Cool
 x3 | I am shared

@ Row 2
----+------------------
 x1 | 1
 x2 | hello
 x3 | I am shared

@ Row 3
----+------------------
 x1 | 0
 x2 | hello
 x3 | I am updated now

@ Row 4
----+------------------
 x1 | 0
 x2 | new
 x3 | I am updated now

(4 rows)
cqlsh:killr_video> select x1,x2,x3 where x1=0;
SyntaxException: line 1:16 no viable alternative at input 'where' (select x1,x2,[x3] where...)
cqlsh:killr_video> select x1,x2,x3 from test where x1=0;

@ Row 1
----+------------------
 x1 | 0
 x2 | hello
 x3 | I am updated now

@ Row 2
----+------------------
 x1 | 0
 x2 | new
 x3 | I am updated now

(2 rows)
cqlsh:killr_video> select distinct x1,x3 from test where x1=0;

@ Row 1
----+------------------
 x1 | 0
 x3 | I am updated now

(1 rows)
cqlsh:killr_video> select  x1,x3 from test where x1=0;

@ Row 1
----+------------------
 x1 | 0
 x3 | I am updated now

@ Row 2
----+------------------
 x1 | 0
 x3 | I am updated now

(2 rows)
cqlsh:killr_video> select distinct x1,x3 from test where x1=0;

@ Row 1
----+------------------
 x1 | 0
 x3 | I am updated now

(1 rows)
cqlsh:killr_video> 


Materialized view
=================

1. Materialized views are built on top of source/base table. It provides the way to query non partition key 
values requirement.
2. One-to-one relationship : Primary Keys of source table must be part of m-view primary key.
3. Only one extra column can be part of p.k in m-view which should not be a static column.

caveats
=======
1. Insert can only be done to source table not m-view.
2. When insert/update is done to source/base table there might be some delay in m-view reflection is delayed.
3. Read repair when done in source table then m-view also taken care but read-repair on m-view
doesnt do in source table .


User:
user_id K,
email,
first_name,
last_name,
registration_date

CREATE MATERIALIZED VIEW USER_BY_EMAIL AS 
SELECT FIRST_NAME,LAST_NAME,EMAIL 
FROM USERS
WHERE USER_ID IS NOT NULL AND EMAIL IS NOT NULL
PRIMARY KEY(USER_ID,EMAIL);


CREATE TABLE killr_video.videos (
    video_id timeuuid PRIMARY KEY,
    avg_rating float,
    description text,
    encoding frozen<encoding_type>,
    genres set<text>,
    mpaa_rating text,
    preview_thumbnails map<int, blob>,
    release_date timestamp,
    tags set<text>,
    title text,
    type text,
    url text,
    user_id uuid


CREATE MATERIALIZED VIEW videos_vw as 
select type,tags,url from
videos where video_id is not null and type is not null
primary key(video_id,type);
cqlsh:killr_video> select type,tags,url from videos_vw limit 30;

 type    | tags | url
---------+------+-----------------------------------------------------------
   Movie | null |                                                      null
   Movie | null |                                                      null
   Movie | null |                                                      null
   Movie | null |                                                      null
   Movie | null |                                                      null
   Movie | null |                                                      null
   Movie | null |                                                      null
   Movie | null |                                                      null
   Movie | null |                                                      null
   Movie | null |                                                      null
   Movie | null |                                                      null
   Movie | null |                                                      null
   Movie | null |                                                      null
   Movie | null |                                                      null
 Trailer | null | http://www.spike.com/video-clips/56u6ik/the-queen-trailer
   Movie | null |                                                      null
   Movie | null |                                                      null
   Movie | null |                                                      null
   Movie | null |                                                      null
   Movie | null |                                                      null
 Trailer | null |                               http://youtu.be/zonotSm4Mdc
   Movie | null |                                                      null
   Movie | null |                                                      null
   Movie | null |                                                      null
   Movie | null |                                                      null
   Movie | null |                                                      null
 Trailer | null |        http://www.foxsearchlight.com/trailer/153/trailer/
   Movie | null |                                                      null
 Trailer | null |                http://www.youtube.com/watch?v=kckEEQKXaCU
   Movie | null |                                                      null

Data aggregation
================
1. Aggregations calculated at query time.
supported are min,max,count,avg,sum.

How to do data aggregation?
1. use counter columns in a table.
2. update the columns in a table when insert is done.
3. Counter operations internally require a read before write.
4. may not be 100% accurate as it is not an idempotent operation.
5. Not efficient always as the value may not be accurate.

1.Good way is to handle client/application side.
2.fetch value of columns(1-2) from table , take the average.
3. store the value in a new column(avg) in table.

Table/key optimizations
=======================

Key optimizations:
1. Using surrogate keys  : non-conflicting, artificial unique
2. Using natural keys

Table optimizations(ways to improve tables):

1. Split partition key(Size manageability):
	i. Split the partition key by adding one more existing column
	ii. Split partition key by adding an artificial column.
	iii. Split using an artificial bucket. Take more control using a bucket column.
2. Vertical Partitioning(Speed) - Splitting tables: Breaking a table into multiple tables.
	i. Faster query
	ii. Partitions get smaller as it is divided 
	iii. faster to retrieve as some of them can be cached.
	iv. Ensure orphan records are not lost and choose correct Partition key
3. Merging Tables and partitions(Speed and eliminate duplication) ( reverse of vertical partitioning):
	i. helps to eliminate duplication
	ii. may result in slower queries.
	Merging multiple partitions:
		i. Introduce new partition key and nest objects into new partitions.
		ii. partition key can be existing or artificial columns.
4. Adding columns to a table (Speed) : Alter command.	

DATA MODEL MIGRATION

1. PRIMARY KEY CHANGES:
	1.In the event where primary key has to be change , you must migrate to a new data model.
	but then you have to migrate your old data to that new table.
	2.Once complete we can either keep both tables and drop old table.
	3. Depends on use case.
	
2. CREATING NEW TABLES:
	i. COMMON TO KEEP THE CREATE Table statement in cql script.
	ii.Schema changes must propagate through the cluster.
	iii. On large clusters :
			i. Each create table causes race condition and nodes can become out of sync on schema changes.
	iv. Depending on cluster size and load each create table may take few seconds to complete.
	v. Be cautious as schema not in sync can causes havoc in cluster.
	
GUIDELINES:
1. EXECUTE ONE CREATE/DROP COMMAND AT A TIME.
2. ALLOW TIME TO PROPAGATE THROUGH THE CLUSTER.
3. VERIFY COMPLETION USING nodetool describecluster
4. THEN PERFORM NEXT CREATE/DROP

DSE Analytics uses apache spark . Distributed analytics over entire cluster.
You can use it to migrate data between tables. In ETL operations they are generally straightforward.

Simple ETL example:
When it involves only primary key change migrating data is straight forward.
you can use some transformations betweek cassandraTable() and saveToCassandra() functions.

sc.cassandraTable("keyspace_name","table_name").saveToCassandra("keyspace_name","new_table_name");

ETL's with LIVE data
===================
1. If you application is live then mutations can happen in base table during ETL after apache spark has read it.
This can lead to new data being missed in new tables.

Plan ahead
=========
1. Have your application update both old and new tables.
2. Perform ETL.
3. Validate data in both tables.
4. Switch your application to use the new table.
5. drop the old table.

Other ways to migrate data.
1. CQL
	i. COPY to export data to a csv file.
	ii.Transform that csv using external tool.
	iii.Use COPY to load new csv file.
	
2.Datastax drivers:
	i. drivers to pull data , transform and re-save it.
	
Why do you need a different primary key ?
1. Partitions too large.
2. Applications requirement change.

Drop the original table only when application is not dependent on them and proper analytics and 
validations is done.

DataModel Anti-Patterns
=======================

1. Query that causes full table scan. (Expensive) . Can cause node to be down.
2. Query having IN conditions.(Expensive). Can cause node to be down.
3. Query having "READ before WRITE" (Expensive) . 
4. Allow filtering is expensive. Instead create a table to support query.
5. However if we know only a single partition is being scanned then it is fine.

How to improve table?
===================== 
(Table level anti-patterns)

1. Use of more Secondary index is inefficient. We should use them rarely. If you need them excessively then better
create a separate table for it. As we know in cassandra we build table to support queries.
2. Use of non-frozen collections are performance hit. if we using collections, UDT where we nest another collections type
inside a UDT make sure we use 'FROZEN' keyword in table defination.
3. Use of time,timestamp and date to represent date instead of String.

(keyspace level anti-patterns)
1. Using TTL or deletes properly to handle deleted records and avoid tombstones to build up.
2. If you are facing read timeouts then instead of increasing the read-timeouts , you should optimize and walkthrough
your data model for improving performance. 
3. By increasing timeout we are basically masking the problem but really not solving them.

CASSANDRA SAMPLE COPY COMMAND USAGE FOR PRIMARY KEY SCHEMA CHANGE
================================================================
1. CREATE NEW TABLE VIDEOS_BKP WITH CHANGE IN PARTITION_KEY CONSTRAINT AND CLUSTERING COLUMN AS PER NEED.
2. EXTRACT DATA FROM ORIGINAL VIDEOS table to a .CSV FILE USING COPY TO.
3. COMPILE _BKP TABLE AND LOAD DATA FROM _BKP TABLE USING COPY FROM . SPECIFY COLUMN SEQUENCE EXACTLY SAME AS VIDEOS TABLE.
4. VALIDATE.

ORIGINAL VIDEOS TABLE:

CREATE TABLE killr_video.videos (
    video_id timeuuid PRIMARY KEY,
    avg_rating float,
    description text,
    encoding frozen<encoding_type>,
    genres set<text>,
    mpaa_rating text,
    preview_thumbnails map<int, blob>,
    release_date timestamp,
    tags set<text>,
    title text,
    type text,
    url text,
    user_id uuid

NEW VIDEOS_BKP TABLE

CREATE TABLE killr_video.videos_bkp (
 video_id timeuuid,
 avg_rating float,
 description text,
 encoding frozen<encoding_type>,
 genres set<text>,
 mpaa_rating text,
 preview_thumbnails map<int, blob>,
 release_date timestamp,
 tags set<text>,
 title text,
 type text,
 url text,
 user_id uuid,
 PRIMARY KEY((video_id,user_id),release_date))
 with clustering order by(release_date desc);
 

cqlsh:killr_video> COPY videos(VIDEO_ID,AVG_RATING,DESCRIPTION,ENCODING,GENRES,MPAA_RATING,PREVIEW_THUMBNAILS,RELEASE_DATE,TAGS,TITLE,TYPE,
               ... URL,USER_ID) TO '/home/ubuntu/VIDEOS_BKP.csv';
Using 1 child processes

Starting copy of killr_video.videos with columns [video_id, avg_rating, description, encoding, genres, mpaa_rating, preview_thumbnails, release_date, tags, title, type, url, user_id].
Processed: 20806 rows; Rate:     992 rows/s; Avg. rate:    2235 rows/s
20806 rows exported to 1 files in 9.312 seconds.
cqlsh:killr_video> 
cqlsh:killr_video> COPY videos_BKP(VIDEO_ID,AVG_RATING,DESCRIPTION,ENCODING,GENRES,MPAA_RATING,PREVIEW_THUMBNAILS,RELEASE_DATE,TAGS,TITLE,TYPE,
               ... URL,USER_ID) FROM '/home/ubuntu/VIDEOS_BKP.csv';
Using 1 child processes

Starting copy of killr_video.videos_bkp with columns [video_id, avg_rating, description, encoding, genres, mpaa_rating, preview_thumbnails, release_date, tags, title, type, url, user_id].
Processed: 20806 rows; Rate:     395 rows/s; Avg. rate:     748 rows/s
20806 rows imported from 1 files in 27.803 seconds (0 skipped).
cqlsh:killr_video> 

cqlsh:killr_video> select count(*) from videos;

 count
-------
 20806

(1 rows)

Warnings :
Aggregation query used without partition key

cqlsh:killr_video> select count(*) from videos_BKP;

 count
-------
 20806

(1 rows)

Warnings :
Aggregation query used without partition key

cqlsh:killr_video> select * from videos where video_id=8a1dee8f-0ef2-11e5-a7f3-8438355b7e3a;

 video_id                             | avg_rating | description | encoding                                                                                           | genres                                                                    | mpaa_rating | preview_thumbnails | release_date                    | tags | title                | type  | url  | user_id
--------------------------------------+------------+-------------+----------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------+-------------+--------------------+---------------------------------+------+----------------------+-------+------+--------------------------------------
 8a1dee8f-0ef2-11e5-a7f3-8438355b7e3a |       null |        null | {encoding: '1080p', height: 1080, width: 1920, bit_rates: {'3000 Kbps', '4500 Kbps', '6000 Kbps'}} | {'Action Film', 'Adventure Film', 'Horror', 'Mystery', 'Political drama'} |           R |               null | 2013-12-12 00:00:00.000000+0000 | null | Prisoners of the Sun | Movie | null | 63d97ca8-4630-4bad-805f-3bda997f3dcc


cqlsh:killr_video> select * from videos_bkp where video_id=8a1dee8f-0ef2-11e5-a7f3-8438355b7e3a and user_id=63d97ca8-4630-4bad-805f-3bda997f3dcc;

 video_id                             | user_id                              | release_date                    | avg_rating | description | encoding                                                                                           | genres                                                                    | mpaa_rating | preview_thumbnails | tags | title                | type  | url
--------------------------------------+--------------------------------------+---------------------------------+------------+-------------+----------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------+-------------+--------------------+------+----------------------+-------+------
 8a1dee8f-0ef2-11e5-a7f3-8438355b7e3a | 63d97ca8-4630-4bad-805f-3bda997f3dcc | 2013-12-12 00:00:00.000000+0000 |       null |        null | {encoding: '1080p', height: 1080, width: 1920, bit_rates: {'3000 Kbps', '4500 Kbps', '6000 Kbps'}} | {'Action Film', 'Adventure Film', 'Horror', 'Mystery', 'Political drama'} |           R |               null | null | Prisoners of the Sun | Movie | null

(1 rows)

