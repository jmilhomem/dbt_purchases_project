
  create view "postgres"."warehouse"."analytics_transactions__dbt_tmp" as (
    /*
    Defines a final analytical flat table with transactions data
*/

SELECT *
  FROM "postgres"."warehouse"."stg_transactions_offers"
  );
