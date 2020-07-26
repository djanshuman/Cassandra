CREATE KEYSPACE killrvideo WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1}

CREATE TABLE videos ( video_id timeuuid, added_date timestamp,  Title Text, PRIMARY KEY(video_id));

cqlsh:killrvideo> DESC videos;

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



INSERT INTO videos (video_id,added_date,Title) VALUES(1645ea59-14bd-11e5-a993-8138354b7e31,'2014-01-29','Cassandra History');

cqlsh:killrvideo> SELECT * FROM videos;

 video_id                             | added_date                      | title
--------------------------------------+---------------------------------+-------------------
 1645ea59-14bd-11e5-a993-8138354b7e31 | 2014-01-28 18:30:00.000000+0000 | Cassandra History



cqlsh:killrvideo> INSERT INTO videos (video_id,added_date,Title) VALUES(245e8024-14bd-11e5-9743-8238356b7e32,'2012-04-03','Cassandra & SSDs');
cqlsh:killrvideo> INSERT INTO videos (video_id,added_date,Title) VALUES(3452f7de-14bd-11e5-855e-8738355b7e3a,'2013-03-17','Cassandra Intro');
cqlsh:killrvideo> INSERT INTO videos (video_id,added_date,Title) VALUES(4845ed97-14bd-11e5-8a40-8338255b7e33,'2013-10-16','DataStax DevCenter');
cqlsh:killrvideo> INSERT INTO videos (video_id,added_date,Title) VALUES(5645f8bd-14bd-11e5-af1a-8638355b8e3a,'2013-04-16','What is DataStax Enterprise?');
cqlsh:killrvideo> SELECT * FROM videos;

 video_id                             | added_date                      | title
--------------------------------------+---------------------------------+------------------------------
 245e8024-14bd-11e5-9743-8238356b7e32 | 2012-04-02 18:30:00.000000+0000 |             Cassandra & SSDs
 3452f7de-14bd-11e5-855e-8738355b7e3a | 2013-03-16 18:30:00.000000+0000 |              Cassandra Intro
 5645f8bd-14bd-11e5-af1a-8638355b8e3a | 2013-04-15 18:30:00.000000+0000 | What is DataStax Enterprise?
 1645ea59-14bd-11e5-a993-8138354b7e31 | 2014-01-28 18:30:00.000000+0000 |            Cassandra History
 4845ed97-14bd-11e5-8a40-8338255b7e33 | 2013-10-15 18:30:00.000000+0000 |           DataStax DevCenter

(5 rows)

cqlsh:killrvideo> TRUNCATE VIDEOS;
cqlsh:killrvideo> SELECT * FROM videos;

 video_id | added_date | title
----------+------------+-------

(0 rows)

cqlsh:killrvideo> COPY VIDEOS(video_id,added_date,title) FROM '/Users/dibyajyoti/Desktop/dataset.csv' WITH HEADER =TRUE;
Using 3 child processes

Starting copy of killrvideo.videos with columns [video_id, added_date, title].
Processed: 4 rows; Rate:       5 rows/s; Avg. rate:       8 rows/s
4 rows imported from 1 files in 0.524 seconds (0 skipped).

cqlsh:killrvideo> SELECT * FROM videos;

 video_id                             | added_date                      | title
--------------------------------------+---------------------------------+------------------------------
 3452f7de-14bd-11e5-855e-8738355b7e3a | 2013-03-16 18:30:00.000000+0000 |              Cassandra Intro
 5645f8bd-14bd-11e5-af1a-8638355b8e3a | 2013-04-15 18:30:00.000000+0000 | What is DataStax Enterprise?
 1645ea59-14bd-11e5-a993-8138354b7e31 | 2014-01-28 18:30:00.000000+0000 |            Cassandra History
 4845ed97-14bd-11e5-8a40-8338255b7e33 | 2013-10-15 18:30:00.000000+0000 |           DataStax DevCenter

(4 rows)
cqlsh:killrvideo> select count(*) from videos;

 count
-------
     4

cqlsh:killrvideo> select * from videos limit 2;

 video_id                             | added_date                      | title
--------------------------------------+---------------------------------+------------------------------
 3452f7de-14bd-11e5-855e-8738355b7e3a | 2013-03-16 18:30:00.000000+0000 |              Cassandra Intro
 5645f8bd-14bd-11e5-af1a-8638355b8e3a | 2013-04-15 18:30:00.000000+0000 | What is DataStax Enterprise?
 
 
 cqlsh:killrvideo> desc killrvideo;

CREATE KEYSPACE killrvideo WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;


cqlsh:killrvideo> CREATE TABLE VIDEOS_BY_TAG(TAG TEXT,VIDEO_ID TIMEUUID,ADDED_DATE TIMESTAMP,TITLE TEXT,PRIMARY KEY((TAG),VIDEO_ID));

cqlsh:killrvideo> DESC VIDEOS_BY_TAG;

CREATE TABLE killrvideo.videos_by_tag (
    tag text,
    video_id timeuuid,
    added_date timestamp,
    title text,
    PRIMARY KEY (tag, video_id)
) WITH CLUSTERING ORDER BY (video_id ASC)
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

cqlsh:killrvideo> COPY VIDEOS_BY_TAG(TAG,VIDEO_ID,ADDED_DATE,TITLE) FROM '/Users/dibyajyoti/Downloads/ds201-6/labwork/data-files/videos-by-tag.csv' WITH HEADER='TRUE';
Using 3 child processes

