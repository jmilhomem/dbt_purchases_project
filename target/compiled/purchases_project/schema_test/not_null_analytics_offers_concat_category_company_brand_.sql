



select count(*)
from "postgres"."warehouse"."analytics_offers"
where concat(category, company, brand) is null

