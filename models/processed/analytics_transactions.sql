
/*
    Defines a final analytical flat table with transactions data
*/

SELECT *
  FROM {{ ref('stg_transactions_offers') }}
