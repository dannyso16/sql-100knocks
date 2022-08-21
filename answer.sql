USE testdb;

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
DROP TABLE IF EXISTS #1
SELECT 
	customer_id
	,SUM(amount) AS sum_amount
INTO #1
FROM receipt WITH(NOLOCK)
--WHERE customer_id NOT LIKE 'Z%'
GROUP BY customer_id

--平均と標準偏差　計算
DECLARE @avg float
DECLARE @std float

SELECT
	@avg = AVG(LOG(sum_amount))
	,@std = STDEVP(LOG(sum_amount))
FROM #1
SELECT @avg, @std

--外れ値出力
SELECT 
	customer_id
	,sum_amount
	--,LOG(sum_amount) AS log_sum_amount
	--,@avg - 3 * @std AS avg_minus_3sigma
	--,@avg + 3 * @std AS avg_plos_3sigma
FROM #1
WHERE LOG(sum_amount) < @avg - 3*@std
	OR @avg + 3*@std < LOG(sum_amount)

/*
> S-078: レシート明細データ（receipt）の売上金額（amount）を顧客単位に合計し、合計した売上金額の外れ値を抽出せよ。
ただし、顧客IDが"Z"から始まるのものは非会員を表すため、除外して計算すること。
なお、ここでは外れ値を第1四分位と第3四分位の差であるIQRを用いて、「第1四分位数-1.5×IQR」を下回るもの、
または「第3四分位数+1.5×IQR」を超えるものとする。結果は10件表示せよ。
*/

DROP TABLE IF EXISTS #1
SELECT 
	customer_id
	,SUM(amount) AS sum_amount
INTO #1
FROM receipt WITH(NOLOCK)
WHERE customer_id NOT LIKE 'Z%'
GROUP BY customer_id

--IQR 計算
DECLARE @p1 float
DECLARE @p3 float
DECLARE @iqr float

SELECT TOP 1
	@p1 = PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY sum_amount) OVER() 
	,@p3 = PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY sum_amount) OVER()
FROM #1

SET @iqr = @p3 - @p1

--外れ値出力
SELECT 
	customer_id
	,sum_amount
	,@p1 - 1.5*@iqr
	,@p3 + 1.5*@iqr
FROM #1
WHERE sum_amount < @p1 - 1.5*@iqr
	OR @p3 + 1.5*@iqr < sum_amount

/*
> S-079: 商品データ（product）の各項目に対し、欠損数を確認せよ。
*/
SELECT
	 COUNT(CASE WHEN product_cd         IS NULL THEN 1 ELSE NULL END) AS cnt_null_product_cd
	,COUNT(CASE WHEN category_major_cd  IS NULL THEN 1 ELSE NULL END) AS cnt_null_cmac
	,COUNT(CASE WHEN category_medium_cd IS NULL THEN 1 ELSE NULL END) AS cnt_null_cmec
	,COUNT(CASE WHEN category_small_cd  IS NULL THEN 1 ELSE NULL END) AS cnt_null_csc
	,COUNT(CASE WHEN unit_price         IS NULL THEN 1 ELSE NULL END) AS cnt_null_unit_price
	,COUNT(CASE WHEN unit_cost          IS NULL THEN 1 ELSE NULL END) AS cnt_null_unit_cost
FROM product WITH(NOLOCK)


/*
> S-080: 商品データ（product）のいずれかの項目に欠損が発生しているレコードを全て削除した新たな商品データを作成せよ。

なお、削除前後の件数を表示させ、079で確認した件数だけ減少していることも確認すること。
*/
SELECT COUNT(*) FROM product --10030

DROP TABLE IF EXISTS #product_0null
SELECT *
INTO #product_0null
FROM product WITH(NOLOCK)
WHERE product_cd          IS NOT NULL
	AND category_major_cd  IS NOT NULL
	AND category_medium_cd IS NOT NULL
	AND category_small_cd  IS NOT NULL
	AND unit_price         IS NOT NULL
	AND unit_cost          IS NOT NULL


