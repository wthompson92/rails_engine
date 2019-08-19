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
- Test
  - [x] merchants_controller_spec.rb
- Route
  - [x] GET /api/v1/merchants
- Controller  
  - [x] merchants_controller(index)

### Single Merchant
- Test
  - [x] merchants_controller_spec.rb
- Routes
  - [x] GET  /api/v1/merchants/:id(.:format)  
- Controller
  - [x]  merchants_controller.rb(show)

### Finds Single Merchant by given params
- Test
  - [x] /merchants/search_controller_spec.rb
- Route              
  - [x] GET  /api/v1/merchants/find
- Controller
  - [x] /merchants/search_controller.rb(show)

### Find All Merchants by given params
- Test
  - [x]  /merchants/search_controller_spec.rb
- Route
  - [x] GET  /api/v1/merchants/find_all(.:format)
- Controller
  - [x]  /merchants/search_controller.rb(index)

### Returns a Random Merchant
- Test
  - [x] smerchants/random_controller_spec.rb
- Route
  - [x] GET /api/v1/merchants/random(.:format)
- Controller
  - [x]  /merchants/random_controller.rb(show)


## Relationship Endpoints  

### Returns All Items for Single merchant
- Test
  - [ ] /merchants/items_controller_spec.rb
- Route
  - [x] GET /api/v1/merchants/:id/items(.:format)
- Controller
  - [x] /api/v1/merchants/items_controller.rb(index)

### Returns All Invoices for Single merchant

- Test
  - [ ] /merchants/invoices_controller_spec.rb
- Route
  - [x] /merchants/:id/invoices(.:format)       
- Controller
  - [x] /merchants/invoices_controller_spec.rb


## Business Intelligence Endpoints  


### All Merchants    

### Returns the top x merchants ranked by total revenue
- Test
  - [ ]  /merchants/revenue_controller_spec.rb
- Route
  - [x] GET /api/v1/merchants/most_revenue?quantity=x
- Controller
  - [x]  /merchants/invoices_controller.rb(index)

### Returns the top x merchants ranked by total number of items sold
- Test
  - [ ] /merchants/sales_controller_spec.rb
- Route
  - [ ] GET /api/v1/merchants/most_items?quantity=x
- Controller
  - [ ] merchants/sales_controlle.rb

### Returns the total revenue for date x across all merchants
- Test  
  - [ ] Done ?
- Route
  - [ ] GET /api/v1/merchants/revenue?date=x
- Controller
  - [ ] Done ?

### Single Merchant

### Returns the total revenue for that merchant across successful transactions

- Test
  - [ ] Done ?
- Route
   - [ ] GET /api/v1/merchants/:id/revenue
- Controller
  - [ ] Done?

### Returns the total revenue for that merchant for a specific invoice date x
- Test
  - [ ] Done ?
- Route
  - [ ] GET /api/v1/merchants/:id/revenue?date=x-
- Controller
  - [ ] Done ?

### Returns the customer who has conducted the most total number of successful transactions.
- Test
  - [ ] Done ?
- Route
  - [ ] GET /api/v1/merchants/:id/favorite_customer- Controller
- Controller
  - [ ] Done ?

### Returns a collection of customers which have pending (unpaid) invoices. A pending invoice has no transactions with a result of success. This means all transactions are failed. Postgres has an EXCEPT operator that might be useful. ActiveRecord also has a find_by_sql that might help.
- Test  
  - [ ] Done ?
- Route
  - [ ] BOSS MODE: GET /api/v1/merchants/:id/customers_with_pending_invoices
- Controller  
  - [ ] Done ?

# Items

## Basic Endpoints

### Returns All Items

- Test  
  - [x] items_controller_spec.rb
- Route
  - [x] GET  /api/v1/items(.:format)  
- Controller  
  - [x]  items_controller.rb(index)

### Returns Single Item
- Test  
  - [x] items_controller_spec.rb     
- Route
  - [x] GET  /api/v1/items/:id(.:format)
- Controller  
  - [x] items_controller.rb(show)

## Relationship Endpoints  
### Returns a collection of associated invoice items
- Test  
  - [ ] items/invoice_items_controller_spec.rb
- Route
  - [x] GET /api/v1/items/:id/invoice_items
- Controller
  - [x] items/invoice_items_controller_spec.rb

### Returns the associated merchant
- Test  
  - [ ] items/merchants_controller_spec.rb
- Route
  - [x] GET /api/v1/items/:id/merchant
- Controller
  - [x] items/merchants_controller.rb(index)

## Business Intelligence Endpoints  

### Returns the top x items ranked by total revenue generated
- Test
  - [ ] items/revenue_controller_spec.rb
- Route
  - [ ] GET /api/v1/items/most_revenue?quantity=x
- Controller
  - [ ] items/revenue_controller.rb

### Returns the top x item instances ranked by total number sold
- Test
  - [ ] items/sales_controller_spec.rb
- Route
  - [ ] GET /api/v1/items/most_items?quantity=x