Starting copy of killrvideo.videos_by_tag with columns [tag, video_id, added_date, title].
Processed: 5 rows; Rate:       6 rows/s; Avg. rate:      10 rows/s
5 rows imported from 1 files in 0.514 seconds (0 skipped).
cqlsh:killrvideo> SELECT * FROM VIDEOS_BY_TAG;

 tag       | video_id                             | added_date                      | title
-----------+--------------------------------------+---------------------------------+------------------------------
  datastax | 4845ed97-14bd-11e5-8a40-8338255b7e33 | 2013-10-16 05:30:00.000000+0000 |              DataStax Studio
  datastax | 5645f8bd-14bd-11e5-af1a-8638355b8e3a | 2013-04-16 05:30:00.000000+0000 | What is DataStax Enterprise?
 cassandra | 1645ea59-14bd-11e5-a993-8138354b7e31 | 2014-01-29 05:30:00.000000+0000 |            Cassandra History
 cassandra | 245e8024-14bd-11e5-9743-8238356b7e32 | 2012-04-03 05:30:00.000000+0000 |             Cassandra & SSDs
 cassandra | 3452f7de-14bd-11e5-855e-8738355b7e3a | 2013-03-17 05:30:00.000000+0000 |              Cassandra Intro

(5 rows)
cqlsh:killrvideo> select token(tag),video_id from videos_by_tag;

 system.token(tag)    | video_id
----------------------+--------------------------------------
 -1651127669401031945 | 4845ed97-14bd-11e5-8a40-8338255b7e33
 -1651127669401031945 | 5645f8bd-14bd-11e5-af1a-8638355b8e3a
   356242581507269238 | 1645ea59-14bd-11e5-a993-8138354b7e31
   356242581507269238 | 245e8024-14bd-11e5-9743-8238356b7e32
   356242581507269238 | 3452f7de-14bd-11e5-855e-8738355b7e3a

(5 rows)
cqlsh:killrvideo> select token(tag),token(video_id),video_id from videos_by_tag;

 system.token(tag)    | system.token(video_id) | video_id
----------------------+------------------------+--------------------------------------
 -1651127669401031945 |    7966101712501124149 | 4845ed97-14bd-11e5-8a40-8338255b7e33
 -1651127669401031945 |   -1613479371119279545 | 5645f8bd-14bd-11e5-af1a-8638355b8e3a
   356242581507269238 |    3855558958565172223 | 1645ea59-14bd-11e5-a993-8138354b7e31
   356242581507269238 |   -7805440677194688247 | 245e8024-14bd-11e5-9743-8238356b7e32
   356242581507269238 |   -1963973032031712291 | 3452f7de-14bd-11e5-855e-8738355b7e3a


cqlsh:killrvideo> select * from videos_by_tag where tag='cassandra';

 tag       | video_id                             | added_date                      | title
-----------+--------------------------------------+---------------------------------+-------------------
 cassandra | 1645ea59-14bd-11e5-a993-8138354b7e31 | 2014-01-29 05:30:00.000000+0000 | Cassandra History
 cassandra | 245e8024-14bd-11e5-9743-8238356b7e32 | 2012-04-03 05:30:00.000000+0000 |  Cassandra & SSDs
 cassandra | 3452f7de-14bd-11e5-855e-8738355b7e3a | 2013-03-17 05:30:00.000000+0000 |   Cassandra Intro

(3 rows)
cqlsh:killrvideo> select * from videos_by_tag where tag='datastax';

 tag      | video_id                             | added_date                      | title
----------+--------------------------------------+---------------------------------+------------------------------
 datastax | 4845ed97-14bd-11e5-8a40-8338255b7e33 | 2013-10-16 05:30:00.000000+0000 |              DataStax Studio
 datastax | 5645f8bd-14bd-11e5-af1a-8638355b8e3a | 2013-04-16 05:30:00.000000+0000 | What is DataStax Enterprise?

(2 rows)
cqlsh:killrvideo> select count(*),tag from videos_by_tag group by tag;

 count | tag
-------+-----------
     2 |  datastax
     3 | cassandra

(2 rows)

Warnings :
Aggregation query used without partition key

cqlsh:killrvideo> select * from videos_by_tag where tag='datastax';

 tag      | video_id                             | added_date                      | title
----------+--------------------------------------+---------------------------------+------------------------------
 datastax | 4845ed97-14bd-11e5-8a40-8338255b7e33 | 2013-10-16 05:30:00.000000+0000 |              DataStax Studio
 datastax | 5645f8bd-14bd-11e5-af1a-8638355b8e3a | 2013-04-16 05:30:00.000000+0000 | What is DataStax Enterprise?

(2 rows)


cqlsh:killrvideo> select * from videos_by_tag where title='DataStax Studio';
InvalidRequest: Error from server: code=2200 [Invalid query] message="Cannot execute this query as it might involve data filtering and thus may have unpredictable performance. If you want to execute this query despite the performance unpredictability, use ALLOW FILTERING"

Notes: The above query goes against apache cassandra concept as it should not filtering and
data retrieval on a non-partitioned key. This will lead to full table scan on all nodes and since it is distributed architecture
it leads to performance degradation as well as defeats the purpose of why cassandra should be used. On a high level Apache Cassandra data model 
uses Partioner concept of taking the p.k and generating a hash value. This hash value determines where the data will be located in the ring topology.
It is a constant time algo of O(1) . So anytime cassandra knows the hash will always be unique and data will located in the same place whenever it queries.
Hashing doesnt create any collision here. If collision occur for any key due to poor hash function then apache cassandra uses its own methods to eliminate it.
Just like in Data Structures we have open addressing, Linear/Quadratic probing.

