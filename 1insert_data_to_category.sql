USE TESTDB;

/* ��x�������s���K�v
CREATE MASTER KEY ENCRYPTION BY PASSWORD='input here';
*/

/*
SELECT * FROM customer;
--TRUNCATE TABLE customer;
*/
-- �O���\�[�X��CREDENTIAL���폜
IF EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'MyAzureBlobStorage')
	DROP EXTERNAL DATA SOURCE MyAzureBlobStorage 

DROP DATABASE SCOPED CREDENTIAL credtest;

-- �O���\�[�X��CREDENTIAL���쐬
CREATE DATABASE SCOPED CREDENTIAL credtest
WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
SECRET = 'input token here'

CREATE EXTERNAL DATA SOURCE MyAzureBlobStorage
WITH ( TYPE = BLOB_STORAGE,
        LOCATION = 'https://�R���e�i��.blob.core.windows.net', --�R���e�i��
		CREDENTIAL = credtest
);


--�Q�l�FUTF-8=�R�[�h�y�[�W65001�Ȃ̂ŁA���̂悤�Ɏw��
-- \n�ł͏�肭�����Ȃ�
TRUNCATE TABLE category
BULK INSERT category
FROM '�R���e�i��/category.csv' 
WITH (
    DATA_SOURCE = 'MyAzureBlobStorage',
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	DATAFILETYPE='char',
	ROWTERMINATOR = '0x0a'
	,CODEPAGE = '65001'
);


