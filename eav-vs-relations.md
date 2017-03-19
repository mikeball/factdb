So let's model an order though it's lifecycle

* Order Placed
* Order Reviewed/Corrected
* Order Item Backordered
* Order Shipped


# Relational Model

orders
  * status (review,open,shipped,complete)
  * name

order_items
  * part number
  * quantity
  * price

order_item_changes
  * user id
  * order item id
  * action
  * part
  * quantity

shippments
  * order id
  * ship date
  * tracking number
  * sent at
  * delivered at (nullable & updated when delivered)

  optionally
  shipment_deliveries
    * shipment_id
    * delivered_at

  shipment_failures
    * shipment_id
    * ...

shipment_items
  * shipment id
  * part number
  * quantity





# EAV Model

:id 1
:order/name "bob"
:order/status :review
:order/items [11 22]

1. EAV really breaks down on relationships to other entities
2. Properly normalized tables are mostly squarish.
   ... for the nullables, and we can use column level permissions if it's really important



:id 11
:item/part
:item/quantity 
:item/price


