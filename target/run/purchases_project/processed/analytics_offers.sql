
  create view "postgres"."warehouse"."analytics_offers__dbt_tmp" as (
    /*
    Defines a final analytical flat table with offers data
*/

WITH offers AS 
     (
     SELECT category
            , company
            , brand
            , min(quantity) AS quantity
            , MIN(offervalue) AS offervalue
            , COUNT(offer) offerquantity
       FROM "postgres"."warehouse"."stg_offers"
       GROUP BY 1, 2, 3
     )

SELECT *
  FROM offers
  );
