
# Endpoints

## Merchants
### Basic Endpoints
##### Finder Endpoints
- List of all Merchants
  - [x] GET  /api/v1/merchants

- Single Merchant
  - [x] GET  /api/v1/merchants/:id(.:format)  

##### Search Endpoints      
- Finds Single Merchant by given params              
  - [x] GET  /api/v1/merchants/find
- Find All Merchants by given params
  - [x] GET  /api/v1/merchants/find_all(.:format)

##### Random Endpoint
- Returns a Random Merchant
  - [x] GET  /api/v1/merchants/random(.:format)

### Relationship Endpoints  
- Returns All Items For single merchants
  - [x] GET /api/v1/merchants/:id/items(.:format)
- Returns All Invoices For single merchants
  - [x] GET /api/v1/merchants/:id/invoices(.:format)       

### Business Intelligence Endpoints  

##### All Merchants    
- Returns the top x merchants ranked by total revenue
  - [ ] GET /api/v1/merchants/most_revenue?quantity=x

- Returns the top x merchants ranked by total number of items sold
  - [ ] GET /api/v1/merchants/most_items?quantity=x

- Returns the total revenue for date x across all merchants                                  
  - [ ] GET /api/v1/merchants/revenue?date=x

##### Single Merchant
- Returns the total revenue for that merchant across successful transactions
   - [ ] GET /api/v1/merchants/:id/revenue
- Returns the total revenue for that merchant for a specific invoice date x
  - [ ]GET /api/v1/merchants/:id/revenue?date=x
- Returns the customer who has conducted the most total number of successful transactions.
  - [ ]GET /api/v1/merchants/:id/favorite_customer

- Returns a collection of customers which have pending (unpaid) invoices. A pending invoice has no transactions with a result of success. This means all transactions are failed. Postgres has an EXCEPT operator that might be useful. ActiveRecord also has a find_by_sql that might help.
   - [ ] BOSS MODE: GET /api/v1/merchants/:id/customers_with_pending_invoices

## Items

#### Basic Endpoints
- Returns All Items
  - [x] GET  /api/v1/items(.:format)  
- Returns Single Item         
  - [x] GET  /api/v1/items/:id(.:format)

### Relationship Endpoints  
- Returns a collection of associated invoice items
  - [ ] GET /api/v1/items/:id/invoice_items
- Returns the associated merchant
  - [ ] GET /api/v1/items/:id/merchant

### Business Intelligence Endpoints  

- Returns the top x items ranked by total revenue generated
  - [ ] GET /api/v1/items/most_revenue?quantity=x
- Returns the top x item instances ranked by total number sold
  - [ ] GET /api/v1/items/most_items?quantity=x
- Returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.  
  - [ ] GET /api/v1/items/:id/best_day

## Customers
###  Basic Endpoints
- Returns All Customers
  - [x] GET  /api/v1/customers(.:format)        
- Returns Single Customer
  - [x] GET  /api/v1/customers/:id(.:format)  
###  Relationship Endpoints
- Returns a collection of associated invoices
  - [ ] GET /api/v1/customers/:id/invoices
Returns a collection of associated transactions
  - [ ] GET /api/v1/customers/:id/transactions

### Business Intelligence Endpoints  
- Returns a merchant where the customer has conducted the most successful transactions
  - [ ] GET /api/v1/customers/:id/favorite_merchant
- Returns a collection of associated transactions
  - [ ] GET /api/v1/customers/:id/transactions

## Invoices
#### Basic Endpoints
- Returns all invoices
  - [x] GET  /api/v1/invoices(.:format)
- Returns Single Invoice
  - [x] GET  /api/v1/invoices/id(.:format)  

####  Relationship Endpoints
- Returns a collection of associated transactions
  - [ ] GET /api/v1/invoices/:id/transactions
- Returns a collection of associated invoice Items
  - [ ] GET /api/v1/invoices/:id/invoice_items
- Returns a collection of associated items
  - [ ] GET /api/v1/invoices/:id/items
- Returns a collection of associated customers
  - [ ] GET /api/v1/invoices/:id/customer
- Returns a collection of associated merchants
  - [ ] GET /api/v1/invoices/:id/merchant

## Invoice Items
#### Basic Endpoints
- Returns all Invoice Item
  - [x] GET  /api/v1/invoice_items(.:format)
Returns single Invoice Irems
- [x] GET  /api/v1/invoice_items/:id(.:format)

####  Relationship Endpoints
- Returns the associated invoice
  - [ ] GET /api/v1/invoice_items/:id/invoice
- Returns the associated item
  - [ ] GET /api/v1/invoice_items/:id/item

## Transactions

#### Basic Endpoints
- Returns All Transactions
  - [x] GET  /api/v1/transactions(.:format)      
- Returns Single Transaction                                                   
  - [x] GET  /api/v1/transactions/:id(.:for


####  Relationship Endpoints
- Returns the associated invoice
  - [ ] GET /api/v1/transactions/:id/invoice