/*
> S-081: 単価（unit_price）と原価（unit_cost）の欠損値について、
それぞれの平均値で補完した新たな商品データを作成せよ。
なお、平均値については1円未満を丸めること（四捨五入または偶数への丸めで良い）。
補完実施後、各項目について欠損が生じていないことも確認すること。
*/

DECLARE @avg_unit_price int
DECLARE @avg_unit_cost int

SELECT
	@avg_unit_price = AVG(unit_price)
	,@avg_unit_cost = AVG(unit_cost)
FROM product

DROP TABLE IF EXISTS #product2
SELECT
	product_cd
	,category_major_cd
	,category_medium_cd
	,category_small_cd
	,COALESCE(unit_price, @avg_unit_price) AS unit_price
	,COALESCE(unit_cost, @avg_unit_cost) AS unit_cost
INTO #product2
FROM product 
SELECT * FROM #product2

--NULLがないことを確認
SELECT
	 COUNT(CASE WHEN product_cd         IS NULL THEN 1 ELSE NULL END) AS cnt_null_product_cd
	,COUNT(CASE WHEN category_major_cd  IS NULL THEN 1 ELSE NULL END) AS cnt_null_cmac
	,COUNT(CASE WHEN category_medium_cd IS NULL THEN 1 ELSE NULL END) AS cnt_null_cmec
	,COUNT(CASE WHEN category_small_cd  IS NULL THEN 1 ELSE NULL END) AS cnt_null_csc
	,COUNT(CASE WHEN unit_price         IS NULL THEN 1 ELSE NULL END) AS cnt_null_unit_price
	,COUNT(CASE WHEN unit_cost          IS NULL THEN 1 ELSE NULL END) AS cnt_null_unit_cost
FROM #product2


/*
> S-082: 単価（unit_price）と原価（unit_cost）の欠損値について、
それぞれの中央値で補完した新たな商品データを作成せよ。
なお、中央値については1円未満を丸めること（四捨五入または偶数への丸めで良い）。
補完実施後、各項目について欠損が生じていないことも確認すること。
*/

DECLARE @median_unit_price int
DECLARE @median_unit_cost int

SELECT
	@median_unit_price = PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY unit_price) OVER() 
	,@median_unit_cost = PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY unit_cost) OVER()
FROM product

DROP TABLE IF EXISTS #product2
SELECT
	product_cd
	,category_major_cd
	,category_medium_cd
	,category_small_cd
	,COALESCE(unit_price, @median_unit_price) AS unit_price
	,COALESCE(unit_cost, @median_unit_cost) AS unit_cost
INTO #product2
FROM product 
SELECT * FROM #product2

--NULLがないことを確認
SELECT
	 COUNT(CASE WHEN product_cd         IS NULL THEN 1 ELSE NULL END) AS cnt_null_product_cd
	,COUNT(CASE WHEN category_major_cd  IS NULL THEN 1 ELSE NULL END) AS cnt_null_cmac
	,COUNT(CASE WHEN category_medium_cd IS NULL THEN 1 ELSE NULL END) AS cnt_null_cmec
	,COUNT(CASE WHEN category_small_cd  IS NULL THEN 1 ELSE NULL END) AS cnt_null_csc
	,COUNT(CASE WHEN unit_price         IS NULL THEN 1 ELSE NULL END) AS cnt_null_unit_price
	,COUNT(CASE WHEN unit_cost          IS NULL THEN 1 ELSE NULL END) AS cnt_null_unit_cost
FROM #product2

/*
> S-083: 単価（unit_price）と原価（unit_cost）の欠損値について、
各商品のカテゴリ小区分コード（category_small_cd）ごとに算出した中央値で補完した新たな商品データを作成せよ。
なお、中央値については1円未満を丸めること（四捨五入または偶数への丸めで良い）。
補完実施後、各項目について欠損が生じていないことも確認すること。
*/

