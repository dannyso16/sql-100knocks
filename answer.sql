﻿USE testdb;

/*
S-001: レシート明細データ（receipt）から全項目の先頭10件を表示し、
どのようなデータを保有しているか目視で確認せよ。
*/
SELECT TOP 10 * FROM receipt WITH(NOLOCK)


/* 
> S-002: レシート明細データ（receipt）から売上年月日（sales_ymd）、顧客ID（customer_id）、
	商品コード（product_cd）、売上金額（amount）の順に列を指定し、10件表示せよ。*/
SELECT TOP 10 sales_ymd
	, customer_id
	, product_cd
	, amount
FROM receipt WITH(NOLOCK)


/* > S-003: レシート明細データ（receipt）から売上年月日（sales_ymd）、顧客ID（customer_id）、
	商品コード（product_cd）、売上金額（amount）の順に列を指定し、10件表示せよ。
	ただし、sales_ymdsales_dateに項目名を変更しながら抽出すること。 */

SELECT sales_ymd AS sales_date
	,customer_id
	,product_cd
	,amount
	FROM receipt WITH(NOLOCK)


/*> S-004: レシート明細データ（receipt）から売上日（sales_ymd）、顧客ID（customer_id）、
	商品コード（product_cd）、売上金額（amount）の順に列を指定し、以下の条件を満たすデータを抽出せよ。
> - 顧客ID（customer_id）が"CS018205000001"*/

SELECT sales_ymd
	,customer_id
	,product_cd
	,amount
	FROM receipt WITH(NOLOCK)
	WHERE customer_id = 'CS018205000001'


/*> S-005: レシート明細データ（receipt）から売上日（sales_ymd）、顧客ID（customer_id）、
商品コード（product_cd）、売上金額（amount）の順に列を指定し、以下の全ての条件を満たすデータを抽出せよ。
> - 顧客ID（customer_id）が"CS018205000001"
> - 売上金額（amount）が1,000以上*/

SELECT sales_ymd
	,customer_id
	,product_cd
	,amount
FROM receipt WITH(NOLOCK)
WHERE customer_id = 'CS018205000001'
	AND amount >=  1000

/*> S-006: レシート明細データ（receipt）から売上日（sales_ymd）、顧客ID（customer_id）、
	商品コード（product_cd）、売上数量（quantity）、売上金額（amount）の順に列を指定し、
	以下の全ての条件を満たすデータを抽出せよ。
> - 顧客ID（customer_id）が"CS018205000001"
> - 売上金額（amount）が1,000以上または売上数量（quantity）が5以上*/

SELECT sales_ymd
	,customer_id
	,product_cd
	,amount
	,quantity
FROM receipt WITH(NOLOCK)
WHERE customer_id = 'CS018205000001'
	AND (amount >=  1000 OR quantity >= 5)

/*> S-007: レシート明細データ（receipt）から売上日（sales_ymd）、顧客ID（customer_id）、
	商品コード（product_cd）、売上金額（amount）の順に列を指定し、以下の全ての条件を満たすデータを抽出せよ。
> - 顧客ID（customer_id）が"CS018205000001"
> - 売上金額（amount）が1,000以上2,000以下*/

SELECT sales_ymd
	,customer_id
	,product_cd
	,amount
FROM receipt WITH(NOLOCK)
WHERE customer_id = 'CS018205000001'
	AND amount BETWEEN 1000 AND 2000


/*
> S-008: レシート明細データ（receipt）から売上日（sales_ymd）、
	顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、
	以下の全ての条件を満たすデータを抽出せよ。
> - 顧客ID（customer_id）が"CS018205000001"
> - 商品コード（product_cd）が"P071401019"以外
*/
SELECT sales_ymd
	,customer_id
	,product_cd
	,amount
	,quantity
FROM receipt WITH(NOLOCK)
WHERE customer_id = 'CS018205000001'
	AND product_cd <> 'P071401019'

/*
> S-009: 以下の処理において、出力結果を変えずにORをANDに書き換えよ。
>
> `SELECT * FROM store WHERE NOT (prefecture_cd = '13' OR floor_area > 900)`
*/

SELECT * FROM store WHERE NOT (prefecture_cd = '13' OR floor_area > 900)
UNION  
SELECT * FROM store WHERE prefecture_cd <> '13' AND floor_area <= 900


/*
> S-010: 店舗データ（store）から、店舗コード（store_cd）が"S14"で始まるものだけ全項目抽出し、10件表示せよ。
*/
SELECT TOP 10 * 
FROM store WITH(NOLOCK)
WHERE LEFT(store_cd, 3) = 'S14'


/*
> S-011: 顧客データ（customer）から顧客ID（customer_id）の末尾が1のものだけ全項目抽出し、10件表示せよ。
*/
SELECT TOP 10 * FROM customer WITH(NOLOCK)
WHERE RIGHT(customer_id, 1) = '1'

/*
> S-012: 店舗データ（store）から、住所 (address) に"横浜市"が含まれるものだけ全項目表示せよ。
TODO 上手く動かない
*/
SELECT * FROM store WITH(NOLOCK)
WHERE address LIKE '%横浜市%'


/*
> S-013: 顧客データ（customer）から、
ステータスコード（status_cd）の先頭がアルファベットのA〜Fで始まるデータを全項目抽出し、10件表示せよ。
*/
SELECT TOP 10 * FROM customer WITH(NOLOCK)
WHERE status_cd LIKE '[A-F]%'

SELECT TOP 10 * FROM customer WITH(NOLOCK)
WHERE LEFT(status_cd, 1) IN ('A', 'B', 'C', 'D', 'E', 'F')

/*
> S-014: 顧客データ（customer）から、
ステータスコード（status_cd）の末尾が数字の1〜9で終わるデータを全項目抽出し、10件表示せよ。
*/

SELECT TOP 10 * FROM customer WITH(NOLOCK)
WHERE status_cd LIKE '%[1-9]'

SELECT TOP 10 * FROM customer WITH(NOLOCK)
WHERE RIGHT(status_cd,1) IN ('1', '2', '3', '4', '5', '6', '7', '8', '9')


/*
> S-015: 顧客データ（customer）から、
ステータスコード（status_cd）の先頭がアルファベットのA〜Fで始まり、
末尾が数字の1〜9で終わるデータを全項目抽出し、10件表示せよ。
*/
SELECT TOP 10 * FROM customer WITH(NOLOCK)
WHERE status_cd LIKE '[A-F]%[1-9]'


/*
> S-016: 店舗データ（store）から、電話番号（tel_no）が3桁-3桁-4桁のデータを全項目表示せよ。
*/

SELECT * FROM store WITH(NOLOCK)
WHERE 1=1
	AND LEN(tel_no) = 12
	AND SUBSTRING(tel_no, 4, 1) = '-'
	AND SUBSTRING(tel_no, 8, 1) = '-'

SELECT * FROM store WITH(NOLOCK)
WHERE tel_no LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'

SELECT * FROM store WITH(NOLOCK)
WHERE tel_no LIKE '___-___-____'


/*
> S-017: 顧客データ（customer）を生年月日（birth_day）で高齢順にソートし、先頭から全項目を10件表示せよ。
*/

