# Sales Engine

Sales Engine is an app that uses sales data from Etsy to perform sales analytics and generate API request with the data.

### Table of Contents
[Purpose](https://github.com/abdullaqudrat/sales_engine#purpose)

[Technologies Used](https://github.com/abdullaqudrat/sales_engine#technologies-used)

[System dependencies](https://github.com/abdullaqudrat/sales_engine#system-dependencies)

[Cloning this Repo](https://github.com/abdullaqudrat/sales_engine#cloning-this-repo)

[Testing](https://github.com/abdullaqudrat/sales_engine#testing)

* [API Endpoints](https://github.com/abdullaqudrat/sales_engine#api-endpoints)
  - [Index Record Endpoints](https://github.com/abdullaqudrat/sales_engine#index-record-endpoints)
  - [Show Record Endpoints](https://github.com/abdullaqudrat/sales_engine#show-record-endpoints)
  - [Find Endpoints](https://github.com/abdullaqudrat/sales_engine#find-endpoints)
  - [Random Endpoints](https://github.com/abdullaqudrat/sales_engine#random-endpoints)
  - [`/api/v1/invoice_items` Endpoints](https://github.com/abdullaqudrat/sales_engine#apiv1invoice-items-endpoints)
  - [`/api/v1/transactions` Endpoints](https://github.com/abdullaqudrat/sales_engine#apiv1transactions-endpoints)


### sample queries

* "/api/v1/items" sends all the existing items

* "/api/v1/customers/find?id=1" sends the record of the customer with ID: 1

* "/api/v1/merchants/most_revenue" sends the merchant with the most revenue generated


### Purpose

* Parsing external information, in this case, many CSV files of sales data, into the app's database.

* Using the MVC architectural pattern in Rails. The models contain the business logic and represent the sales data as objects. The controllers respond to the user input and performs interactions on the data model objects. The views displays the model data, and for this app, the controllers are the views that render the data in JSON format.

* Bulding a Rails API with RESTful web services architetural style.

* Using SQL and the Rails ORM(object relational mapping) - ActiveRecord - to access and analyze sales data in the app's database.

Visit deployed api at https://evening-garden-70150.herokuapp.com/
(This is the base URL for all api endpoints.)

### Technologies Used

- Rails 5.1
- Ruby 2.4.1
- PostgreSQL Database
- Heroku (for deployment)

## System dependencies

* 'active_model_serializers'
* 'rspec-rails'
* 'factory_bot_rails'
* 'faker'
* 'pry'
* 'shoulda-matchers'
* 'simplecov'
* 'database_cleaner'

### Cloning this repo

```
git clone https://github.com/abdullaqudrat/sales_engine.git
bundle
rake db:{create,migrate}
```
 * Additionally, run `rake csv:import` to get data into your local database.


### Testing

This API was driven by TDD and uses SimpleCov to measure test coverage.

 * Other testing tools used:
  - RSpec
  - Shoulda-Matchers
  - Factory_bot_rails
  - Mailcatcher
  
* Run `rails s` from the command line of the root directory to open a local server for api requests
* Run `rspec` from the command line of the root directory to run test suite

### API Endpoints

#### Index Record Endpoints

Each data category includes an `index` action which
renders a JSON representation of all the appropriate records:

* Customers `GET /api/v1/merchants`
* Merchants `GET /api/v1/merchants`
* Items `GET /api/v1/items`
* Invoices `GET /api/v1/invoices`
* Invoice-items `GET /api/v1/invoice_items`
* Transactions `GET /api/v1/transactions`

##### Example Request URL

**GET `/api/v1/customers`**

- This endpoint will return a list of all specified resources in the database along with their attributes.
```json
[
  {
    "id": "1",
    "first_name": "Eileen",
    "last_name": "Stamm",
  },
  {
    "id": "2",
    "first_name": "Erin",
    "last_name": "Stoll",
  },
  ...
]
```

#### Show Record Endpoints

Each data category includes an `show` action which
renders a JSON representation of all the appropriate records:

* Customers `GET /api/v1/customers/:id`
* Merchants `GET /api/v1/merchants/:id`
* Items `GET /api/v1/items/:id`
* Invoices `GET /api/v1/invoices/:id`
* Invoice-items `GET /api/v1/invoice_items/:id`
* Transactions `GET /api/v1/transactions/:id`

##### Example Request URL

**GET `/api/v1/customers/:id`**

- This endpoint will return a selected customer in the database along with it's attributes when an id is given
```json
{
  "id": "2",
  "first_name": "Erin",
  "last_name": "Stoll",
}
```

#### Find Endpoints

Each data category offera `find` finders to return a single record. The finder works with any of the attributes defined on the data type and is always case insensitive.

##### Request Parameters

* Customers `GET /api/v1/customers/find?parameter`

---
| parameter  | description                          |
|------------|--------------------------------------|
| id         | search based on the primary key      |
| first_name | search based on the name attribute   |
| last_name  | search based on the name attribute   |
| created_at | search based on created_at timestamp |
| updated_at | search based on updated_at timestamp |

---

* Merchants `GET /api/v1/merchants/find?parameter`

---
| parameter  | description                          |
|------------|--------------------------------------|
| id         | search based on the primary id       |
| name       | search based on the name attribute   |
| created_at | search based on created_at timestamp |
| updated_at | search based on updated_at timestamp |

---

* Items `GET /api/v1/items/find?parameter`

---
| parameter  | description                          |
|------------|--------------------------------------|
| id         | search based on the primary id       |
| name       | search based on the name attribute   |
| description| search based on the desc attribute   |
| merchant_id| search based on the merchant id      |
| created_at | search based on created_at timestamp |
| updated_at | search based on updated_at timestamp |

---

* Invoices `GET /api/v1/invoices/find?parameter`

---
| parameter  | description                          |
|------------|--------------------------------------|
| id         | search based on the id               |
| status     | search based on status (ex. shipped) |
| customer_id| search based on the customer id      |
| merchant_id| search based on the merchant id      |
| created_at | search based on created_at timestamp |
| updated_at | search based on updated_at timestamp |

---

* Invoice-items `GET /api/v1/invoice_items/find?parameter`

---
| parameter  | description                          |
|------------|--------------------------------------|
| id         | search based on the id               |
| quantity   | search based on quantity (ex. 5)     |
| unit_price | search based on price (ex. 13.99)    |
| invoice_id | search based on the invoice id       |
| item_id    | search based on the item id          |
| created_at | search based on created_at timestamp |
| updated_at | search based on updated_at timestamp |

---

* Transactions `GET /api/v1/transactions/find?parameter`

---
| parameter          | description                                         |
|--------------------|-----------------------------------------------------|
| id                 | search based on the id                              |
| result             | search based on result (ex. success or failed)      |
| credit_card_number | search based on cc # (ex. 4654405418249632)         |
| invoice_id         | search based on the invoice id                      |
| created_at         | search based on created_at timestamp                |
| updated_at         | search based on updated_at timestamp                |

---

##### Example Request URL

`GET /api/v1/customers/find?first_name=Erin`

##### JSON Output

```json
{
  "id": "2",
  "first_name": "Erin",
  "last_name": "Stoll",
}
```

##### Request Parameters

* Customers `GET /api/v1/customers/find_all?parameter`

---
| parameter  | description                          |
|------------|--------------------------------------|
| id         | search based on the primary key      |
| first_name | search based on the name attribute   |
| last_name  | search based on the name attribute   |
| created_at | search based on created_at timestamp |
| updated_at | search based on updated_at timestamp |

---

* Merchants `GET /api/v1/merchants/find_all?parameter`

---
| parameter  | description                          |
|------------|--------------------------------------|
| id         | search based on the primary id       |
| name       | search based on the name attribute   |
| created_at | search based on created_at timestamp |
| updated_at | search based on updated_at timestamp |

---

* Items `GET /api/v1/items/find_all?parameter`

---
| parameter  | description                          |
|------------|--------------------------------------|
| id         | search based on the primary id       |
| name       | search based on the name attribute   |
| description| search based on the desc attribute   |
| merchant_id| search based on the merchant id      |
| created_at | search based on created_at timestamp |
| updated_at | search based on updated_at timestamp |

---

* Invoices `GET /api/v1/invoices/find_all?parameter`

---
| parameter  | description                          |
|------------|--------------------------------------|
| id         | search based on the id               |
| status     | search based on status (ex. shipped) |
| customer_id| search based on the customer id      |
| merchant_id| search based on the merchant id      |
| created_at | search based on created_at timestamp |
| updated_at | search based on updated_at timestamp |

---

* Invoice-items `GET /api/v1/invoice_items/find_all?parameter`

---
| parameter  | description                          |
|------------|--------------------------------------|
| id         | search based on the id               |
| quantity   | search based on quantity (ex. 5)     |
| unit_price | search based on price (ex. 13.99)    |
| invoice_id | search based on the invoice id       |
| item_id    | search based on the item id          |
| created_at | search based on created_at timestamp |
| updated_at | search based on updated_at timestamp |

---

* Transactions `GET /api/v1/transactions/find_all?parameter`

---
| parameter          | description                                         |
|--------------------|-----------------------------------------------------|
| id                 | search based on the id                              |
| result             | search based on result (ex. success or failed)      |
| credit_card_number | search based on cc # (ex. 4654405418249632)         |
| invoice_id         | search based on the invoice id                      |
| created_at         | search based on created_at timestamp                |
| updated_at         | search based on updated_at timestamp                |

---

##### Example Request URL

`GET /api/v1/customers/find_all?last_name=Stoll`

##### JSON Output

```json
[  
  {
  "id": "2",
  "first_name": "Erin",
  "last_name": "Stoll",
  },
  {
  "id": "2112",
  "first_name": "Ryan",
  "last_name": "Stoll",
  }
]
```

Note: Although this search may return one record, it still comes back in an array.


#### Random Endpoint

Will return a random resource in a selected category

* Customers `GET /api/v1/customers/random`
* Merchants `GET /api/v1/merchants/random`
* Items `GET /api/v1/items/random`
* Invoices `GET /api/v1/invoices/random`
* Invoice-items `GET /api/v1/invoice_items/random`
* Transactions `GET /api/v1/transactions/random`

##### Example Request URL

`api/v1/customers/random`


##### JSON Output

```json
{
  "id": 50,
  "name": "Nader-Hyatt"
}
```
