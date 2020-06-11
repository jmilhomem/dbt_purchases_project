/*
    Defines a final analytical flat table with transactions data by yearmonth
*/

SELECT id
       , category
       , company
       , brand
       , to_char(date, 'YYYYMM') AS yearmonth
       , purchasetype
       , hadoffer
       , haddiscount
       , SUM(purchaseamount) AS purchaseamount
       , SUM(purchasequantity) AS purchasequantity
  FROM "postgres"."warehouse"."stg_transactions_offers"
GROUP BY 1, 2, 3, 4, 5, 6, 7, 8