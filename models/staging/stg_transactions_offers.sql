
/*
    Defines a stage table which defines the hadoffer and haddiscount flags 
*/

WITH offers AS 
     (
      SELECT *
        FROM {{ ref('stg_offers') }}
       WHERE mostrecent = 1
     )
     , source_data AS 
     (
     SELECT transactions.id
            , transactions.dept
            , transactions.chain
            , transactions.category
            , transactions.company
            , transactions.brand
            , transactions.date
            , transactions.productsize
            , transactions.productmeasure
            , transactions.purchasequantity
            , transactions.purchaseamount
            , transactions.purchasetype
            , CASE WHEN purchaseamount > 0
                        AND offers.quantity IS NOT NULL THEN 'Yes'
                   ELSE 'No'
              END hadoffer
            , CASE WHEN purchasequantity >= offers.quantity
                        AND purchaseamount > 0
                        THEN 'Yes'
                   ELSE 'No'
              END haddiscount
       FROM {{ ref('stg_transactions') }} transactions
            LEFT JOIN offers
                   ON transactions.category = offers.category 
                  AND transactions.brand = offers.brand
                  AND transactions.company = offers.company
     )

SELECT *
  FROM source_data