Notes: Cassandra doesnt go by Uniqueness just like traditional rdbms, it can override the record for same primary key. 
That's where combination of Parition key + Clustering column comes to picture.
For example : Primary key ( (state),city,id,name ) 
						|__________________________|
			            All together makes up Primary Key 
Here state is partition key and goes to partitioner to generated unique hash value.
This combination creates a unique record and writes to a disk in a neat sorted order. So Clustering column (id,name,city)
orders the data while writing to disk in cassandra which is an optimization and data is grouped together and placed in ring.
So to maintain uniqueness all the columns must be specified to avoid data override. Not following this might lead to collision.

Querying clustering columns:
===========================

1. Partition key must be provided first in query later on clustering column can follow.
2. = , <> ,< >(range queries) can be executed on clustering columns. 
3. All equality comparison must come before inequality comparison.
4. Since data is sorted stored in disk it goes for binary search when range search is done
followed by linear read. As binary search follows divide by conquer approach and always works on sorted data therefore
the complexity is very much optimized to 0(logn).

The clustering column must be provided in same order in query as in data model. Just assume you are inside a partition box now and you will now go by
the clustering column sequence for retreiving your data or searching your data from peer to peer node.

Changing Default Ordering
=========================
1. By defualt Cassandra follows a Ascending order.
2. Use WITH CLUSTERING ORDER BY Clause to change the order to desc.
3. Include the column name in same sequence till the column for which u wish to provide desc. 

example: PRIMARY KEY (tag, video_id)

Filtering
=========
1. Never use Filtering on clustering columns only in cassandra. Its kind of disaster.
2. Always provide partition key and then use clustering columns for range search or 
filtering your records. If you use only clustering columns it can throw error/warnings
and will lead to scan all partitions in the data model. This relaxes the usage of partition key
and very bad to use. In small dataset you can try using but never recommended.




cqlsh:killrvideo> CREATE TABLE VIDEOS_BY_TAG(TAG TEXT, VIDEO_ID UUID,ADDED_DATE TIMESTAMP,TITLE TEXT ,PRIMARY KEY((TAG),ADDED_DATE,VIDEO_ID)) WITH CLUSTERING ORDER BY(ADDED_DATE DESC,VIDEO_ID ASC);
cqlsh:killrvideo> DESC videos_by_tag ;

CREATE TABLE killrvideo.videos_by_tag (
    tag text,
    added_date timestamp,
    video_id uuid,
    title text,
    PRIMARY KEY (tag, added_date, video_id)
) WITH CLUSTERING ORDER BY (added_date DESC, video_id ASC)
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


cqlsh:killrvideo> COPY videos_by_tag (tag,video_id,added_date,title) from '/Users/dibyajyoti/Desktop/videos-by-tag.csv' with header=true;
Using 3 child processes

Starting copy of killrvideo.videos_by_tag with columns [tag, video_id, added_date, title].
Processed: 5 rows; Rate:       5 rows/s; Avg. rate:       8 rows/s
5 rows imported from 1 files in 0.626 seconds (0 skipped).
cqlsh:killrvideo> select * from videos_by_tag ;

 tag       | added_date                      | video_id                             | title
-----------+---------------------------------+--------------------------------------+------------------------------
  datastax | 2013-10-16 05:30:00.000000+0000 | 4845ed97-14bd-11e5-8a40-8338255b7e33 |              DataStax Studio
  datastax | 2013-04-16 05:30:00.000000+0000 | 5645f8bd-14bd-11e5-af1a-8638355b8e3a | What is DataStax Enterprise?
 cassandra | 2014-01-29 05:30:00.000000+0000 | 1645ea59-14bd-11e5-a993-8138354b7e31 |            Cassandra History
 cassandra | 2013-03-17 05:30:00.000000+0000 | 3452f7de-14bd-11e5-855e-8738355b7e3a |              Cassandra Intro
 cassandra | 2012-04-03 05:30:00.000000+0000 | 245e8024-14bd-11e5-9743-8238356b7e32 |             Cassandra & SSDs

(5 rows)

Note: The result set is partitioned and grouped by Tag and each partition has added_date descending and video_id as ascending.
This is powerful as while inserting or writing to disk we are setting up our writes and makes quite fast retrieval of data where
latest data viewing first is the requirement. 

cqlsh:killrvideo> select * from videos_by_tag where tag='cassandra'  order by added_date asc;

 tag       | added_date                      | video_id                             | title
-----------+---------------------------------+--------------------------------------+-------------------
 cassandra | 2012-04-03 05:30:00.000000+0000 | 245e8024-14bd-11e5-9743-8238356b7e32 |  Cassandra & SSDs
 cassandra | 2013-03-17 05:30:00.000000+0000 | 3452f7de-14bd-11e5-855e-8738355b7e3a |   Cassandra Intro
 cassandra | 2014-01-29 05:30:00.000000+0000 | 1645ea59-14bd-11e5-a993-8138354b7e31 | Cassandra History

(3 rows)
cqlsh:killrvideo> select * from videos_by_tag where tag='cassandra'  order by added_date desc;

 tag       | added_date                      | video_id                             | title
-----------+---------------------------------+--------------------------------------+-------------------
 cassandra | 2014-01-29 05:30:00.000000+0000 | 1645ea59-14bd-11e5-a993-8138354b7e31 | Cassandra History
 cassandra | 2013-03-17 05:30:00.000000+0000 | 3452f7de-14bd-11e5-855e-8738355b7e3a |   Cassandra Intro
 cassandra | 2012-04-03 05:30:00.000000+0000 | 245e8024-14bd-11e5-9743-8238356b7e32 |  Cassandra & SSDs

