## Overview
The A&M Chess Store is an online chess store that buys chess supplies directly from manufacturers and sells to schools and eductional groups. The system supports multiple roles such as customers (teachers), shippers, managers, and administratorss.

The idea is that customers will be able to go online and order from a selection of chess sets, boards, clocks and other needed supplies. Each morning the shippers will review all the outstanding orders that need to be filled, pack each order into boxes and have them shipped to the school's location. As each item is shipped, the store's inventory is adjusted appropriately. The chess store has an inventory manager who takes primary responsibility for making sure there is sufficient inventory of each item. The application allows customers to create an account, view various items, order those items and manage their personal information. 

## How to Run
You will need to run `bundle install` to get the needed testing gems. You can populate the development database with realistic data by running `rake db:populate`.  All passwords are 'secret' in the system for all users. The list of known users include (email, role): 

* Mark (mheimann50@example.com, admin)
* Karen (kirvine10@example.com, customer)
* Rick (rhuang79@example.com, manager)
* Connor (chanley39@example.com, shipper)

There are other 40 customers randomly generated in the system along with 45 schools.

## Specific User Abilities
Because the app supports multiple users, it's helpful to understand what abilities each role has:

** Administrators ** can:
1. do everything

** Managers ** can:
1. read any information in the system.
2. can create, edit and read employee data.
3. can create, edit and read items in the system. This includes the power to destroy or deactivate items as appropriate and the ability to upload images of particular items.
4. can read full price history of a particular item as well as create new prices for a particular item.
5. can adjust the inventory levels for an item by adding purchases to the system.
6. can view an appropriate dashboard which includes a list of items that need to be reordered.
7. can read information about customers, schools and orders in the system.

** Shippers ** can:
1. read their own personal information in the system. They can edit their own name, phone, email and password information. (the limits of edit requirement not to be handled exclusively in the ability.rb file)
2. can read information related to orders that need to be shipped from their home page. On that list they can click a button or link on each order item to mark when that item has been packed and shipped.
3. can read information about items, including the inventory level but not the price history.

** Customers ** can:
1. read their own personal information in the system. They can edit their own name, phone, email and password information. (the limits of edit requirement not to be handled exclusively in the ability.rb file)
2. can place new orders and can cancel unshipped orders.
3. can read information about items, including images, but not the inventory level or the price history of an item.
4. can see a list of their own past orders and see an itemized list of the items (along with quantities and subtotals) of a particular past order.
5. can add their schools (if not already in the system) to the database.
Guests can:
1. read information on items, but not the inventory level or the full price history.
2. can create new user accounts and add their schools (if not already in the system) to the database.
