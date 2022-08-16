use testdb

-- customer
drop table if exists customer;
create table customer(
    customer_id            NVARCHAR(14),
    customer_name          NVARCHAR(20),
    gender_cd              NVARCHAR(1),
    gender                 NVARCHAR(2),
    birth_day              DATE,
    age                    INTEGER,
    postal_cd              NVARCHAR(8),
    address                NVARCHAR(128),
    application_store_cd   NVARCHAR(6),
    application_date       NVARCHAR(8),
    status_cd			         NVARCHAR(12),
    primary key (customer_id)
);

-- category
drop table if exists category;
create table category(
    category_major_cd     NVARCHAR(2),
    category_major_name   NVARCHAR(32),
    category_medium_cd    NVARCHAR(4),
    category_medium_name	NVARCHAR(32),
    category_small_cd	    NVARCHAR(6),
    category_small_name	  NVARCHAR(32),
    primary key (category_small_cd)
);


-- product
drop table if exists product;
create table product(
    product_cd            NVARCHAR(10),
    category_major_cd     NVARCHAR(2),
    category_medium_cd    NVARCHAR(4),
    category_small_cd	    NVARCHAR(6),
    unit_price            INTEGER,
    unit_cost             INTEGER,
    primary key (product_cd)
);

-- store
drop table if exists store;
create table store(
    store_cd      NVARCHAR(6),
    store_name    NVARCHAR(128),
    prefecture_cd NVARCHAR(2),
    prefecture    NVARCHAR(5),
    address       NVARCHAR(128),
    address_kana  NVARCHAR(128),
    tel_no        NVARCHAR(20),
    longitude     NUMERIC,
    latitude      NUMERIC,
    floor_area    NUMERIC,
    primary key (store_cd)
);

-- receipt
drop table if exists receipt;
create table receipt(
    sales_ymd       INTEGER,
    sales_epoch     INTEGER,
    store_cd        NVARCHAR(6),
    receipt_no      SMALLINT,
    receipt_sub_no  SMALLINT,
    customer_id     NVARCHAR(14),
    product_cd      NVARCHAR(10),
    quantity        INTEGER,
    amount          INTEGER,
    primary key (sales_ymd, store_cd, receipt_no, receipt_sub_no)
);

-- geocode
drop table if exists geocode;
create table geocode(
    postal_cd       NVARCHAR(8),
    prefecture      NVARCHAR(4),
    city            NVARCHAR(30),
    town            NVARCHAR(30),
    street          NVARCHAR(30),
    address         NVARCHAR(30),
    full_address    NVARCHAR(80),
    longitude       NUMERIC,
    latitude        NUMERIC
);