(3 rows)
cqlsh:killrvideo> select * from videos_by_tag where tag='datastax'  order by added_date desc;

 tag      | added_date                      | video_id                             | title
----------+---------------------------------+--------------------------------------+------------------------------
 datastax | 2013-10-16 05:30:00.000000+0000 | 4845ed97-14bd-11e5-8a40-8338255b7e33 |              DataStax Studio
 datastax | 2013-04-16 05:30:00.000000+0000 | 5645f8bd-14bd-11e5-af1a-8638355b8e3a | What is DataStax Enterprise?

(2 rows)

cqlsh:killrvideo> select * from videos_by_tag where tag='cassandra' and added_date < '2013-01-01';

 tag       | added_date                      | video_id                             | title
-----------+---------------------------------+--------------------------------------+------------------
 cassandra | 2012-04-03 05:30:00.000000+0000 | 245e8024-14bd-11e5-9743-8238356b7e32 | Cassandra & SSDs

(1 rows)
cqlsh:killrvideo> select * from videos_by_tag where tag='cassandra' and added_date > '2013-01-01';

 tag       | added_date                      | video_id                             | title
-----------+---------------------------------+--------------------------------------+-------------------
 cassandra | 2014-01-29 05:30:00.000000+0000 | 1645ea59-14bd-11e5-a993-8138354b7e31 | Cassandra History
 cassandra | 2013-03-17 05:30:00.000000+0000 | 3452f7de-14bd-11e5-855e-8738355b7e3a |   Cassandra Intro

cqlsh:killrvideo> select * from videos_by_tag where tag='cassandra' and added_date > '2013-01-01' order by added_date asc;

 tag       | added_date                      | video_id                             | title
-----------+---------------------------------+--------------------------------------+-------------------
 cassandra | 2013-03-17 05:30:00.000000+0000 | 3452f7de-14bd-11e5-855e-8738355b7e3a |   Cassandra Intro
 cassandra | 2014-01-29 05:30:00.000000+0000 | 1645ea59-14bd-11e5-a993-8138354b7e31 | Cassandra History

(2 rows)

Driver
======
1. We can use drivers for connecting our application to cassandra.
Cassandra offers several API's in known programming lang.
2. The topology and concept under the hood remains same. 

i. We create a cluster object.
2. Use cluster object to create a session.
3. Then session object to execute queries and return results.


NODE
====


Dibyajyotis-MacBook-Air:dse-6.8.1 dibyajyoti$ bin/nodetool status
Datacenter: Cassandra
=====================
Status=Up/Down
|/ State=Normal/Leaving/Joining/Moving/Stopped
--  Address    Load       Owns (effective)  Host ID                               Token                                    Rack
UN  127.0.0.1  11.76 MiB  100.0%            fe7c7f03-74fb-4a0c-8ff1-8d0feccd2f53  6042004495265077727                      rack1

Dibyajyotis-MacBook-Air:dse-6.8.1 dibyajyoti$ bin/nodetool info
ID                     : fe7c7f03-74fb-4a0c-8ff1-8d0feccd2f53
Gossip active          : true
Native Transport active: true
Status                 : OK
Load                   : 11.76 MiB
Generation No          : 1595386338
Uptime (seconds)       : 947
Heap Memory (MB)       : 667.00 / 2048.00
Off Heap Memory (MB)   : 0.08
Data Center            : Cassandra
Rack                   : rack1
Exceptions             : 0
Key Cache              : entries 0, size 0 bytes, capacity 100 MiB, 0 hits, 0 requests, NaN recent hit rate, 14400 save period in seconds
Row Cache              : entries 0, size 0 bytes, capacity 0 bytes, 0 hits, 0 requests, NaN recent hit rate, 0 save period in seconds
Counter Cache          : entries 0, size 0 bytes, capacity 50 MiB, 0 hits, 0 requests, NaN recent hit rate, 7200 save period in seconds
Chunk Cache            : entries 215, size 928 KiB, capacity 1.43 GiB, 215 misses, 3720 requests, 0.942 recent hit rate, 1140.931 microseconds miss latency
Percent Repaired       : NaN%
Token                  : 6042004495265077727


NODE
====
Node is the main part of cassandra distributed system. A ring consist of many nodes and each node is responsible for storing its piece of data.
Usually a single node can store 2-4 TB's of data with writes upto 6000-12000 transactions/second/core.

When a client sends a data to ring. It can send to any node in ring. Any node can act as a co-ordinator
and receives the data. The co-ordinator finds out the range of data or value each node in ring is storing using some kind of topology awareness.
The co-ordinator sends the data to that particular node.

The partitioner hashes it at first  finds the hash value. The partitioner is responsible for efficientyl distributing the data across
the ring. Any uneven distribution can lead to collision. Default partitioner is murmur3 and md5.

One of the secrets to Apache Cassandra performance is the use of a ring that keeps track of tokens. This ring enables Apache Cassandra™ to know exactly which nodes contain which partitions. The ring also eliminates any single points of failure.

Node joins a cluster
====================
Nodes joins cluster by communicating any nodes. These nodes are basically seed nodes which list
is present in cassandra.yml and apache cassandra finds the details when read the .yml file.
Once new node joins the ring and seeds nodes communicate the cluster topology
they start streaming the data to new node. Once it is fully available it is present for read
request. 4 states : Joining->leaving-> up->down

The driver used is uses below policy to fetch information without using the co-ordinator node:
1. Token aware policy - Driver chooses which node contains data.
2. RoundRobin policy -driver round robins the ring.
3. DCAwareRoundRobin Policy - driver round robins the target datacenter.


