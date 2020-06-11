/*
    Defines a stage table which defines the return purchases
*/

with source_data 
  as (
     SELECT id
            , dept
            , chain
            , transactions.category
            , transactions.company
            , transactions.brand
            , date
            , productsize
            , productmeasure
            , purchasequantity
            , purchaseamount
            , case when purchaseamount < 0 then 'RETURN'
                  else 'PURCHASE'
              end purchasetype
       FROM "postgres"."warehouse"."transactions" transactions
     )

select *
  from source_data