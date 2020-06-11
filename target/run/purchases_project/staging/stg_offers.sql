

  create  table "postgres"."warehouse"."stg_offers__dbt_tmp"
  as (
    /*
    Defines a stage table which mark the most recent row for offers when duplicated
*/

WITH source_data AS 
     (
     SELECT offer 
            , category 
            , quantity 
            , company 
            , offervalue 
            , brand 
            , row_number () over (partition by brand, category, company 
                                  ORDER BY offer DESC) AS mostrecent
       FROM "postgres"."warehouse"."offers"
     )

SELECT *
  FROM source_data
  );