SELECT TOP 10 * FROM customer WITH(NOLOCK)
ORDER BY birth_day DESC

/*
> S-018: 顧客データ（customer）を生年月日（birth_day）で若い順にソートし、先頭から全項目を10件表示せよ。
*/

SELECT TOP 10 * FROM customer WITH(NOLOCK)
ORDER BY birth_day ASC


/*
> S-019: レシート明細データ（receipt）に対し、
1件あたりの売上金額（amount）が高い順にランクを付与し、先頭から10件表示せよ。
項目は顧客ID（customer_id）、売上金額（amount）、付与したランクを表示させること。
なお、売上金額（amount）が等しい場合は同一順位を付与するものとする。
*/
--RANKは同順位は同じ数字。1から連番。例：1,2,2,2,5,6...
SELECT customer_id, amount, RANK() OVER(ORDER BY amount DESC)
FROM receipt WITH(NOLOCK)

--DENSE_RANKは同順位は同じ数字。1から連番。例：1,2,2,2,3,4,...
SELECT customer_id, amount, DENSE_RANK() OVER(ORDER BY amount DESC)
FROM receipt WITH(NOLOCK)


/*
S-020: レシート明細データ（receipt）に対し、
1件あたりの売上金額（amount）が高い順にランクを付与し、先頭から10件表示せよ。
項目は顧客ID（customer_id）、売上金額（amount）、付与したランクを表示させること。
なお、売上金額（amount）が等しい場合でも別順位を付与すること。
*/

--ROW_NUMBERは同順位でも連番。1から連番
SELECT customer_id, amount, ROW_NUMBER() OVER(ORDER BY amount DESC)
FROM receipt WITH(NOLOCK)


/*
> S-021: レシート明細データ（receipt）に対し、件数をカウントせよ。
*/
SELECT COUNT(*) FROM receipt WITH(NOLOCK)

SELECT COUNT(1) FROM receipt WITH(NOLOCK)

/*
> S-022: レシート明細データ（receipt）の顧客ID（customer_id）に対し、ユニーク件数をカウントせよ。
*/
SELECT COUNT(DISTINCT customer_id) FROM receipt WITH(NOLOCK)

/*
> S-023: レシート明細データ（receipt）に対し、
店舗コード（store_cd）ごとに売上金額（amount）と売上数量（quantity）を合計せよ。
*/
SELECT store_cd, SUM(amount) AS SUM_AMOUNT, SUM(quantity) AS SUM_QUANTITY
FROM receipt WITH(NOLOCK)
GROUP BY store_cd
ORDER BY store_cd


/*
> S-024: レシート明細データ（receipt）に対し、
顧客ID（customer_id）ごとに最も新しい売上年月日（sales_ymd）を求め、10件表示せよ。
*/
SELECT customer_id, MAX(sales_ymd) AS latest_sales_ymd
FROM receipt WITH(NOLOCK)
GROUP BY customer_id
ORDER BY customer_id

/*
> S-025: レシート明細データ（receipt）に対し、
顧客ID（customer_id）ごとに最も古い売上年月日（sales_ymd）を求め、10件表示せよ。
*/
SELECT customer_id, MIN(sales_ymd) AS oldest_sales_ymd
FROM receipt WITH(NOLOCK)
GROUP BY customer_id
ORDER BY customer_id


/*
> S-026: レシート明細データ（receipt）に対し、
顧客ID（customer_id）ごとに最も新しい売上年月日（sales_ymd）と古い売上年月日を求め、両者が異なるデータを10件表示せよ。
*/
SELECT customer_id
	, MIN(sales_ymd) AS oldest_sales_ymd
	, MAX(sales_ymd) AS oldest_sales_ymd
FROM receipt WITH(NOLOCK)
GROUP BY customer_id
HAVING MIN(sales_ymd) <> MAX(sales_ymd)
ORDER BY customer_id

/*
> S-027: レシート明細データ（receipt）に対し、
店舗コード（store_cd）ごとに売上金額（amount）の平均を計算し、降順でTOP5を表示せよ。
*/
SELECT store_cd
	,AVG(amount) AS avg_amount
FROM receipt WITH(NOLOCK)
GROUP BY store_cd
ORDER BY store_cd DESC

/*
> S-028: レシート明細データ（receipt）に対し、
店舗コード（store_cd）ごとに売上金額（amount）の中央値を計算し、降順でTOP5を表示せよ。
*/
--SQL Server には中央値を求める関数medianなし
--参考：https://docs.microsoft.com/ja-jp/sql/t-sql/functions/percentile-cont-transact-sql?view=sql-server-ver16
-- https://www.web-dev-qa-db-ja.com/ja/sql/sql-server%E3%81%A7%E4%B8%AD%E5%A4%AE%E5%80%A4%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%E6%A9%9F%E8%83%BD/967046970/

SELECT DISTINCT store_cd
	,PERCENTILE_CONT(0.5)
		WITHIN GROUP (ORDER BY amount ASC)
		OVER (PARTITION BY store_cd) AS med_amount1 -- 実際に存在しない値でも適切な値を出す
	,PERCENTILE_DISC(0.5)
		WITHIN GROUP (ORDER BY amount ASC)
		OVER (PARTITION BY store_cd) AS med_amount2 -- 実際にデータがあるものを返す
FROM receipt WITH(NOLOCK)


--基本統計量まとめ
--https://cochineal19.hatenablog.com/entry/2020/11/23/210708

/*
> S-029: レシート明細データ（receipt）に対し、
店舗コード（store_cd）ごとに商品コード（product_cd）の最頻値を求め、10件表示させよ。
*/
DROP TABLE IF EXISTS #CNT_PRODUCT_CD
SELECT store_cd
	,COUNT(*) AS cnt
	,product_cd
INTO #CNT_PRODUCT_CD
FROM receipt WITH(NOLOCK)
GROUP BY store_cd,product_cd

SELECT * FROM #CNT_PRODUCT_CD
ORDER BY store_cd, cnt DESC

-- count:55 最頻値が複数ある場合は両方表示
SELECT #CNT.store_cd
	,#CNT.cnt
	,#CNT.product_cd
FROM #CNT_PRODUCT_CD AS #CNT
INNER JOIN (
	SELECT store_cd
		,MAX(cnt) AS cnt
	FROM #CNT_PRODUCT_CD
	GROUP BY store_cd
	)AS #CNT_MAX
ON #CNT.store_cd = #CNT_MAX.store_cd
	AND #CNT.cnt = #CNT_MAX.cnt
ORDER BY store_cd


/*
> S-030: レシート明細データ（receipt）に対し、
店舗コード（store_cd）ごとに売上金額（amount）の分散を計算し、降順で5件表示せよ。
*/
SELECT store_cd, amount FROM receipt
ORDER BY store_cd

SELECT store_cd
	,VARP(amount) AS varp_amount --分散 データ数で割る
	,VAR(amount) AS var_amount -- 不変分散 データ数-1で割る
FROM receipt WITH(NOLOCK)
GROUP BY store_cd
ORDER BY store_cd


