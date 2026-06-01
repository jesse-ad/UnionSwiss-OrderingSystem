# README
* All setup steps and running of the application should be performed from a terminal in the project directory

SETUP INSTRUCTIONS
Ensure the following software is installed:
- homebrew (if you do not have): /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
- Ruby 3.x: brew install ruby (Check ruby version [ruby -v] If it says ruby 2.x.x, run this command: echo 'export PATH="/opt/homebrew/opt/ruby/bin:$PATH"' >> ~/.zprofile
source ~/.zprofile)
- SQLite3: brew install sqlite
- bundler: gem install bundler
- rails: brew install rails (Check [rails -v], If it says its not installed, run command [gem environment], look for EXECUTABLE DIRECTORY then run command [echo 'export PATH="/PATH/FROM/EXECUTABLE/DIRECTORY:$PATH"' >> ~/.zprofile] and [source ~/.zprofile])

1. Navigate to the project folder: cd union_swiss_ordering_system
2. Install dependencies: bundle install
3. Run the database migrations: rails db:migrate
4. (Optional) Populate the database: rails db:seed

HOW TO RUN
1. Start rails server: rails server OR bin/dev
2. Open a web browser adn navigate to: https://localhost:3000

APPLICATION OVERVIEW
The Union Swiss Ordering System is a Ruby on Rails web application developed to streamline the order management process between distributors and administrators.

The sytem provides a centralised platform where distributors can browse products, create and manage orders, and track progress of submitted orders. Adminstrators are able to manage products, distributors, pricing information, and monitor all orders within the system.

- TECH STACK
    - Frontend: Bootstrap, CSS
    - Backend: Ruby on Rails, SQLite

[Administartor functionality]
Administrators have access to an administrative dashboard which provide an overview of key business metrics, including:
- Total number of products
- Total number of distributors
- Total number of SKUs
- Total number of orders
- Order status statistics

Adminstrators can also:
- Create, edit, and delete products
- Create, edit, and delete distributors
- Create, edit, and delete SKUs
- View all orders within the system
- Update order statuses
- Monitor recent order activity

[Distributor functionality]
Distibutors have access to a personalised dashboard which displays:
- Products available to their account
- Product pricing information
- Recent order history

Distributors can:
- Create draft orders
- Add products to orders
- Modify pallet quantities
- Remove products from draft orders
- Submit completed orders
- View previously submitted orders

[Order workflow]
Orders are initiallu created as draft orders, allowing distributors to buld and modify orders before submission.

Once submitted, orders progress through the following statuses:
- Pending
- Processing
- Delivered
- Cancelled

Administrators are responsible for updating order statuses as orders move through the fulfilment process.

[Data management]
The application managers the following core entities:
- Products
- Distributors
- SKUs
- Order
- Order Items
- Users

[Entity relationships]
User
A user is an individual who can access the system. Users are assigned one of two roles; Adminstrator or Distributor.
Relationships:
- A user belongs to a Distributor (or Administrator)
- A user can create many Orders (If Distributor)

Distributor
A distributor represents a company that purchases products through the system.
Relationships:
- A Distributor has many SKUs
- A Distributor has many Users
- A Distributor has many orders

Product
a product represents an item availiable for ordering.
Relationships:
- A Product has many SKUs

SKU
A SKU links a Product to a Distributor and stores distributor-specific pricing information.
Relationships:
- A SKU belongs to a Product
- A SKU belongs to a Distributor
- A SKU has many Order Items

Order
An order represents a purchase submitted by a Distributor
Relationships:
- An Order belongs to a Distributor
- An Order belongs to a User
- An Order has many Order Items

Order Item
An order item represents an individual product contained within an Order.
Relationships:
- An Order Item belongs to an Order
- An Order Item belongs to a SKU

[Additional features]
1. Role-based access control
The system supports two user roles:
- Administrator
- Distributor

Each role has access only to the functionality relevant to their responsibilities. Adminstrators can manage system data and monitor orders, while distributors can ceate and manage their own orders and view available products.

2. Distributor and Admin dashboards
The distributor dashboard was implemented to provide distributors with a personalised view of:
- Available products and pricing
- Recently submitted orders
- Quick access to order creation

3. The administrator dashboard was implemented to provide summary of key metrics, including:
- Total number of products
- Total number of distributors
- Total number of SKUs
- Total number of orders
- Pending orders
- Processing orders
- Delivered orders
- Cancelled orders

4. Draft order functionality
Orders are initiallu created aas draft orders, allowing distributors to:
- Add and remove products
- Adjust pallet quantities
- Review order totals
- submit orders only when complete

5. Order status management
Administartors can update order statuses directly from the orders page.
Supported statuses include:
- Pending
- Processing
- Delivered
- Cancelled

6. Validation and Business rules
Several validation rules were implemented to improve data intregrity, including:
- Future delivery dates only
- Unique product names
- Positive SKU pricing values
- Prevention of empty order submissions

7. Responsive UI
The application was styled using Boostrap and custom CSS.