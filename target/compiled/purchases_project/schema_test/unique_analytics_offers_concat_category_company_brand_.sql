



select count(*)
from (

    select
        concat(category, company, brand)

    from "postgres"."warehouse"."analytics_offers"
    where concat(category, company, brand) is not null
    group by concat(category, company, brand)
    having count(*) > 1

) validation_errors

