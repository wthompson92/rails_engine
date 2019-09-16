# Setup

#### In the terminal run
1. `git clone git@github.com:wthompson92/rails_engine.git`
2. `cd rails_engine`
3. `rails db:{drop,create,migrate}`
4. `rake import`
5. `rails s`

Thats it for Setup. Visit any of the endpoints by appending them to localhost:3000 in your browser after the server is running

# Endpoints
# Merchants

## Basic Endpoints
### List of all Merchants
  - `/api/v1/merchants`
### Single Merchant
  - `/api/v1/merchants/:id(.:format)`

### Finds Single Merchant by given params
  - `/api/v1/merchants/find`
 
### Find All Merchants by given params
  - `/api/v1/merchants/find_all(.:format)`

### Returns a Random Merchant
  - `/api/v1/merchants/random(.:format)`

## Relationship Endpoints  

### Returns All Items for Single merchant
  -  `/api/v1/merchants/:id/items(.:format)`

### Returns All Invoices for Single merchant

  - `/merchants/:id/invoices(.:format)`  

## Business Intelligence Endpoints  


### All Merchants    

### Returns the top x merchants ranked by total revenue
  - `/api/v1/merchants/most_revenue?quantity=x`

### Returns the top x merchants ranked by total number of items sold
  - `/api/v1/merchants/most_items?quantity=x`

### Returns the total revenue for date x across all merchants
  - `/api/v1/merchants/revenue?date=x`

### Single Merchant

### Returns the total revenue for that merchant across successful transactions
   - `/api/v1/merchants/:id/revenue`


### Returns the total revenue for that merchant for a specific invoice date x
  - `api/v1/merchants/:id/revenue?date=x-`

### Returns the customer who has conducted the most total number of successful transactions.
  - `/api/v1/merchants/:id/favorite_customer- Controller`

### Returns a collection of customers which have pending (unpaid) invoices. A pending invoice has no transactions with a result of success. This means all transactions are failed. Postgres has an EXCEPT operator that might be useful. ActiveRecord also has a find_by_sql that might help.

  - `/api/v1/merchants/:id/customers_with_pending_invoices`

# Items

## Basic Endpoints

### Returns All Items

 -  `/api/v1/items(.:format)`  

### Returns Single Item
  -  `/api/v1/items/:id(.:format)`

## Relationship Endpoints  
### Returns a collection of associated invoice items
  - `/api/v1/items/:id/invoice_items`

### Returns the associated merchant
  - `/api/v1/items/:id/merchant`

## Business Intelligence Endpoints  

### Returns the top x items ranked by total revenue generated
  -  `/api/v1/items/most_revenue?quantity=x`

### Returns the top x item instances ranked by total number sold
  - `/api/v1/items/most_items?quantity=x`

### Returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.

  - `/api/v1/items/:id/best_day`
# Customers

##  Basic Endpoints
### Returns All Customers
  - `/api/v1/customers(.:format)`    
### Returns Single Customer

  - `/api/v1/customers/:id(.:format)`
  
##  Relationship Endpoints
### Returns a collection of associated invoices
  - `/api/v1/customers/:id/invoices`
  
### Returns a collection of associated transactions
  - `/api/v1/customers/:id/transactions`
  
## Business Intelligence Endpoints  

### Returns a merchant where the customer has conducted the most successful transactions

  - `/api/v1/customers/:id/favorite_merchant`
  
# Invoices
## Basic Endpoints
### Returns all invoices
  -  `/api/v1/invoices(.:format)`

### Returns Single Invoice
  - `/api/v1/invoices/id(.:format)`

##  Relationship Endpoints

### Returns a collection of associated transactions
  - `/api/v1/invoices/:id/transactions`

### Returns a collection of associated invoice Items
  - `/api/v1/invoices/:id/invoice_items`

### Returns a collection of associated items
  - `/api/v1/invoices/:id/items`
### Returns a collection of associated customers
  - `/api/v1/invoices/:id/customer`
### Returns a collection of associated merchants
  - `/api/v1/invoices/:id/ merchant`
# Invoice Items
## Basic Endpoints
### Returns all Invoice Item
  - `/api/v1/invoice_items(.:format)`

### Returns Single Invoice Item
  - `/api/v1/invoice_items/:id(.:format)`
##  Relationship Endpoints

### Returns the associated invoice
  -  `/api/v1/invoice_items/:id/invoice`

### Returns the associated item

  - `/api/v1/invoice_items/:id/item`

# Transactions

## Basic Endpoints
### Returns All Transactions
  - `/api/v1/transactions`

### Returns Single Transaction

  - `/api/v1/transactions/:id`

## Relationship Endpoints
### Returns the associated invoice
  - `/api/v1/transactions/:id/invoice`