Peer-to-Peer Architecture
=========================

Apache Cassandra doesn't follow Leader Follower concept in which a leader has many subsequent followers
which are basically replicas set up at certain lag.
If we segregate our make division to create separate shards of date like customer data, business data
in that case we will have many leaders and replicas and custom logic to decide where to put in
the data when client sends data. And if any of those leaders gone down then failover for electing new 
leaders can take minutes or hours. 
Cassandra is designed to put you always online eventually and consistency of followers and leader has to be maintained always.
So Instead of leader-follower Architecture, cassandra has a Ring structure of peer-to-peer topology. Here no one
is leader or follower. We have one co-ordinator who receives the data from client and
pass on those data to correct replicas/node based on token value using token aware policy.
Even if the ring is partitioned/full network partition still then most of the nodes will always be online and visible to client. They will serve the read/write requests.
and data can be sent to correct set of replicas.

token-range assignment.

nodes
======
IMAGE A RING A-B-C-D-E-F
TOKEN 1 IS ASSIGNED AS NODE 1 (A)
TOKEN2 IS ASSINGNED AS NODE 2 (B)
TOKEN 3 IS ASSIGNED AS NODE 3 (C)

EACH NODE CONTAIN REPLICAS AS WELL SO:
NODE1 : A [B,C]
NODE2:  B [ C,A]
NODE3 : C [A,B]

In Vnodes concept: each node is a distribution of partition ranges not one token
1 node= Many small distributed partition ranges.
for example in a ring 	a-b-c-d-e-f
node 1-> a,d,e,c,d
node2-f,a,e,b
node3->c,b,a,e,f


1 token value= 1node= each node will have Parent data + neighbours replicas
 
In older cassandra version each nodes were assinged a single token value which determines the position
of node in the ring of cluster and each node stores a particular range of data as per the token range calculation
and assingment. The issue was arising when nodes decomm/addition happened that might cause
cluster in balancing as a particular node might contain twice the partitions of data
as compared to other nodes in ring and as a new node gets added that node starts
streaming the additional partitions to new node but the original node from which streaming
is happening(source one) gets pressurised a bit.
To avoid such situation now Cassandra has virtual nodes concept where each

* VNODES is configured by any num_tokens parameter in cassandra.yml file
any number >1 is vnodes. It is recommended to use 8 VNODES for good performance by datastax



GOSSIP Protocol
===============
In a fully distributed system there is no single repository where cassandra stores the data
or state of all nodes and such repo would be single point of failure. Therefore Apache cassandra
uses gossip protocol to distribute node's status amongst its peers.

THE Gossip protocol gossips cluster metadata and cluster current state
in the ring through the nodes. In every second the gossip happens. Usually each node gossips with 1-3 nodes
based on certain parameters. It mostly favours seed nodes or down nodes.
Each Node maintains a Cluster metadata of below form:

ENDPOINT STATE
|_________HEARTBEAT STATE:
|				|________GENERATION=5
|				|________VERSION=22
|
|_________APPLICATION STATE:
				|_________STATUS=NORMAL
				|_________DC=WEST
				|_________SCHEMA=22**WAE
				|_________RACK=RACK1
				|_________LOAD=100		
				|_________SEVERITY
				

example:				
node1-----------------------------node2
EP:127.0.0.1					EP:127.0.0.1
HB:100:20      					HB:100:15
LOAD:80							LOAD:80

EP:127.0.0.2					EP:127.0.0.2
HP:140:40						HP:140:40
LOAD:55							LOAD:55

EP:127.0.0.3					EP:127.0.0.3
HP: 120:33						HP: 120:25
LOAD:60							LOAD:60


Here Node1 sends the SYN message to node2. Each Syn message contains a digestive message for node2.
Each digest message is of the form EP:HB:VERSION . 

Sample SYN message:
127.0.0.1:100:20
127.0.0.2:140:40
127.0.0.3:120:33

Flow: INITIATOR(NODE1) -> SYN MSG ->  RECEIVER (NODE2)
      COMPARISION HAPPENS FOR ALL 3 NODES IF UPDATE REQUIRES NODE 2 SENDS ACK MESSAGE TO NODE1
      ACK1 MSG-> NODE2(SENDER)-   127.0.0.1:100:20  --> NODE1 (RECEIVER)
			                      127.0.0.2:140:40
			                      
	  ACK2 MSG -> NODE1(SENDER)-  127.0.0.1:100:20  --> NODE2 (RECEIVER)
			                      127.0.0.2:140:40
      UPDATE COMPLETES FOR NODE2 AND NOW BOTH ARE IN SYNC.
      
example:				
node1-----------------------------node2
EP:127.0.0.1					EP:127.0.0.1
HB:100:20      					HB:100:20
LOAD:80							LOAD:80

EP:127.0.0.2					EP:127.0.0.2
HP:140:40						HP:140:40
LOAD:55							LOAD:55

EP:127.0.0.3					EP:127.0.0.3
HP: 120:33						HP: 120:33
LOAD:60							LOAD:60 			                      
			                    
The SYN message is transported from initiator node1 to node2. The Node receives the message and start comparing EP wise if it has
upto-date data or stale data. Here EP1 (127.0.0.1) has version 15 for HB 100 as compared to 20
from sender which means it lacks the updated data after version 15 and needs them to update the state.
Similar for EP3 where 25 < 33. EP2 seems to be in sync.
So node 2 sends a ACK message to NODE1 with the two digest message for which it require update record.
NODE1 sends a ACK2 with the updated record and two EP's only.
node2 receives the ACK2 and updates the state to be in sync. This way both node maintains the current
state of cluster and eventually get in sync.

