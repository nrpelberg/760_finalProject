CREATE DATABASE IF NOT EXISTS yelp;

SET GLOBAL local_infile = 1; 

use yelp;

CREATE TABLE review_notext
(
    rid int,
    review_id varchar(100),
    business_id varchar(100),
    user_id varchar(100),
    stars int,
    date date,
    userful_votes int,
    funny_votes int,
    cool_votes int
);

LOAD DATA LOCAL INFILE '/Users/noahpelberg/Desktop/school/masters/760/yelp_academic_dataset_review_notext.csv'
INTO TABLE yelp.review_notext
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
-- LINES TERMINATED BY '\r\n'
-- IGNORE 1 ROWS
(rid,review_id,business_id,user_id,stars,date,userful_votes,funny_votes,cool_votes);

# repeat the same for category table 

CREATE TABLE category
(
    cid int,
    business_id varchar(100),
    category_name varchar(100)
);


LOAD DATA LOCAL INFILE '/Users/noahpelberg/Desktop/school/masters/760/yelp_academic_dataset_category.csv'
INTO TABLE yelp.category
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
-- LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(cid, business_id, category_name);

-- project code
select c.business_id, category_name, date, stars
from yelp.category as c
left join yelp.review_notext as r
on c.business_id = r.business_id
where category_name like '%Coffee%';