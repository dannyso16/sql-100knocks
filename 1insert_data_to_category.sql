USE TESTDB;

/* 一度だけ実行が必要
CREATE MASTER KEY ENCRYPTION BY PASSWORD='input here';
*/

/*
SELECT * FROM customer;
--TRUNCATE TABLE customer;
*/
-- 外部ソースとCREDENTIALを削除
IF EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'MyAzureBlobStorage')
	DROP EXTERNAL DATA SOURCE MyAzureBlobStorage 

DROP DATABASE SCOPED CREDENTIAL credtest;

-- 外部ソースとCREDENTIALを作成
CREATE DATABASE SCOPED CREDENTIAL credtest
WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
SECRET = 'input token here'

CREATE EXTERNAL DATA SOURCE MyAzureBlobStorage
WITH ( TYPE = BLOB_STORAGE,
        LOCATION = 'https://コンテナ名.blob.core.windows.net', --コンテナ名
		CREDENTIAL = credtest
);


--参考：UTF-8=コードページ65001なので、次のように指定
-- \nでは上手くいかない
TRUNCATE TABLE category
BULK INSERT category
FROM 'コンテナ名/category.csv' 
WITH (
    DATA_SOURCE = 'MyAzureBlobStorage',
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	DATAFILETYPE='char',
	ROWTERMINATOR = '0x0a'
	,CODEPAGE = '65001'
);