Dibyajyotis-MacBook-Air:dse-6.8.1 dibyajyoti$ bin/nodetool gossipinfo
localhost/127.0.0.1
  generation:1595617424
  heartbeat:4101
  STATUS:23:NORMAL,6042004495265077727
  LOAD:4061:1.2226534E7
  SCHEMA:19:b8623325-3ad7-3cc4-8c8a-e57745a3fcd0
  DC:14:Cassandra
  RACK:17:rack1
  RELEASE_VERSION:4:4.0.0.681
  NATIVE_TRANSPORT_ADDRESS:3:127.0.0.1
  DSE_GOSSIP_STATE:3446:{"dse_version":"6.8.1","graph":false,"workloads":"Cassandra","server_id":"60-30-D4-5E-B2-06","workload":"Cassandra","active":"true","health":0.9}
  NET_VERSION:1:1024
  HOST_ID:2:fe7c7f03-74fb-4a0c-8ff1-8d0feccd2f53
  NATIVE_TRANSPORT_READY:44:true
  NATIVE_TRANSPORT_PORT:7:9042
  NATIVE_TRANSPORT_PORT_SSL:8:9042
  STORAGE_PORT:9:7000
  STORAGE_PORT_SSL:10:7001
  JMX_PORT:11:7199
  SCHEMA_COMPATIBILITY_VERSION:5:2
  TOKENS:22:<hidden>

System table that stores some data about peers and result of above gossipinfo output.
cqlsh:killrvideo> desc system.peers;

CREATE TABLE system.peers (
    peer inet PRIMARY KEY,
    data_center text,
    dse_version text,
    graph boolean,
    host_id uuid,
    jmx_port int,
    native_transport_address inet,
    native_transport_port int,
    native_transport_port_ssl int,
    preferred_ip inet,
    rack text,
    release_version text,
    rpc_address inet,
    schema_version uuid,
    server_id text,
    storage_port int,
    storage_port_ssl int,
    tokens set<text>,
    workload text,
    workloads frozen<set<text>>
) WITH additional_write_policy = '99PERCENTILE'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = 'information about known peers in the cluster'
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND gc_grace_seconds = 0
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 3600000
    AND min_index_interval = 128
    AND nodesync = {'enabled': 'true', 'incremental': 'true'}
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99PERCENTILE';

REPLICATION
===========

In Cassandra we can have replication factor 1,2,3 or more. The ideal one is 3 .
1 is risky as nodes tends to be down in this practical world. 2 is okay but again there can be attacks
where both nodes can be down at same moment of a ring. 3 being less prone can be a good factor to be considered
for replicating data in ring.

In cassandra whenever the co-ordinator node gets a data with a hashed value, it determines which node
that data should go based on the hash value. As we know their is partioner range concept and each node is responsible for storing
range of partitions of data instead of just a single token. So the co-ordinator using the topology
sends the data to correct data as well as to neighbouring/other nodes in ring where the replica should be
stored. Similarly in case of node being down the read and write request are served by the co-ordinator
in same way as it re-directs the reques to other nodes holding replicas. 

While creating schema we can configure the replication for example:

CREATE KEYSPACE killrvideo WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE KEYSPACE Killrvideo WITH replication = {'class': 'NetworkTopologyStrategy','dc-west':2,'dc-east':3}
Above statement means 2:3 replica in each data center.

CREATE KEYSPACE Killrvideo WITH replication = {'class': 'NetworkTopologyStrategy','dc-west':1,'dc-east':1}
Above statement means 1 replica in each data center.

We can have multi-dc replication. Let us take an example we have configured our Snitch and rack properties
yaml file to have data written to two DC (dc-east,dc-west).
Consider, RF=2

DC-EAST
1. Client sends data to co-ordinator, it replicates data to two nodes in ring asynchronously.
2. Now it founds the network topology that there is multi-dc replication.

DC-WEST
1. DC EAST co-ordinator now sends the data request to DC-west co-ordinator asynchronously 
and DC-WEST co-ordinator writes to two more nodes in ring as replicas.

so overall we have now 4 replicas in total considering two DC's . That's power of Cassandra.

	
CONSISTENCY
==========

In Cap theorem we have CONSISTENCY+AVAILABILITY+PARTITION_TOLERANCE.
CASSANDRA is the overlapping portion between Availability+P.T

Toughest thing in distributed system is to maintain consistency. You have to have some kind of
formula for it. Maintaining consistent replicas requires balancing between availability and 
partition. Fortunately In Apache Cassandra we have tunable consistency i.e We tune the consistency level as per our need.
In each read/write request we have the Consistency level (CL) settings which ensures what we are
looking for and tradeoffs for our distributed system.

Strong replication with consistency is what Cassandra was built for. 

1.STRONG CONSISTENCY{WRITE CL:ALL, READ CL:ONE}: The data i wrote in the data i read out. Since we wrote in all nodes/replicas
by having CL:ALL. We know all data is written to all nodes as we have received ack from all.
Now on reading data we can loosen a bit and can read from ONE only as all nodes have update data
and no stale records are present.
	
	
But above way is never recommended and not for production scenario. It will slow down as
client have to wait to get ack from all replicas/nodes before it proceeds . Also here
we are going straight for Consistency ,wheras Availability and partition tolerance in  CAP theorem
are comprosed. 

