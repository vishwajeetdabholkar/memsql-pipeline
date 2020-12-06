create table t2 (names varchar(10), id INT);
select * from t2
CREATE OR REPLACE PIPELINE `parquet_test_pipeline`
 AS LOAD DATA S3 's3://mybucket/sample.parquet'
CONFIG '{"region": "us-east-1"}'
CREDENTIALS '{"aws_access_key_id": "your_id", "aws_secret_access_key": "your_key"}'
 SKIP DUPLICATE KEY ERRORS
 INTO TABLE t2
 (names <- names,
id <- id)
 FORMAT PARQUET ;

TEST PIPELINE parquet_test_pipeline limit 1

START PIPELINE parquet_test_pipeline
