



select count(*)
from "postgres"."warehouse"."analytics_transactions"
where concat(id, category, company, brand) is null