2. QUOROM{51% , WRITE CL: QUORUM, READ CL : QUORUM}:
This is the best scenario in a distributed system when system is always online , consitency level
is maintained and we are not sacrificing Availability and partition tolerance here.

In  Quoram when client writes data , the writes happen to 51% of the node. That means we know that
atleast 50% have our data written and ack are fast . In read quorum again we just get ack from 51%
and it's fast. No tradeoffs between other parameters in cap theorem.

3. ONE { READ CL:ONE , WRITE CL : ONE}:
This is super-fast and based on the scenario to be used. Here we can deal with bit latency of
2-3 ms delay . When we write data we just expect a single node to ack the request and
similar to read. But as we know after the data is written to nodes, they replicate internally
using protocol(may be gossip etc) and eventually maintains a consistent state.
This is important in case of dumping logs,time-series data etc when just client needs to
write and proceed.	
			
There are lot of quorum settings in cassandra and most of them are not used too. Only the
useful ones are referred in production and test cluster setups. 

Consistency settings(Weak -> Strongest)

1. Any	: This is the most useless one. Its like you expect atleast one to ack but cant 
guarantee.
2.One,two,three: Check closest nodes to co-ordinator. 
3.Quorum: Majority vote ( (sum_of_rep_factor/2) +1)
4.local_one: In same datacenter ,closest one to the co-ordinator
5.local_quorum : In same datacenter the 51% majority.Closest quorum nodes to co-ordinator.
6.Each_quorum: quorum of nodes in each datacenter,applies to writes only.
7.ALL: Every node must participate.

Note:
All (Most consistency you can get ever) is the slowest and sacrifices availability. The uptime is sacrificed here as you can't maintain
the systems to be always online when waiting to receive ack from each nodes.
Each Quorum: Most heavy here each DC has to have a quorum and then ack too.

Most used: One, Quorum, Local_Quorum

Cassandra is built on two things Consistency and Replication. Now you can just
replicate data to every other nodes but what about consistency , you must know where your data resides as an developer.
So you have to think of what consistency level should you tune up for the Scenario/project.
There are tradeoffs and developer have to take a call what to pick in practice.

Low_latency+Some stale data= One
consistency+uptime=Quorum


HINTED HANDOFF
==============

Hinted Handoff keeps cassandra write-data consistent. In Hinted-handoff the co-ordinator
node stores hints and data for the replica nodes if some of them are down and stream the data
to that node when it comes alive. Suppose the parition key is having
replica at Node1-2-3 and Node 3 and 2 is down.
The write request is written to Node 1 and Co-ordinator stores the Hints and data upto 3 hours
before it is wiped. Within 3 hours if the nodes are back online then data is sent to Node 3 and 2
successfully.
In cassandra.yml file we can change the location, hints configuration, hours to retain etc.

Consistency level One or Two will serve write/read request even if third node is down
but if consistency level is three then it will give mutation error.
Consistency level Any should not be used because it will gives success to client
but if the co-ordinator itself dies then data is lost. And if the nodes doesnt come back online
still the data is wiped after 3 hours. So Any level should be avoided.
cqlsh:killrvideo> select * from videos_by_tag where tag='datastax';
InvalidRequest: Error from server: code=2200 [Invalid query] message="ANY ConsistencyLevel is only supported for writes"

READ REPAIR
===========

In cassandra we have tradeoff between Consistency vs ( availability and Partition tolerance)
Its upto us to decide what we want complete consistent data or some kind of stale data + 100%
available distributed system.

Read Repair scenario I:

Here we have CL=ALL , so below is the high level steps:
1. Client sends a read request to co-ordinator. Co-ordinator force the request to all the read replicas.
The most responsive replica responds with data to co-ord wheareas due to optimisation 
co-ord doesnt require actual data from rest 2 nodes infact it only requires the check-sum from them.
2. The co-odinator now has the data and two check sum received from other replicas.
It runs the checksum on the data and validates. On successfull validation
it sends the data request to client.

Scenario II (checksum doesn't match'):
1. Co-ordinator receives the data and checksum value from two nodes but on running
the checksum on data founds few replicas has stale data and not correct.
2. We have cell in data which stores the timestamp.
3. So co-ordinator request the timestamp data from each nodes and then compares which has the update
records with latest timestamp.
4. The co-ordinator discards out of sync data and forces copy of update data which it receives
to all out of date nodes to ensure sync and consistency.
5. At the same time sends the read request data to client asynchronously which means
eventually all nodes get into sync.

Read repair chance: 
1.If consistency level is less then ALL then read repair chance is also executed in the background
which means client might receive some stale data for a moment but asynchronously read repair is run
and eventually all nodes become in-sync.
2. The read repair chance is set to 10% probablistically in dc_local_read_repair
which is confined to same DC as the co-ordinator node.
3.read_repair_chance is 0 by default for read repairs across all datacenters with replicas.

Nodetool repair:
1. The last line of defence as it can put down the entire cluster to repair all out of sync nodes.
2. Even nodes which are not read are now benefitted to get updated records.
3. Expensive as amount of data grows. 


NODESYNC
========

Full repair of nodes bog down the system. It's running time again depends on growth or table size.
The larger the dataset the more time it takes to complete. Even the system is not accessible that time
due to larger network load and repair.
If we are running full repair then it is recommended to run it with gc_grace_seconds to prevent
zombie data.

1.NODESYNC is a features in datastax where it is continuosly running in background to validate
and repair outdated nodes. 
2.Nodesync is enabled by default.
3.Node default is disabled for table level. Nodesync can be enabled table level using setting nodesync property to true during table creation.
4.Each node has local token range.
The token range are recursively split to find a good segment range where
each segment is expected to have 200mb of size. If a partition itself is of 200mb size
then it is treated as a segment. So the segment are repaired in groups
and nodesync saves the status of segment in a table called nodesync_status table.
The nodesync saves the status in a datastructure called savepoint.

