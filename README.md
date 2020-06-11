# DBT Purchase ETL pipeline
> This application is responsible for:
> 1. Execute the whole pipeline: ingest the transaction and offers files and apply the transformation (ETL process) using DBT.

![alt text](https://pbs.twimg.com/media/DMWhhKFXcAAqxeu?format=jpg&name=small)

## Technical detail:
- As this project is considering a limited dataset, without the domains of each id, the data modeling is considering the "flat table technique" as the data analytical modeling.

- The ETL process is divided into 3 steps (and folders):
  1. __raw:__ It has the source.yml file, which contains the source tables.
  2. __staging:__ It has the staging models, intermediate models, which has the transformations applied.
  3. __processed:__ It has the final analytical tables, which has the final transformations applied.

- The script will execute the whole pipeline.
  1. Execute the __dbt seed__ to import the files available in __/data__.
  2. Execute the __dbt run__ to execute the whole etl pipeline.
  3. Execute the __dbt test__ to run the tests regarding the models created.

## Data Files used as source:

__transactions__ - contains transaction history for all customers for a period of at least 1 year prior to their offered incentive
- __id__ - A unique id representing a customer
- __chain__ - An integer representing a store chain
- __dept__ - An aggregate grouping of the Category (e.g. water)
- __category__ - The product category (e.g. sparkling water)
- __company__ - An id of the company that sells the item
- __brand__ - An id of the brand to which the item belongs
- __date__ - The date of purchase
- __productsize__ - The amount of the product purchase (e.g. 16 oz of water)
- __productmeasure__ - The units of the product purchase (e.g. ounces)
- __purchasequantity__ - The number of units purchased
- __purchaseamount__ - The dollar amount of the purchase

__offers__ - contains information about the offers
- __offer__ - An id representing a certain offer
- __category__ - The product category (e.g. sparkling water)
- __quantity__ - The number of units one must purchase to get the discount
- __company__ - An id of the company that sells the item
- __offervalue__ - The dollar value of the offer
- __brand__ -  An id of the brand to which the item belongs

The transactions file can be joined to the offers file by (category, brand, company). A negative value in productquantity and purchaseamount indicates a return.

Reference:  
https://www.kaggle.com/c/acquire-valued-shoppers-challenge/data?select=offers.csv.gz  

## Dag Picture:
![alt text](https://github.com/jmilhomem/dbt_purchases_project/blob/master/images/data_pipeline.png)

## Dependencies:
To execute the whole pipeline (dbt seed, dbt run and dbt test):
* [get dbt installed](https://docs.getdbt.com/docs/running-a-dbt-project/using-the-command-line-interface/installation/)
* a Postgres database instance created at AWS RDS.
* profiles.yml file filled and available in __~/.dbt__ folder
* python 3.6
* make  

Execution:
* Run: ```make ``` to create the environment

## Run
Start your python virtualenv with ```source .venv/bin/activate```

* Run: ```make run``` to execute the whole pipeline following described:
  1. Execute the __dbt seed__ to import the files available in __/data__.
  2. Execute the __dbt run__ to execute the whole etl pipeline.
  3. Execute the __dbt test__ to run the tests regarding the models created.


## Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getbdt.com/) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