DROP TABLE IF EXISTS #1
SELECT store_cd
	,AVG(amount) AS avg_amount
	,COUNT(amount) AS cnt_amount
INTO #1
FROM receipt WITH(NOLOCK)
GROUP BY store_cd

DROP TABLE IF EXISTS #2
SELECT receipt.store_cd AS store_cd
	--,receipt.amount AS amount
	--,#1.avg_amount AS avg_amount
	--,#1.cnt_amount AS cnt_amount
	,POWER(receipt.amount - #1.avg_amount, 2) AS difp_amount
	,POWER(receipt.amount - #1.avg_amount, 2) AS dif_amount
INTO #2
FROM receipt WITH(NOLOCK)
LEFT JOIN #1
ON receipt.store_cd = #1.store_cd
ORDER BY receipt.store_cd

SELECT store_cd
	,SUM(difp_amount) / COUNT(*) AS varp_amount
	,SUM(dif_amount)  / (COUNT(*)- 1) AS var_amount
FROM #2 WITH(NOLOCK)
GROUP BY store_cd
ORDER BY store_cd

/*
> S-031: レシート明細データ（receipt）に対し、店舗コード（store_cd）ごとに売上金額（amount）の標準偏差を計算し、降順で5件表示せよ。
*/
SELECT store_cd
	,STDEVP(amount) AS stdp_amount --標準偏差
	,STDEV(amount) AS std_amount -- 標本標準偏差
FROM receipt WITH(NOLOCK)
GROUP BY store_cd
ORDER BY store_cd

/*
> S-032: レシート明細データ（receipt）の売上金額（amount）について、25％刻みでパーセンタイル値を求めよ。
*/
SELECT DISTINCT store_cd
	,PERCENTILE_CONT(0)
		WITHIN GROUP (ORDER BY amount ASC)
		OVER (PARTITION BY store_cd) AS percentile0_amount -- 実際に存在しない値でも適切な値を出す
	,PERCENTILE_CONT(0.25)
		WITHIN GROUP (ORDER BY amount ASC)
		OVER (PARTITION BY store_cd) AS percentile25_amount -- 実際に存在しない値でも適切な値を出す
	,PERCENTILE_CONT(0.5)
		WITHIN GROUP (ORDER BY amount ASC)
		OVER (PARTITION BY store_cd) AS med_amount1 -- 実際に存在しない値でも適切な値を出す
	,PERCENTILE_CONT(0.75)
		WITHIN GROUP (ORDER BY amount ASC)
		OVER (PARTITION BY store_cd) AS percentile50_amount -- 実際に存在しない値でも適切な値を出す
	,PERCENTILE_CONT(1)
		WITHIN GROUP (ORDER BY amount ASC)
		OVER (PARTITION BY store_cd) AS percentile100_amount -- 実際に存在しない値でも適切な値を出す
	FROM receipt WITH(NOLOCK)

/*
> S-033: レシート明細データ（receipt）に対し、店舗コード（store_cd）ごとに売上金額（amount）の平均を計算し、330以上のものを抽出せよ。
*/
SELECT store_cd
	,AVG(amount) AS avg_amount
FROM receipt WITH(NOLOCK)
GROUP BY store_cd
HAVING AVG(amount) >= 330

/*
> S-034: レシート明細データ（receipt）に対し、顧客ID（customer_id）ごとに売上金額（amount）を合計して全顧客の平均を求めよ。
ただし、顧客IDが"Z"から始まるものは非会員を表すため、除外して計算すること。
*/
DROP TABLE IF EXISTS #1 
SELECT customer_id
	,SUM(amount) AS sum_amount
INTO #1
FROM receipt WITH(NOLOCK)
WHERE customer_id NOT LIKE 'Z%' 
GROUP BY customer_id
SELECT * FROM #1

DECLARE @customer_cnt INT
SELECT @customer_cnt = COUNT(DISTINCT customer_id)
FROM receipt WITH(NOLOCK)
SELECT @customer_cnt

-- amountはintなので合計もint。そのまま平均するとintとなり、少数以下が消える		
DECLARE @avg_amount_per_customer float
SELECT @avg_amount_per_customer = CONVERT(float, SUM(#1.sum_amount)) / @customer_cnt
FROM #1
SELECT @avg_amount_per_customer

/*
> S-035: レシート明細データ（receipt）に対し、
顧客ID（customer_id）ごとに売上金額（amount）を合計して全顧客の平均を求め、平均以上に買い物をしている顧客を抽出し、10件表示せよ。
ただし、顧客IDが"Z"から始まるものは非会員を表すため、除外して計算すること。
*/
SELECT customer_id
	,SUM(amount) AS sum_amount
FROM receipt WITH(NOLOCK)
WHERE customer_id NOT LIKE 'Z%'
GROUP By customer_id
HAVING SUM(amount) >= @avg_amount_per_customer


/*
> S-036: レシート明細データ（receipt）と店舗データ（store）を内部結合し、
レシート明細データの全項目と店舗データの店舗名（store_name）を10件表示せよ。
*/
SELECT TOP 1000
	receipt.*
	, store.store_name
FROM receipt WITH(NOLOCK)
INNER JOIN store WITH(NOLOCK)
ON receipt.store_cd = store.store_cd

/*
> S-037: 商品データ（product）とカテゴリデータ（category）を内部結合し、
商品データの全項目とカテゴリデータのカテゴリ小区分名（category_small_name）を10件表示せよ。
*/
SELECT TOP 1000
	product.*
	,category.category_major_name
	,category.category_medium_name
	,category.category_small_name
FROM product WITH(NOLOCK)
INNER JOIN category WITH(NOLOCK)
ON 1=1
	AND product.category_major_cd  = category.category_major_cd
	AND product.category_medium_cd = category.category_medium_cd
	AND product.category_small_cd  = category.category_small_cd

/*
> S-038: 顧客データ（customer）とレシート明細データ（receipt）から、
顧客ごとの売上金額合計を求め、10件表示せよ。ただし、売上実績がない顧客については売上金額を0として表示させること。
また、顧客は性別コード（gender_cd）が女性（1）であるものを対象とし、非会員（顧客IDが"Z"から始まるもの）は除外すること。
*/
DROP TABLE IF EXISTS #1
SELECT customer_id
	,SUM(amount) AS sum_amount
INTO #1
FROM receipt WITH(NOLOCK)
GROUP BY customer_id
SELECT * FROM #1

SELECT customer.customer_id
	,customer.gender_cd
	,COALESCE(#1.sum_amount, 0) AS sum_amount
FROM customer WITH(NOLOCK)
LEFT JOIN #1
ON customer.customer_id = #1.customer_id
WHERE customer.customer_id NOT LIKE 'Z%'
	AND customer.gender_cd = '1'

/*
> S-039: レシート明細データ（receipt）から、
売上日数の多い顧客の上位20件を抽出したデータと、
売上金額合計の多い顧客の上位20件を抽出したデータをそれぞれ作成し、さらにその2つを完全外部結合せよ。
ただし、非会員（顧客IDが"Z"から始まるもの）は除外すること。
*/
DROP TABLE IF EXISTS #URIAGE_NISSU_TOP20
SELECT TOP 20 customer_id
	,COUNT(DISTINCT sales_ymd) AS uriage_nissu
INTO #URIAGE_NISSU_TOP20
FROM receipt WITH(NOLOCK)
WHERE customer_id NOT LIKE 'Z%'
GROUP BY customer_id
ORDER BY COUNT(DISTINCT sales_ymd) DESC


DROP TABLE IF EXISTS #URIAGE_KINGAKU_TOP20
SELECT TOP 20 customer_id
	,SUM(amount) AS sum_amount
INTO #URIAGE_KINGAKU_TOP20
FROM receipt WITH(NOLOCK)
WHERE customer_id NOT LIKE 'Z%'
GROUP BY customer_id
ORDER BY SUM(amount) DESC

SELECT *
FROM #URIAGE_NISSU_TOP20
FULL OUTER JOIN #URIAGE_KINGAKU_TOP20
ON #URIAGE_NISSU_TOP20.customer_id = #URIAGE_KINGAKU_TOP20.customer_id
ORDER BY #URIAGE_KINGAKU_TOP20.customer_id



/*
> S-040: 全ての店舗と全ての商品を組み合わせたデータを作成したい。店舗データ（store）と商品データ（product）を直積し、件数を計算せよ。
*/
select * from store --53 data
select * from product --10030 data

SELECT COUNT(*) --531590 DATA
FROM store WITH(NOLOCK)
CROSS JOIN product WITH(NOLOCK)

SELECT TOP 100 
	store.store_cd
	,product.product_cd
FROM store WITH(NOLOCK)
CROSS JOIN product WITH(NOLOCK)


/*
> S-041: レシート明細データ（receipt）の売上金額（amount）を日付（sales_ymd）ごとに集計し、
前回売上があった日からの売上金額増減を計算せよ。そして結果を10件表示せよ。
*/
DROP TABLE IF EXISTS #1
SELECT 
	ROW_NUMBER() OVER(ORDER BY sales_ymd ASC) AS row#
	,sales_ymd
	,SUM(amount) AS sum_amount
INTO #1
FROM receipt WITH(NOLOCK)
GROUP BY sales_ymd
ORDER BY sales_ymd
SELECT * FROM #1

-- 最後の日は翌営業日との比較ができないので、NULL対策必要
SELECT
	--#BEFORE.row# AS row#_before
	--,#AFTER.row# AS row#_after
	#BEFORE.sales_ymd AS sales_ymd_before
	,COALESCE(#AFTER.sales_ymd, '') AS sales_ymd_after
	,COALESCE(#AFTER.sum_amount - #BEFORE.sum_amount, 0) AS 'sum_amount(day-over-day)'
FROM #1 AS #BEFORE
LEFT JOIN #1 AS #AFTER
ON #AFTER.row# = #BEFORE.row# + 1

/*
> S-042: レシート明細データ（receipt）の売上金額（amount）を日付（sales_ymd）ごとに集計し、
各日付のデータに対し、前回、前々回、3回前に売上があった日のデータを結合せよ。そして結果を10件表示せよ。
*/
SELECT
	TOP 100
	--#threeTimesBefore.row#
	--,#twoTimesBefore.row#
	--,#lastTime.row#
	--,#thisTime.row#
	 COALESCE(#threeTimesBefore.sales_ymd,'') AS '3回前売上日'
	,COALESCE(#twoTimesBefore.sales_ymd,'') AS '2回前売上日'
	,COALESCE(#lastTime.sales_ymd,'') AS '前回売上日'
	,#thisTime.sales_ymd AS '今回売上日'
	,COALESCE(#threeTimesBefore.sum_amount, 0) AS '3回前売上総金額'
	,COALESCE(#twoTimesBefore.sum_amount, 0) AS '2回前売上総金額'
	,COALESCE(#lastTime.sum_amount, 0) AS '前回売上総金額'
	,#thisTime.sum_amount AS '今回売上総金額'
FROM #1 AS #thisTime
LEFT JOIN #1 AS #lastTime
ON #lastTime.row# = #thisTime.row# - 1
LEFT JOIN #1 AS #twoTimesBefore
ON #twoTimesBefore.row# = #thisTime.row# - 2
LEFT JOIN #1 AS #threeTimesBefore
ON #threeTimesBefore.row# = #thisTime.row# - 3


/*
> S-043: レシート明細データ（receipt）と顧客データ（customer）を結合し、
性別コード（gender_cd）と年代（ageから計算）ごとに売上金額（amount）を合計した売上サマリデータを作成せよ。
性別コードは0が男性、1が女性、9が不明を表すものとする。
>
> ただし、項目構成は年代、女性の売上金額、男性の売上金額、性別不明の売上金額の4項目とすること
（縦に年代、横に性別のクロス集計）。また、年代は10歳ごとの階級とすること。
*/

DROP TABLE IF EXISTS #nendai
SELECT
	*
	,CASE
		WHEN 0 <= customer.age AND customer.age < 10 THEN '0-9'
		WHEN 10 <= customer.age AND customer.age < 20 THEN '10-19'
		WHEN 20 <= customer.age AND customer.age < 30 THEN '20-29'
		WHEN 30 <= customer.age AND customer.age < 40 THEN '30-39'
		WHEN 40 <= customer.age AND customer.age < 50 THEN '40-49'
		WHEN 50 <= customer.age AND customer.age < 60 THEN '50-59'
		WHEN 60 <= customer.age AND customer.age < 70 THEN '60-69'
		WHEN 70 <= customer.age AND customer.age < 80 THEN '70-79'
		WHEN 80 <= customer.age AND customer.age < 90 THEN '80-89'
		WHEN 90 <= customer.age AND customer.age < 100 THEN '90-99'
		ELSE '100-' END AS '年代'
INTO #nendai
FROM customer WITH(NOLOCK) 
SELECT * FROM #nendai

DROP TABLE IF EXISTS #2
SELECT
	#nendai.gender_cd
	,#nendai.年代
	,SUM(receipt.amount) AS sum_amount
INTO #2
FROM receipt WITH(NOLOCK)
INNER JOIN #nendai WITH(NOLOCK) -- 非会員Z始まりは省く
ON #nendai.customer_id = receipt.customer_id
GROUP BY #nendai.gender_cd, #nendai.年代
ORDER BY #nendai.gender_cd, #nendai.年代
SELECT * FROM #2

-- 縦持ちを横持に変換
-- 各年代を一行にするために集計関数maxを使用（MAXでなくてもいけど）
SELECT 
	年代
	,MAX(CASE WHEN gender_cd = '0' THEN sum_amount ELSE 0 END) AS '男性'
	,MAX(CASE WHEN gender_cd = '1' THEN sum_amount ELSE 0 END) AS '女性'
	,MAX(CASE WHEN gender_cd = '9' THEN sum_amount ELSE 0 END) AS '不明'
FROM #2
GROUP BY 年代
ORDER BY 年代

/*
> S-044: 043で作成した売上サマリデータ（sales_summary）は性別の売上を横持ちさせたものであった。
このデータから性別を縦持ちさせ、年代、性別コード、売上金額の3項目に変換せよ。
ただし、性別コードは男性を"00"、女性を"01"、不明を"99"とする。
*/
SELECT 
	CASE
		WHEN gender_cd = '0' THEN '00' 
		WHEN gender_cd = '1' THEN '01' 
		WHEN gender_cd = '9' THEN '99' 
		ELSE '' END AS '性別コード'
	,年代
	,sum_amount
FROM #2

/*
> S-045: 顧客データ（customer）の生年月日（birth_day）は日付型でデータを保有している。
これをYYYYMMDD形式の文字列に変換し、顧客ID（customer_id）とともに10件表示せよ。
*/
-- テーブル定義を見る
SELECT
	t.name                  AS テーブル名,
	c.name                  AS 項目名,
	type_name(user_type_id) AS 属性,
	max_length              AS 長さ,
	CASE
		WHEN is_nullable = 1 THEN 'YES'
		ELSE 'NO' END AS NULL許可
FROM sys.objects t
INNER JOIN sys.columns c 
ON t.object_id = c.object_id
WHERE t.type = 'U'
	AND t.name IN ('customer')
ORDER BY c.column_id


-- ref: https://sql55.com/query/convert-datetime-to-string.php
SELECT customer_id
	,birth_day
	,CONVERT(NVARCHAR, birth_day, 112) AS birth_day_yyyymmdd
FROM customer WITH(NOLOCK)

/*
> S-046: 顧客データ（customer）の申し込み日（application_date）はYYYYMMDD形式の文字列型でデータを保有している。
これを日付型に変換し、顧客ID（customer_id）とともに10件表示せよ。
*/
SELECT
	customer_id
	,application_date
	,CONVERT(DATE, application_date) AS application_date_datetime
FROM customer WITH(NOLOCK)


/*
> S-047: レシート明細データ（receipt）の売上日（sales_ymd）はYYYYMMDD形式の数値型でデータを保有している。
これを日付型に変換し、レシート番号(receipt_no)、レシートサブ番号（receipt_sub_no）とともに10件表示せよ。
*/
SELECT
	receipt_no
	,receipt_sub_no
	,CONVERT(DATE, CONVERT(CHAR(8), sales_ymd)) AS sales_ymd
FROM receipt WITH(NOLOCK)


/*
> S-048: レシート明細データ（receipt）の売上エポック秒（sales_epoch）は数値型のUNIX秒でデータを保有している。
これを日付型に変換し、レシート番号(receipt_no)、レシートサブ番号（receipt_sub_no）とともに10件表示せよ。
*/
SELECT
	receipt_no
	,receipt_sub_no
	,sales_epoch
	,CONVERT(DATE,
		DATEADD(S, sales_epoch,'1970/01/01') -- DATETIME型
		) AS sales_epoch2
FROM receipt WITH(NOLOCK)


/*
> S-049: レシート明細データ（receipt）の売上エポック秒（sales_epoch）を日付型に変換し、
「年」だけ取り出してレシート番号(receipt_no)、レシートサブ番号（receipt_sub_no）とともに10件表示せよ。
*/
SELECT
	receipt_no
	,receipt_sub_no
	,sales_epoch
	,YEAR(DATEADD(S, sales_epoch,'1970/01/01'))	AS sales_epoch_year
FROM receipt WITH(NOLOCK)


/*
> S-050: レシート明細データ（receipt）の売上エポック秒（sales_epoch）を日付型に変換し、
「月」だけ取り出してレシート番号(receipt_no)、レシートサブ番号（receipt_sub_no）とともに10件表示せよ。
なお、「月」は0埋め2桁で取り出すこと。
*/
DROP TABLE IF EXISTS #1
SELECT
	receipt_no
	,receipt_sub_no
	,sales_epoch
	,MONTH(DATEADD(S, sales_epoch,'1970/01/01')) AS sales_month --INT
INTO #1
FROM receipt WITH(NOLOCK)
SELECT * FROM #1


SELECT 
	receipt_no
	,receipt_sub_no
	,RIGHT('00'	+ CONVERT(VARCHAR, sales_month) , 2) AS sales_month
FROM #1

/*
> S-051: レシート明細データ（receipt）の売上エポック秒を日付型に変換し、
「日」だけ取り出してレシート番号(receipt_no)、レシートサブ番号（receipt_sub_no）とともに10件表示せよ。
なお、「日」は0埋め2桁で取り出すこと。
*/
DROP TABLE IF EXISTS #1
SELECT
	receipt_no
	,receipt_sub_no
	,sales_epoch
	,DAY(DATEADD(S, sales_epoch,'1970/01/01')) AS sales_day --INT
INTO #1
FROM receipt WITH(NOLOCK)
SELECT * FROM #1


SELECT 
	receipt_no
	,receipt_sub_no
	,RIGHT('00'	+ CONVERT(VARCHAR, sales_day) , 2) AS sales_day
FROM #1

/*
> S-052: レシート明細データ（receipt）の売上金額（amount）を顧客ID（customer_id）ごとに合計の上、
売上金額合計に対して2,000円以下を0、2,000円より大きい金額を1に二値化し、
顧客ID、売上金額合計とともに10件表示せよ。
ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること。
*/

SELECT
	customer_id
	,SUM(amount) AS sum_amount
	,CASE
		WHEN SUM(amount) <= 2000 THEN 0
		ELSE 1 END AS sum_amount_over2000
FROM receipt WITH(NOLOCK)
WHERE customer_id NOT LIKE 'Z%'
GROUP BY customer_id
ORDER BY customer_id

/*
> S-053: 顧客データ（customer）の郵便番号（postal_cd）に対し、
東京（先頭3桁が100〜209のもの）を1、それ以外のものを0に二値化せよ。
さらにレシート明細データ（receipt）と結合し、全期間において売上実績のある顧客数を、
作成した二値ごとにカウントせよ。
*/
DROP TABLE IF EXISTS #1
SELECT 
	*
	,CONVERT(INT, LEFT(postal_cd, 3)) AS postal_cd_header
INTO #1
FROM customer WITH(NOLOCK)
SELECT * FROM #1


DROP TABLE IF EXISTS #2
SELECT 
	*
	,CASE WHEN 100 <= postal_cd_header 
		AND postal_cd_header < 210 THEN 1
		ELSE 0 END AS is_tokyo
INTO #2
FROM #1
SELECT * FROM #2

SELECT
	#2.is_tokyo
	,COUNT(*) AS cnt_of_customers
FROM receipt WITH(NOLOCK)
INNER JOIN #2
ON #2.customer_id = receipt.customer_id
GROUP BY is_tokyo

/*
> S-054: 顧客データ（customer）の住所（address）は、
埼玉県、千葉県、東京都、神奈川県のいずれかとなっている。
都道府県毎にコード値を作成し、顧客ID、住所とともに10件表示せよ。
値は埼玉県を11、千葉県を12、東京都を13、神奈川県を14とすること。
*/

SELECT 
	customer_id
	,address
	,CASE
		WHEN address LIKE '埼玉県%' THEN '11'
		WHEN address LIKE '千葉県%' THEN '12'
		WHEN address LIKE '東京都%' THEN '13'
		WHEN address LIKE '神奈川県%' THEN '14'
		ELSE '' --バカ除け 
		END AS pref_cd
FROM customer WITH(NOLOCK)


/*
> S-055: レシート明細（receipt）データの売上金額（amount）を顧客ID（customer_id）ごとに合計し、
その合計金額の四分位点を求めよ。その上で、顧客ごとの売上金額合計に対して以下の基準でカテゴリ値を作成し、
顧客ID、売上金額合計とともに10件表示せよ。カテゴリ値は順に1〜4とする。
>
> - 最小値以上第1四分位未満 ・・・ 1を付与
> - 第1四分位以上第2四分位未満 ・・・ 2を付与
> - 第2四分位以上第3四分位未満 ・・・ 3を付与
> - 第3四分位以上 ・・・ 4を付与
*/
DROP TABLE IF EXISTS #1
SELECT
	customer_id
	,SUM(amount) AS sum_amount
INTO #1
FROM receipt WITH(NOLOCK)
GROUP BY customer_id
SELECT * FROM #1

-- 四分位
DROP TABLE IF EXISTS #2
SELECT
	customer_id
	,sum_amount
	,PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY sum_amount) OVER() AS 第一四分位
	,PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY sum_amount) OVER() AS 第二四分位
	,PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY sum_amount) OVER() AS 第三四分位
INTO #2
FROM #1
SELECT * FROM #2

-- カテゴリ付与
DROP TABLE IF EXISTS #3
SELECT 
	customer_id
	,sum_amount
	,CASE
		WHEN sum_amount < 第一四分位 THEN 1
		WHEN sum_amount < 第二四分位 THEN 2
		WHEN sum_amount < 第三四分位 THEN 3
		WHEN 第三四分位 <= sum_amount THEN 4	
		ELSE 0 -- バカ除け
		END AS sum_amount_category
INTO #3
FROM #2
SELECT * FROM #3

--確認
SELECT 
	sum_amount_category
	,COUNT(*)
FROM #3
GROUP BY sum_amount_category
ORDER BY sum_amount_category

/*
> S-056: 顧客データ（customer）の年齢（age）をもとに10歳刻みで年代を算出し、
顧客ID（customer_id）、生年月日（birth_day）とともに10件表示せよ。
ただし、60歳以上は全て60歳代とすること。年代を表すカテゴリ名は任意とする。
*/

DROP TABLE IF EXISTS #NENDAI
SELECT
	customer_id
	,birth_day
	,age
	,CASE
		WHEN  0 <= age AND age < 10 THEN '0-10'
		WHEN 10 <= age AND age < 20 THEN '10-20'
		WHEN 20 <= age AND age < 30 THEN '20-30'
		WHEN 30 <= age AND age < 40 THEN '30-40'
		WHEN 40 <= age AND age < 50 THEN '40-50'
		WHEN 50 <= age AND age < 60 THEN '50-60'
		WHEN 60 <= age THEN '60-'
		ELSE '' --バカ除け
		END AS nendai
INTO #NENDAI
FROM customer WITH(NOLOCK) 
SELECT * FROM #NENDAI

/*
> S-057: 056の抽出結果と性別コード（gender_cd）により、
新たに性別×年代の組み合わせを表すカテゴリデータを作成し、10件表示せよ。
組み合わせを表すカテゴリの値は任意とする。
*/
DROP TABLE IF EXISTS #GENDER_CD
SELECT 
	DISTINCT gender_cd
INTO #GENDER_CD
FROM customer WITH(NOLOCK)
SELECT * FROM #GENDER_CD

DROP TABLE IF EXISTS #NENDAI_CD
SELECT
	DISTINCT nendai
INTO #NENDAI_CD
FROM #NENDAI
SELECT * FROM #NENDAI_CD

SELECT
	nendai
	,gender_cd
	,nendai + '_' + gender_cd AS nendai_gender_cd
FROM #NENDAI_CD
CROSS JOIN #GENDER

/*
> S-058: 顧客データ（customer）の性別コード（gender_cd）をダミー変数化し、
顧客ID（customer_id）とともに10件表示せよ。
*/
SELECT
	customer_id
	,gender_cd
	,CASE WHEN gender_cd = '0' THEN '1' ELSE '0' END AS male
	,CASE WHEN gender_cd = '1' THEN '1' ELSE '0' END AS female
	,CASE WHEN gender_cd = '9' THEN '1' ELSE '0' END AS unknown
FROM customer WITH(NOLOCK)



/*
> S-059: レシート明細データ（receipt）の売上金額（amount）を顧客ID（customer_id）ごとに合計し、
売上金額合計を平均0、標準偏差1に標準化して顧客ID、売上金額合計とともに10件表示せよ。
標準化に使用する標準偏差は、分散の平方根、もしくは不偏分散の平方根のどちらでも良いものとする。
ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること。
*/

DROP TABLE IF EXISTS #1
SELECT
	 customer_id
	 ,SUM(amount) AS sum_amount
INTO #1
FROM receipt WITH(NOLOCK)
WHERE customer_id NOT LIKE 'Z%'
GROUP BY customer_id
SELECT * FROM #1

DECLARE @std float
DECLARE @avg float
SELECT
	@std = STDEV(sum_amount)
	,@avg = AVG(sum_amount)
FROM #1

DROP TABLE IF EXISTS #2
SELECT
	customer_id
	,sum_amount
	,(sum_amount - @avg) / @std AS sum_amount2
INTO #2
FROM #1
SELECT * FROM #2

--確認
SELECT
	AVG(sum_amount2) -- 平均は0
	,STDEV(sum_amount2) -- 標準偏差は1
FROM #2

/*
> S-060: レシート明細データ（receipt）の売上金額（amount）を顧客ID（customer_id）ごとに合計し、
売上金額合計を最小値0、最大値1に正規化して顧客ID、売上金額合計とともに10件表示せよ。
ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること。
*/

DROP TABLE IF EXISTS #1
SELECT
	 customer_id
	 ,SUM(amount) AS sum_amount
INTO #1
FROM receipt WITH(NOLOCK)
WHERE customer_id NOT LIKE 'Z%'
GROUP BY customer_id
SELECT * FROM #1

DECLARE @max float
DECLARE @min float
SELECT
	@max = MAX(sum_amount)
	,@min = MIN(sum_amount)
FROM #1

DROP TABLE IF EXISTS #2
SELECT
	customer_id
	,sum_amount
	,(sum_amount - @min) / (@max - @min) AS sum_amount2
INTO #2
FROM #1
SELECT * FROM #2

--確認
SELECT
	MAX(sum_amount2) -- MAXは1
	,MIN(sum_amount2) -- MINは0
FROM #2


/*
> S-061: レシート明細データ（receipt）の売上金額（amount）を顧客ID（customer_id）ごとに合計し、
売上金額合計を常用対数化（底10）して顧客ID、売上金額合計とともに10件表示せよ。
ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること。
*/
DROP TABLE IF EXISTS #1
SELECT
	 customer_id
	 ,SUM(amount) AS sum_amount
INTO #1
FROM receipt WITH(NOLOCK)
WHERE customer_id NOT LIKE 'Z%'
GROUP BY customer_id
SELECT * FROM #1

SELECT
	customer_id
	,sum_amount
	,LOG10(sum_amount) AS sum_amount_log10
FROM #1


/*
> S-062: レシート明細データ（receipt）の売上金額（amount）を顧客ID（customer_id）ごとに合計し、
売上金額合計を自然対数化（底e）して顧客ID、売上金額合計とともに10件表示せよ。
ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること。
*/
SELECT
	customer_id
	,sum_amount
	,LOG(sum_amount) AS sum_amount_log10
FROM #1

/*
> S-063: 商品データ（product）の単価（unit_price）と原価（unit_cost）から各商品の利益額を算出し、
結果を10件表示せよ。
*/
SELECT 
	*
	,COALESCE(unit_price - unit_cost, 0) AS profit
FROM product WITH(NOLOCK)


/*
> S-064: 商品データ（product）の単価（unit_price）と原価（unit_cost）から、
各商品の利益率の全体平均を算出せよ。
ただし、単価と原価には欠損が生じていることに注意せよ。
*/
SELECT 
	AVG(
		CONVERT(float, (unit_price-unit_cost)) / unit_cost
		) AS profit_rate
FROM product WITH(NOLOCK)
WHERE unit_price IS NOT NULL
	AND unit_cost IS NOT NULL

/*
> S-065: 商品データ（product）の各商品について、利益率が30%となる新たな単価を求めよ。
ただし、1円未満は切り捨てること。そして結果を10件表示させ、利益率がおよそ30％付近であることを確認せよ。
ただし、単価（unit_price）と原価（unit_cost）には欠損が生じていることに注意せよ。
*/
SELECT
	product_cd
	,unit_price
	,FLOOR(unit_cost * 1.3) AS unit_price_new
	,(FLOOR(unit_cost * 1.3) - unit_cost) / unit_cost AS prodit_rate_new
FROM product WITH(NOLOCK)
WHERE unit_price IS NOT NULL


/*
> S-066: 商品データ（product）の各商品について、利益率が30%となる新たな単価を求めよ。
今回は、1円未満を丸めること（四捨五入または偶数への丸めで良い）。そして結果を10件表示させ、
利益率がおよそ30％付近であることを確認せよ。
ただし、単価（unit_price）と原価（unit_cost）には欠損が生じていることに注意せよ。
*/

SELECT
	product_cd
	,unit_price
	,ROUND(unit_cost * 1.3, 0) AS unit_price_new
	,(ROUND(unit_cost * 1.3, 0) - unit_cost) / unit_cost AS prodit_rate_new
FROM product WITH(NOLOCK)
WHERE unit_price IS NOT NULL

/*
> S-067: 商品データ（product）の各商品について、利益率が30%となる新たな単価を求めよ。
今回は、1円未満を切り上げること。そして結果を10件表示させ、利益率がおよそ30％付近であることを確認せよ。
ただし、単価（unit_price）と原価（unit_cost）には欠損が生じていることに注意せよ。
*/

SELECT
	product_cd
	,unit_price
	,CEILING(unit_cost * 1.3) AS unit_price_new
	,(CEILING(unit_cost * 1.3) - unit_cost) / unit_cost AS prodit_rate_new
FROM product WITH(NOLOCK)
WHERE unit_price IS NOT NULL


/*
> S-068: 商品データ（product）の各商品について、消費税率10％の税込み金額を求めよ。
1円未満の端数は切り捨てとし、結果を10件表示せよ。
ただし、単価（unit_price）には欠損が生じていることに注意せよ。
*/

SELECT
	product_cd
	,unit_price
	,FLOOR(unit_price * 1.1) AS unit_price_with_tax
FROM product WITH(NOLOCK)
WHERE unit_price IS NOT NULL


/*
> S-069: レシート明細データ（receipt）と商品データ（product）を結合し、
顧客毎に全商品の売上金額合計と、
カテゴリ大区分コード（category_major_cd）が"07"（瓶詰缶詰）の売上金額合計を計算の上、
両者の比率を求めよ。抽出対象はカテゴリ大区分コード"07"（瓶詰缶詰）の売上実績がある顧客のみとし、
結果を10件表示せよ。
*/
-- 全商品の売上金額合計
DROP TABLE IF EXISTS #ALL
SELECT 
	customer_id
	,SUM(amount) AS sum_amount
INTO #ALL
FROM receipt WITH(NOLOCK)
GROUP BY customer_id
SELECT * FROM #ALL

-- カテゴリ大区分コード（category_major_cd）が"07"（瓶詰缶詰）の売上金額合計
DROP TABLE IF EXISTS #CMC07
SELECT
	customer_id
	,SUM(amount) AS sum_amount_cmc_07
INTO #CMC07
FROM receipt WITH(NOLOCK)
LEFT JOIN product WITH(NOLOCK)
ON product.product_cd = receipt.product_cd
WHERE product.category_major_cd = '07'
GROUP BY customer_id
SELECT * FROM #CMC07

-- 比率
SELECT
	#ALL.customer_id
	,#ALL.sum_amount
	,#CMC07.sum_amount_cmc_07
	,CONVERT(float, #CMC07.sum_amount_cmc_07) / #ALL.sum_amount AS rate_of_cmc_07
FROM #ALL WITH(NOLOCK)
INNER JOIN #CMC07 WITH(NOLOCK)
ON #ALL.customer_id = #CMC07.customer_id


/*
> S-070: レシート明細データ（receipt）の売上日（sales_ymd）に対し、
顧客データ（customer）の会員申込日（application_date）からの経過日数を計算し、
顧客ID（customer_id）、売上日、会員申込日とともに10件表示せよ
（sales_ymdは数値、application_dateは文字列でデータを保持している点に注意）。
*/
DROP TABLE IF EXISTS #1
SELECT
	receipt.customer_id
	,CONVERT(DATE, CONVERT(CHAR(8), sales_ymd))  AS 売上日 -- int
	,CONVERT(DATE, customer.application_date) AS 会員申込日 --nvarchar
INTO #1
FROM receipt WITH(NOLOCK)
LEFT JOIN customer WITH(NOLOCK)
ON customer.customer_id = receipt.customer_id
WHERE customer.customer_id NOT LIKE 'Z%'
SELECT * FROM #1

SELECT 
	customer_id
	,売上日
	,会員申込日
	,DATEDIFF(DAY, 会員申込日, 売上日) AS 経過日数
FROM #1


/*
> S-071: レシート明細データ（receipt）の売上日（sales_ymd）に対し、
顧客データ（customer）の会員申込日（application_date）からの経過月数を計算し、
顧客ID（customer_id）、売上日、会員申込日とともに10件表示せよ
（sales_ymdは数値、application_dateは文字列でデータを保持している点に注意）。
1ヶ月未満は切り捨てること。
*/

DROP TABLE IF EXISTS #1
SELECT
	receipt.customer_id
	,CONVERT(DATE, CONVERT(CHAR(8), sales_ymd))  AS 売上日 -- int
	,CONVERT(DATE, customer.application_date) AS 会員申込日 --nvarchar
INTO #1
FROM receipt WITH(NOLOCK)
LEFT JOIN customer WITH(NOLOCK)
ON customer.customer_id = receipt.customer_id
WHERE customer.customer_id NOT LIKE 'Z%'
SELECT * FROM #1

SELECT 
	customer_id
	,売上日
	,会員申込日
	,DATEDIFF(MONTH, 会員申込日, 売上日) AS 経過月数
FROM #1

/*
> S-072: レシート明細データ（receipt）の売上日（sales_ymd）に対し、
顧客データ（customer）の会員申込日（application_date）からの経過年数を計算し、
顧客ID（customer_id）、売上日、会員申込日とともに10件表示せよ
（sales_ymdは数値、application_dateは文字列でデータを保持している点に注意）。
1年未満は切り捨てること。
*/

DROP TABLE IF EXISTS #1
SELECT
	receipt.customer_id
	,CONVERT(DATE, CONVERT(CHAR(8), sales_ymd))  AS 売上日 -- int
	,CONVERT(DATE, customer.application_date) AS 会員申込日 --nvarchar
INTO #1
FROM receipt WITH(NOLOCK)
LEFT JOIN customer WITH(NOLOCK)
ON customer.customer_id = receipt.customer_id
WHERE customer.customer_id NOT LIKE 'Z%'
SELECT * FROM #1

SELECT 
	customer_id
	,売上日
	,会員申込日
	,DATEDIFF(YEAR, 会員申込日, 売上日) AS 経過年数
FROM #1

/*
> S-073: レシート明細データ（receipt）の売上日（sales_ymd）に対し、
顧客データ（customer）の会員申込日（application_date）からのエポック秒による経過時間を計算し、
顧客ID（customer_id）、売上日、会員申込日とともに10件表示せよ
（なお、sales_ymdは数値、application_dateは文字列でデータを保持している点に注意）。
なお、時間情報は保有していないため各日付は0時0分0秒を表すものとする。
*/
DROP TABLE IF EXISTS #1
SELECT
	receipt.customer_id
	,CONVERT(DATE, CONVERT(CHAR(8), sales_ymd))  AS 売上日 -- int
	,CONVERT(DATE, customer.application_date) AS 会員申込日 --nvarchar
INTO #1
FROM receipt WITH(NOLOCK)
LEFT JOIN customer WITH(NOLOCK)
ON customer.customer_id = receipt.customer_id
WHERE customer.customer_id NOT LIKE 'Z%'
SELECT * FROM #1

SELECT 
	customer_id
	,売上日
	,会員申込日
	,DATEDIFF(SECOND, 会員申込日, 売上日) AS 経過秒数
FROM #1

/*
> S-074: レシート明細データ（receipt）の売上日（sales_ymd）に対し、
当該週の月曜日からの経過日数を計算し、
売上日、直前の月曜日付とともに10件表示せよ（sales_ymdは数値でデータを保持している点に注意）。
*/
DROP TABLE IF EXISTS #1
SELECT 
	TOP 1000
	customer_id
	,CONVERT(DATE, CONVERT(CHAR(8), sales_ymd)) as 売上日
INTO #1
FROM receipt WITH(NOLOCK)
SELECT * FROM #1

SELECT 
	customer_id
	,売上日
	,DATEPART(WEEKDAY, 売上日) AS 売上日_曜日
	,CASE
		WHEN DATEPART(WEEKDAY, 売上日) = 1 --日曜日
			THEN DATEADD(DAY, -6, 売上日)
		ELSE
			DATEADD(DAY, -DATEPART(WEEKDAY, 売上日) + 2, 売上日) 
	END AS 直前の月曜日
FROM #1 WITH(NOLOCK)


-- 曜日取得例
-- https://memo.itsysgroup.com/?p=1530
select name 
from syslanguages 
where langid=(select value from sys.configurations where name='default language')

SET LANGUAGE JAPANESE;
SELECT 
	DATEPART(WEEKDAY, GETDATE()) AS 曜日コード -- INT 1:日,2:月,...,7:土
	,DATENAME(WEEKDAY, GETDATE()) AS 曜日名 -- 言語に依存



/*
> S-075: 顧客データ（customer）からランダムに1%のデータを抽出し、先頭から10件表示せよ。
*/
-- NEWID()で一意なidを割り振り、これをソートして乱数として使う
SELECT TOP (1)PERCENT
	*
FROM customer WITH(NOLOCK)
ORDER BY NEWID()

/*
> S-076: 顧客データ（customer）から性別コード（gender_cd）の割合に基づき
ランダムに10%のデータを層化抽出し、
性別コードごとに件数を集計せよ。
*/
-- https://www.softel.co.jp/blogs/tech/archives/3267?utm_source=pocket_mylist
DROP TABLE IF EXISTS #1
SELECT
	COUNT(*) AS total
	,COUNT(CASE WHEN gender_cd = '0' THEN 1 ELSE NULL END) AS male
	,COUNT(CASE WHEN gender_cd = '1' THEN 1 ELSE NULL END) AS female
	,COUNT(CASE WHEN gender_cd = '9' THEN 1 ELSE NULL END) AS unknown
INTO #1
FROM customer WITH(NOLOCK)

-- 乱数を振る
DROP TABLE IF EXISTS #2
SELECT
	*
	,ROW_NUMBER() OVER(PARTITION BY gender_cd ORDER BY NEWID()) AS row#
INTO #2
FROM customer WITH(NOLOCK)
SELECT * FROM #2

-- サンプリング
DECLARE @rate_male float
DECLARE @rate_female float
DECLARE @rate_unknown float
DECLARE @N int

SELECT
	@rate_male = CONVERT(float, male) / total
	,@rate_female = CONVERT(float, female) / total
	,@rate_unknown = CONVERT(float, unknown) / total
	,@N = total * 0.1
FROM #1
SELECT @rate_male, @rate_female, @rate_unknown, @N

SELECT 
	*
FROM #2
WHERE (gender_cd = '0' AND row# < @N * @rate_male)
	OR (gender_cd = '1' AND row# < @N * @rate_female)
	OR (gender_cd = '9' AND row# < @N * @rate_unknown)
	
/*
> S-077: レシート明細データ（receipt）の売上金額を顧客単位に合計し、合計した売上金額の外れ値を抽出せよ。
なお、外れ値は売上金額合計を対数化したうえで平均と標準偏差を計算し、その平均から3σを超えて離れたものとする
（自然対数と常用対数のどちらでも可）。結果は10件表示せよ。
*/

/*
> S-078: レシート明細データ（receipt）の売上金額（amount）を顧客単位に合計し、合計した売上金額の外れ値を抽出せよ。
ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること。
なお、ここでは外れ値を第1四分位と第3四分位の差であるIQRを用いて、「第1四分位数-1.5×IQR」を下回るもの、
または「第3四分位数+1.5×IQR」を超えるものとする。結果は10件表示せよ。
*/

/*
> S-079: 商品データ（product）の各項目に対し、欠損数を確認せよ。
*/

/*
> S-080: 商品データ（product）のいずれかの項目に欠損が発生しているレコードを全て削除した新たな商品データを作成せよ。

なお、削除前後の件数を表示させ、079で確認した件数だけ減少していることも確認すること。
*/

/*

*/