- Controller
  - [ ] items/sales_controller.rb

### Returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.
- Test
  - [ ] Done
- Route  
  - [ ] GET /api/v1/items/:id/best_day
- Controller
  - [ ] Done

# Customers

##  Basic Endpoints
### Returns All Customers
- Test
  - [x] customers_controller_spec.rb
- Route
  - [x] GET  /api/v1/customers(.:format)     
- Controller
  - [x] Done customers_controller.rb(index)
### Returns Single Customer
- Test
  - [x]  customers_controller_spec.rb
- Route
  - [x] GET  /api/v1/customers/:id(.:format)
- Controller
  - [x] customers_controller_spec.rb(show)
- Route
##  Relationship Endpoints
### Returns a collection of associated invoices
- Test
  - [x] customers/invoices_controller_spec.rb
- Route
- Route
  - [x] GET /api/v1/customers/:id/invoices
- Controller
  - [x] customers/invoices_controller_spec.rb(index)
### Returns a collection of associated transactions
- Test
  - [x] customers/transactions_controller_spec.rb
- Route
  - [x] GET /api/v1/customers/:id/transactions
- Controller
  - [x] customers/invoices_controller.rb(index)

## Business Intelligence Endpoints  

### Returns a merchant where the customer has conducted the most successful transactions
- Test
  - [ ] Done
- Route
  - [ ] GET /api/v1/customers/:id/favorite_merchant
- Controller
  - [ ] Done

# Invoices
## Basic Endpoints
### Returns all invoices
- Test  
  - [ ] invoices_controller_spec.rb
- Routes
  - [x] GET  /api/v1/invoices(.:format)
- Controller
  - [x] invoices_controller.rb(index)
### Returns Single Invoice
- Test  
  - [ ] invoices_controller_spec.rb
- Routes
  - [x] GET  /api/v1/invoices/id(.:format)
- Controller
  - [x] invoices_controller.rb(show)

##  Relationship Endpoints

### Returns a collection of associated transactions
  - Test
    - [ ] invoices/transactions_controller_spec.rb
  - Route
    - [x] GET /api/v1/invoices/:id/transactions
  - Controller
    - [x] invoices/transactions_controller.rb(index)

### Returns a collection of associated invoice Items
- Test
  - [ ] invoices/invoice_items_controller_spec.rb
- Routes
  - [x] GET /api/v1/invoices/:id/invoice_items
- Controller
  - [x] invoices/invoice_items_controller.rb(index)

### Returns a collection of associated items
  - Test
    - [ ] invoices/items_controller_spec.rb
  - Routes
    - [x] GET /api/v1/invoices/:id/items
  - Controller
    - [x] Done invoices/items_controller.rb(index)
### Returns a collection of associated customers
  - Test
    - [ ] invoices/customers_controller_spec.rb
  - Routes
    - [x] GET /api/v1/invoices/:id/customer
  - Controller
    - [x] invoices/customers_controller.rb
### Returns a collection of associated merchants
- Test
  - [ ] invoices/merchants_controller_spec.rb
- Routes
  - [x] GET /api/v1/invoices/:id/ merchant
- Controller
  - [x] invoices/merchants_controller.rb

# Invoice Items
## Basic Endpoints
### Returns all Invoice Item
Test
  - [ ] invoices_items_controller_spec.rb
- Routes
  - [x] GET  /api/v1/invoice_items(.:format)
- Controller
  - [x] invoices_items_controller.rb(index)
### Returns Single Invoice Item
- Test
  - [ ] invoices_items_controller_spec.rb
- Routes
  - [x] GET  /api/v1/invoice_items/:id(.:format)
- Controller  
  - [x] invoices_items_controller.rb(show)

##  Relationship Endpoints

### Returns the associated invoice
- Test
  - [ ] invoices_items/invoices_controller_spec.rb
- Routes
  - [x] GET /api/v1/invoice_items/:id/invoice
- Controller
  - [x] invoices_items/invoices_controller.rb(show)

### Returns the associated item
- Test
  - [ ] invoices_items/items_controller_spec.rb
- Routes
  - [x] GET /api/v1/invoice_items/:id/item
- Controller
  - [x] invoices_items/items_controller_spec.rb(show)

# Transactions

## Basic Endpoints
### Returns All Transactions
- Test
  - [ ] transactions_controller_spec.rb
- Routes
  - [x] GET  /api/v1/transactions
- Controller
  - [x] /transactions_controller.rb(index)
### Returns Single Transaction

- Test
  - [ ] transactions_controller_spec.rb
- Routes
  - [x] GET  /api/v1/transactions/:id
- Controller
  - [x] transactions_controller_spec.rb(show)

## Relationship Endpoints
### Returns the associated invoice
- Test
  - [ ] transactions/invoices_controller_spec.rb
- Routes
  - [x] GET /api/v1/transactions/:id/invoice
- Controller
  - [x] transactions/invoices_controlles.rb(show)