Overall the nodesync ensures that the segments with nodes all are repaired to ensure all replicas are in sync.

Segment Outcomes:
1.full_in_sync: All replicas were in sync.
2.full_repaired: All replica responded and some repair were necessary.
3.partial_in_sync: Not all replica responded(atleast 2 did) and they were already in sync.
4.partial_repaired:Not all replica responded(atleast 2 did) and some repair was necessary.
5.uncompleted : Only 1 replica was available so no syncing was possible.
6.failed: unexpected error,check logs.

Nodesync validation:
It uses the same read-pair methodology to validates the syncup.
1. Fetch the data and timestamp/checksum from nodes.
2. Run checksum on data and check for any stale out dated timestamp.
3. Update the earliest timestamp node with latest timestamp.
4. Validates all nodes are in sync now with latest timestamp.

WRITE PATH
==========

Apache cassandra maintains two data structures Memtable in RAM and CommitLog in HDD.

1. Client send the write request to co-ordinator the co-oridiantor
writes the data to memtable based on order of clustering column and partition key
2. Co-oridnator writes the data to commit log as is in sequence whichever arrived by 
just appending to commit log.

3. In below example there are 3 write requests that arrived in sequence one after the other.
Cassandra node wrote data to Both Datastructures but ordered at each insertion as per the
clustering column city. Here D < H <S . Whereas commit log it is inserted just in sequence.

4. Purpose:Since the Memtable is in memory apache cassandra can simply do the lookup and return the result 
back to client just like we do in our CQL statement.
Whenever the node goes down the commit log is replayed to read the entire mutation
and node is ready then to serve the request.

________________________________________
|RAM									|		
|	 MEMTABLE							|
|			 4 Igot Your Data TX Austin	|				
|			 2 ComeTo Dse  	  TX Dallas	|
|			 1 Dev Awesome 	  TX Houston|
|			 3 Lone Node   	  TX Snyder	|					
|										|					
|										|					
|_______________________________________|

--->1 Dev Awesome TX Houston
--->2 ComeTo Dse  TX Dallas
--->3 Lone Node   TX Snyder
--->4 Igot Your Data TX Austin

_________________________________________
|HDD								   	|
|	COMMIT LOG							|
|			1 Dev Awesome    TX Houston	|
|			2 ComeTo Dse     TX Dallas	|
|			3 Lone Node   	 TX Snyder	|
|   		4 Igot Your Data TX Austin  |
|_______________________________________|

5. These are all Highlevel implementations and it might seems that apache cassandra does 
writes here and there but Internally it maintains pointers and references to have all these
state and table. 
6. Now the Memtable can store certain memory and can become full. There are parameters where
you can provide how much Memtable can store. When memtable becomes full apache cassandra needs
to get that out of RAM and flush into HDD.
7. Cassandra flushes into HDD and now Memtable is known as SS(Sorted string) table (Immutable).
The data in this table are first sorted by partition key and then by clustering columns.
As soon as apache cassandra writes the memtable to HDD as SS table , it wont allow any
mutation,insert,update,delete etc . The data and rows are as is flushed from RAM.

8. We dont require the commit log now and it wipes the commit log as the SS table is present now.
9. Now how do we do the write/insert/update delete as it is immutable. So for that concern
apache cassandra always recommend to have separate HDD to store the SS table in case concurrent
request and handled in background. The flushing of Memtable repeats as it happended earlier
and now we have two data sets and two SStable in HDD. Both together forms the entire dataset.

________________________________________________________________________
|HDD								   									|
|	SS table1  								SS table2					|
|			1 Dev Awesome    TX Houston		5 Data Rowman TX Austin		|
|			2 ComeTo Dse     TX Dallas		7 Prepar Query TX Austin	|
|			3 Lone Node   	 TX Snyder		6 Cluster Rows TX Dallas	|
|   		4 Igot Your Data TX Austin 	 	10 Learnin Model TX Housten	|						
|											9 Bytes lover TX Housten    |
|_______________________________________________________________________|					

Ideally: Cassandra recommends below architecture where the HDD1 is the separate hard disk
memory storing the immutable SS tables and they are our permenent data sets.
The HDD holds only the temporary commit log always. Once SS table is flushed to HDD1. The Commit
log wipes up.

____________________
|RAM				|	
|	 MEMTABLE		|
|	 -------		|				
|	 -------		| 
|	 -------		|
|			 		|
|					|					
|					|					
|___________________|

---> ----
---> ----
---> ----
________________
|HDD			|		
|	COMMIT LOG	|				
|	------	   	|
|	------		|	
|	------		|	
|   		 	|		
|_______________|
_________________________________________ 	________________________________
|HDD1								   	 |  | 						        |
|	SS table1 						     | 	|	SS table2					|
|			1 Dev Awesome    TX Houston	 | 	|	5 Data Rowman TX Austin		|
|			2 ComeTo Dse     TX Dallas	 |+ |	7 Prepar Query TX Austin	| = Our entire Dataset and read request is done on this dataset.
|			3 Lone Node   	 TX Snyder	 | 	|	6 Cluster Rows TX Dallas	|
|   		4 Igot Your Data TX Austin 	 | 	|	10 Learnin Model TX Housten	|						
|										 | 	|	9 Bytes lover TX Housten    |
|________________________________________| 	| ______________________________|	