WITH MEDIAN AS (
	SELECT
		product_cd
		,category_small_cd
		,PERCENTILE_CONT(0.5)
			WITHIN GROUP (ORDER BY unit_price)
			OVER(PARTITION BY category_small_cd) AS median_unit_price
		,PERCENTILE_CONT(0.5) 
			WITHIN GROUP (ORDER BY unit_cost) 
			OVER(PARTITION BY category_small_cd) AS median_unit_cost
	FROM product
)
SELECT
	product.product_cd
	,product.category_major_cd
	,product.category_medium_cd
	,product.category_small_cd
	,COALESCE(product.unit_price, MEDIAN.median_unit_price) AS unit_price
	,COALESCE(product.unit_cost, MEDIAN.median_unit_cost) AS unit_cost
FROM product
LEFT JOIN MEDIAN
	ON MEDIAN.product_cd = product.product_cd


/*
> S-084: 顧客データ（customer）の全顧客に対して
全期間の売上金額に占める2019年売上金額の割合を計算し、新たなデータを作成せよ。
ただし、売上実績がない場合は0として扱うこと。そして計算した割合が0超のものを抽出し、
結果を10件表示せよ。また、作成したデータに欠損が存在しないことを確認せよ。
*/
WITH R19 AS (
	SELECT
		customer_id
		,SUM(amount) AS sum_amount
	FROM receipt
	WHERE sales_ymd LIKE '2019%'
	GROUP BY customer_id
)
,RAll AS (
	SELECT
		customer_id
		,SUM(amount) AS sum_amount
	FROM receipt
	GROUP BY customer_id
)
SELECT
	RAll.customer_id
	,COALESCE(
		R19.sum_amount / RAll.sum_amount * 100
		,0) AS rate_all_vs_19
FROM RAll
LEFT JOIN R19
ON RAll.customer_id = R19.customer_id

/*
> S-085: 顧客データ（customer）の全顧客に対し、
郵便番号（postal_cd）を用いてジオコードデータ（geocode）を紐付け、
新たな顧客データを作成せよ。ただし、1つの郵便番号（postal_cd）に
複数の経度（longitude）、緯度（latitude）情報が紐づく場合は、
経度（longitude）、緯度（latitude）の平均値を算出して使用すること。
また、作成結果を確認するために結果を10件表示せよ。
*/
DROP TABLE IF EXISTS #85
WITH G AS (
	SELECT
		postal_cd
		,AVG(longitude) AS longitude
		,AVG(latitude) AS latitude
	FROM geocode
	GROUP BY postal_cd
)
SELECT
	customer.*
	,G.longitude
	,G.latitude
INTO #85
FROM customer
LEFT JOIN G
ON G.postal_cd = customer.postal_cd
SELECT * FROM #85


