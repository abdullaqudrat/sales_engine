# Sales Engine

Sales Engine is an app that uses sales data from Etsy to perform sales analytics and generate API request with the data.

## Ruby and Rails version

* This app requires Rails 5.1 or higher and Ruby 2.4.1 or higher

## Database creation

* After being cloned down, run "bundle" on the command line of the root to get the gems installed.

* Run "rake db:{create,migrate}" from the command line of the root to setup databases

## Database initialization

* Run "rake csv:import" from the command line of the root directory to import data into database

## How to run the test suite
* Run "rails s" from the command line of the root directory to open a local server for api requests
* Run "rspec" from the command line of the root directory to run test suite

## System dependencies

* 'active_model_serializers'
* 'rspec-rails'
* 'factory_bot_rails'
* 'faker'
* 'pry'
* 'shoulda-matchers'
* 'simplecov'
* 'database_cleaner'

## Services (job queues, cache servers, search engines, etc.)

### sample queries

* "/api/v1/items" sends all the existing items

* "/api/v1/customers/find?id=1" sends the record of the customer with ID: 1

* "/api/v1/merchants/most_revenue" sends the merchant with the most revenue generated