/*
> S-086: 085で作成した緯度経度つき顧客データに対し、
会員申込店舗コード（application_store_cd）をキーに店舗データ（store）と結合せよ。
そして申込み店舗の緯度（latitude）・経度情報（longitude)と顧客住所（address）の緯度・経度を用いて
申込み店舗と顧客住所の距離（単位：km）を求め、
顧客ID（customer_id）、顧客住所（address）、店舗住所（address）とともに表示せよ。
計算式は以下の簡易式で良いものとするが、その他精度の高い方式を利用したライブラリを利用してもかまわない。
結果は10件表示せよ。

ϕ:緯度（latitude）
λ:経度（longitude)
赤道半径：6371 KM	
距離L=6371∗arccos(sinϕ1∗sinϕ2+cosϕ1∗cosϕ2∗cos(λ1−λ2))
参考：https://qiita.com/port-development/items/eea3a0a225be47db0fd4
*/
SELECT customer_id
	,#85.address AS [顧客住所]
	,store.address AS [店舗住所]
	--,RADIANS(#85.longitude) AS [顧客経度(rad)]
	--ϕ:緯度（latitude）
	--λ:経度（longitude)
	--赤道半径：6371 KM
	--距離L=6371∗arccos(sinϕ1∗sinϕ2+cosϕ1∗cosϕ2∗cos(λ1−λ2))
	,6371 * ACOS(
		SIN(RADIANS(#85.latitude)) * SIN(RADIANS(store.latitude))
		+ COS(RADIANS(#85.latitude)) * COS(RADIANS(store.latitude)) 
			* COS(RADIANS(#85.longitude) - RADIANS(store.longitude))
		) AS [顧客-店舗距離(km)]
	,*
FROM #85
LEFT JOIN store WITH(NOLOCK)
ON #85.application_store_cd = store.store_cd


/*
> S-087: 顧客データ（customer）では、異なる店舗での申込みなどにより同一顧客が複数登録されている。
名前（customer_name）と郵便番号（postal_cd）が同じ顧客は同一顧客とみなして
1顧客1レコードとなるように名寄せした名寄顧客データを作成し、
顧客データの件数、名寄顧客データの件数、重複数を算出せよ。
ただし、同一顧客に対しては売上金額合計が最も高いものを残し、
売上金額合計が同一もしくは売上実績がない顧客については顧客ID（customer_id）の番号が小さいものを残すこととする。
*/

--重複を確認
WITH A AS (
	SELECT 
		customer_name
		,postal_cd
		,COUNT(*) AS CNT
	FROM customer
	GROUP BY customer_name, postal_cd
)
SELECT TOP 1000
	*
FROM customer
LEFT JOIN A
ON A.customer_name = customer.customer_name
	AND A.postal_cd = customer.postal_cd
ORDER BY A.CNT DESC, A.customer_name

--名寄せデータ
DROP TABLE IF EXISTS #87_1
WITH S AS (
	SELECT
		customer_id
		,SUM(amount) AS sum_amount
	FROM receipt
	GROUP BY customer_id
)
SELECT 
	C.*
	,S.sum_amount
INTO #87_1
FROM customer AS C
LEFT JOIN S
ON S.customer_id = C.customer_id

select * from #87_1 --21971
select * from customer --21971

--21941
DROP TABLE IF EXISTS #87
SELECT
	MIN(MAIN.customer_id) AS customer_id --sum_amountが同一の場合
	,MAIN.customer_name
	,MAIN.postal_cd
	--,MAIN.sum_amount
INTO #87
FROM #87_1 AS MAIN
LEFT JOIN (
	SELECT --21941
		customer_name
		,postal_cd
		,MAX(sum_amount) AS sum_amount
	FROM #87_1
	GROUP BY customer_name, postal_cd
) AS MAX_SUM
ON MAIN.customer_name = MAX_SUM.customer_name
	AND MAIN.postal_cd = MAX_SUM.postal_cd
	AND MAIN.sum_amount = MAX_SUM.sum_amount
GROUP BY MAIN.customer_name
	,MAIN.postal_cd
	--,MAIN.sum_amount
ORDER BY MAIN.customer_name, MAIN.postal_cd


/*
> S-088: 087で作成したデータを元に、顧客データに統合名寄IDを付与したデータを作成せよ。
ただし、統合名寄IDは以下の仕様で付与するものとする。
>
> - 重複していない顧客：顧客ID（customer_id）を設定
> - 重複している顧客：前設問で抽出したレコードの顧客IDを設定
> 
> 顧客IDのユニーク件数と、統合名寄IDのユニーク件数の差も確認すること。
*/
SELECT * FROM #87

WITH CNT AS (
	SELECT
		customer_name
		,postal_cd
		,COUNT(*) AS cnt
	FROM customer
	GROUP BY customer_name, postal_cd
	--ORDER BY COUNT(*) DESC
)
SELECT
	CASE
		WHEN CNT.cnt = 1 THEN C.customer_id
		ELSE NO87.customer_id END AS customer_id
	,CNT.cnt
	,C.*
FROM customer AS C
LEFT JOIN CNT
ON CNT.customer_name = C.customer_name
	AND CNT.postal_cd = C.postal_cd
LEFT JOIN #87 AS NO87
ON NO87.customer_name = C.customer_name
	AND NO87.postal_cd = C.postal_cd
ORDER BY CNT.cnt DESC, C.customer_name

/*
> S-089: 売上実績がある顧客を、予測モデル構築のため学習用データとテスト用データに分割したい。
それぞれ8:2の割合でランダムにデータを分割せよ。
*/

/* パターン1: ROW_NUMBERで連番生成→分割*/
DECLARE @sep INT
SELECT @sep = CONVERT(INT, 0.8*COUNT(*)) FROM #87_1 WHERE sum_amount IS NOT NULL
SELECT @sep

DROP TABLE IF EXISTS #89TMP
SELECT
	CASE WHEN ROW_NUMBER() OVER (ORDER BY NEWID()) < @sep THEN 'TRAIN'
	ELSE 'TEST' END AS TRAINorTEST
	,*
INTO #89TMP
FROM #87_1
WHERE sum_amount IS NOT NULL
SELECT * FROM #89TMP

--分割
SELECT * FROM #89TMP
WHERE TRAINorTEST = 'TRAIN'

SELECT * FROM #89TMP
WHERE TRAINorTEST = 'TEST'

/*パターン２:NTILEを活用(何番目のデータで分割するか計算不要)
 NTILE(N) でデータをN分割できる。１～Nで値が帰る*/
DROP TABLE IF EXISTS #89TMP
SELECT
	CASE WHEN NTILE(10) OVER (ORDER BY NEWID()) <= 8 THEN 'TRAIN'
	ELSE 'TEST' END AS TRAINorTEST
	,*
INTO #89TMP
FROM #87_1
WHERE sum_amount IS NOT NULL
SELECT * FROM #89TMP

/*
> S-090: レシート明細データ（receipt）は2017年1月1日〜2019年10月31日までのデータを有している。
売上金額（amount）を月次で集計し、学習用に12ヶ月、テスト用に6ヶ月の時系列モデル構築用データを3セット作成せよ。
*/
--データ期間を確認
SELECT 
	MAX(sales_ymd) AS max_sales_ymd
	,MIN(sales_ymd) AS min_sales_ymd
FROM receipt

--月ごとに集計
DROP TABLE IF EXISTS #90TMP
SELECT
	customer_id
	,CONVERT(INT, LEFT(sales_ymd,6)) AS sales_month
	,SUM(amount) AS sum_amount
INTO #90TMP
FROM receipt
GROUP BY customer_id, LEFT(sales_ymd,6)
ORDER BY LEFT(sales_ymd,6)

--分割
SELECT * FROM #90TMP 
WHERE sales_month <= 201801 --train1
ORDER BY sales_month

SELECT * FROM #90TMP 
WHERE 201801 < sales_month AND sales_month <= 201807 --test1
ORDER BY sales_month



/*
> S-091: 顧客データ（customer）の各顧客に対し、
売上実績がある顧客数と売上実績がない顧客数が1:1となるようにアンダーサンプリングで抽出せよ。
*/
DROP TABLE IF EXISTS #J
SELECT 
	CASE WHEN R.customer_id IS NOT NULL THEN '1'
		ELSE '0' END AS [売上実績]
	,C.*
INTO #J
FROM customer AS C
LEFT JOIN (
	SELECT DISTINCT(customer_id) AS customer_id
	FROM receipt
	) AS R
ON R.customer_id = C.customer_id
SELECT * FROM #J

--実績なしの法が多い
WITH R AS (
	SELECT
		*
		,ROW_NUMBER() OVER (PARTITION BY [売上実績] ORDER BY NEWID()) AS row#
	FROM #J
)
SELECT *
FROM R
WHERE row# <= (
	SELECT
		--実績あり、なしの個数が小さいほうの値を使う
		CASE WHEN SUM(CASE WHEN [売上実績] = '1' THEN 1 ELSE 0 END) 
			< SUM(CASE WHEN [売上実績] = '0' THEN 1 ELSE 0 END) 
			THEN SUM(CASE WHEN [売上実績] = '1' THEN 1 ELSE 0 END)
			ELSE SUM(CASE WHEN [売上実績] = '0' THEN 1 ELSE 0 END) END
	FROM #J
)

/*
> S-092: 顧客データ（customer）の性別について、第三正規形へと正規化せよ。
*/
EXECUTE SP_HELP customer
SELECT * FROM customer

/*
第二正規形を第三正規形にするには、主キーとなる項目以外の値によって、
他の項目の内容が決定されないようにテーブルを分離することによって行われる。

gender_cd -> gender
*/
DROP TABLE IF EXISTS #customer2
SELECT
	customer_id
	,customer_name
	,gender_cd
	--,gender
	,birth_day
	,age
	,postal_cd
	,address
	,application_store_cd
	,application_date
	,status_cd
INTO #customer2
FROM customer


--GENDERマスタ
DROP TABLE IF EXISTS #gender
CREATE TABLE #gender (
	gender_cd	NVARCHAR(2) NOT NULL PRIMARY KEY
	,gender	NVARCHAR(7) NOT NULL
)
INSERT INTO #gender VALUES ('0', 'Male')
INSERT INTO #gender VALUES ('1', 'Female')
INSERT INTO #gender VALUES ('9', 'Unknown')
SELECT * FROM #gender

SELECT
	*
FROM #customer2 AS C
LEFT JOIN #gender AS G
ON C.gender_cd = G.gender_cd

/*
> S-093: 商品データ（product）では各カテゴリのコード値だけを保有し、カテゴリ名は保有していない。
カテゴリデータ（category）と組み合わせて非正規化し、カテゴリ名を保有した新たな商品データを作成せよ。
*/
SELECT * FROM product
SELECT * FROM category
exec sp_help category

DROP TABLE IF EXISTS #93
SELECT
	P.product_cd
	,P.category_major_cd
	,C1.category_major_name
	,P.category_medium_cd
	,C1.category_medium_name
	,P.category_small_cd
	,C1.category_small_name
	,P.unit_price
	,P.unit_cost
INTO #93
FROM product AS P
LEFT JOIN category AS C1
ON C1.category_small_cd = P.category_small_cd

SELECT * FROM #93

/*
---
> S-094: 093で作成したカテゴリ名付き商品データを以下の仕様でファイル出力せよ。
> 
> |ファイル形式|ヘッダ有無|文字エンコーディング|
> |CSV（カンマ区切り）|有り|UTF-8|
> 
> ファイル出力先のパスは以下のようにすること（COPYコマンドの権限は付与済み）。
> |/tmp/data|
*/

/*
---
> S-095: 093で作成したカテゴリ名付き商品データを以下の仕様でファイル出力せよ。
> 
> |ファイル形式|ヘッダ有無|文字エンコーディング|
> |CSV（カンマ区切り）|有り|CP932|
> 
> PostgreSQLではShift_JISを指定することでCP932相当となる。
ファイル出力先のパスは以下のようにすること（COPYコマンドの権限は付与済み）。
> |/tmp/data|
*/

/*
---
> S-096: 093で作成したカテゴリ名付き商品データを以下の仕様でファイル出力せよ。
> 
> |ファイル形式|ヘッダ有無|文字エンコーディング|
> |CSV（カンマ区切り）|無し|UTF-8|
> 
> ファイル出力先のパスは以下のようにすること（COPYコマンドの権限は付与済み）。
> |/tmp/data|
*/

/*
---
> S-097: 094で作成した以下形式のファイルを読み込み、データを3件を表示させて正しく取り込まれていることを確認せよ。
> 
> |ファイル形式|ヘッダ有無|文字エンコーディング|
> |CSV（カンマ区切り）|有り|UTF-8|
*/

/*
---
> S-098: 096で作成した以下形式のファイルを読み込み、データを3件を表示させて正しく取り込まれていることを確認せよ。
> 
> |ファイル形式|ヘッダ有無|文字エンコーディング|
> |CSV（カンマ区切り）|ヘッダ無し|UTF-8|
*/

/*
---
> S-099: 093で作成したカテゴリ名付き商品データを以下の仕様でファイル出力せよ。
> 
> |ファイル形式|ヘッダ有無|文字エンコーディング|
> |TSV（タブ区切り）|有り|UTF-8|
> 
> ファイル出力先のパスは以下のようにすること（COPYコマンドの権限は付与済み）。
> 
> |出力先|
> |/tmp/data|
*/

/*
---
> S-100: 099で作成した以下形式のファイルを読み込み、データを3件を表示させて正しく取り込まれていることを確認せよ。
> 
> |ファイル形式|ヘッダ有無|文字エンコーディング|
> |TSV（タブ区切り）|有り|UTF-8|
*/
