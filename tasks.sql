USE plants;

-- TASK 1 - VIEW WITH JOINS
/* Using any type of the joins, create a view that combines multiple tables in a 
logical way, include a view that uses at least 3-4 base tables; 
prepare and demonstrate a query that uses the view to produce a logically arranged result set for analysis*/

-- Create view that combines information from customers and orders

CREATE VIEW customer_order_view AS
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT * FROM customer_order_view;

-- Create a view for high-value orders to activate shipping insurance on those orders


CREATE VIEW high_value_orders_view AS
SELECT
    o.OrderID,
    o.TotalAmount,
    c.FirstName,
    c.LastName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.TotalAmount > 100;

SELECT * FROM high_value_orders_view;

-- Create customer order details view 
/* If you have time update the price of the order based on what they ordered 
because it doesn't match up */

CREATE VIEW order_details_view AS
SELECT
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerID,
    c.FirstName,
    c.LastName,
    e.ItemName AS ExtraName,
    e.Price AS ExtraPrice,
    eo.Quantity AS ExtraQuantity,
    p.PlantName,
    p.PlantType,
    p.Price AS PlantPrice,
    po.Quantity AS PlantQuantity
FROM orders o
JOIN customers c ON o.CustomerID = c.CustomerID
LEFT JOIN extra_order eo ON o.OrderID = eo.OrderID
LEFT JOIN extras e ON eo.ItemID = e.ItemID
LEFT JOIN plant_order po ON o.OrderID = po.OrderID
LEFT JOIN plant_stock p ON po.PlantID = p.PlantID;

SELECT * FROM order_details_view;

-- Create a view for pending orders that haven't been shipped with all the information required to fulfill the order

CREATE VIEW pending_orders_view AS
SELECT
    c.FirstName,
    c.LastName,
    CONCAT(ca.Street, ', ', ca.City, ', ', ca.Region, ', ', ca.Postcode, ', ', ca.Country) AS FullAddress,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    ps.PlantName,
    po.Quantity AS PlantQuantity,
    e.ItemName AS ExtraName,
    eo.Quantity AS ExtraQuantity
FROM customers c
JOIN customer_addresses ca ON c.CustomerID = ca.CustomerID
JOIN orders o ON c.CustomerID = o.CustomerID
LEFT JOIN plant_order po ON o.OrderID = po.OrderID
LEFT JOIN plant_stock ps ON po.PlantID = ps.PlantID
LEFT JOIN extra_order eo ON o.OrderID = eo.OrderID
LEFT JOIN extras e ON eo.ItemID = e.ItemID
WHERE o.ShipDate IS NULL; 

SELECT * FROM  pending_orders_view;


-- Create watering schedule view

CREATE VIEW watering_schedule_view AS
SELECT
    ps.PlantID,
    ps.PlantName,
    ws.WateringFrequency,
    ws.LastWateredDate,
    ws.NextWateringDate
FROM plant_stock ps
LEFT JOIN water_schedule ws ON ps.PlantID = ws.PlantID;  

SELECT * FROM watering_schedule_view;

-- Create Revenue by plant type view - to see which plants are popular and worth stocking

CREATE VIEW revenue_plant_type_view AS
SELECT
    p.PlantType,
    SUM(p.Price * po.Quantity) AS TotalRevenue
FROM plant_stock p
JOIN plant_order po ON p.PlantID = po.PlantID
GROUP BY p.PlantType
ORDER BY TotalRevenue DESC;

SELECT * FROM revenue_plant_type_view;

-- Create revenue by extra type view - to see which items are popular and worth stocking

CREATE VIEW revenue_extra_type_view AS
SELECT
    e.ItemType,
    SUM(e.Price * eo.Quantity) AS TotalRevenue
FROM extras e
JOIN extra_order eo ON e.ItemID = eo.ItemID
GROUP BY e.ItemType
ORDER BY TotalRevenue DESC;

SELECT * FROM revenue_extra_type_view;

-- TASK 2 - STORED FUNCTIONS
/* In your database, create a stored function that can be applied to a
query in your DB */

--  Create stored function that calculates the total amount for an order based on the price of plants and items
/* This function takes 'order_id' as input and calculates the total amount for plants and items, 
and then returns the sum of the order */

DELIMITER //
CREATE FUNCTION calculate_order_total(order_id INT)
RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE plant_total DECIMAL(10, 2);
    DECLARE item_total DECIMAL(10, 2);

    -- Calculate total for plants
    SELECT SUM(ps.Price * po.Quantity)
    INTO plant_total
    FROM plant_order po
    JOIN plant_stock ps ON po.PlantID = ps.PlantID
    WHERE po.OrderID = order_id;

    -- Calculate total for items
    SELECT SUM(e.Price * eo.Quantity)
    INTO item_total
    FROM extra_order eo
    JOIN extras e ON eo.ItemID = e.ItemID
    WHERE eo.OrderID = order_id;

    -- Return the total amount
    RETURN COALESCE(plant_total, 0) + COALESCE(item_total, 0);
END //
DELIMITER ;

-- Example calculate the order total for orderID 37 and update the total amount in orders table 
SELECT calculate_order_total(37);


UPDATE orders
SET TotalAmount = calculate_order_total(37)
WHERE OrderID = 37;

-- During the shops anniversary in June I give people a 10% discount on orders > £30. 
/* Created a stored function that can be run during the sale to find the final price
the customer needs to pay after the discount has been applied. This function takes an order_id as input,
retrieves the total amount for the order, and applies a 10% discount if the total amount is greater than £30. 
It then returns the final discounted price */

DELIMITER //
CREATE FUNCTION calculate_discounted_price(order_id INT)
RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE total_amount DECIMAL(10, 2);

    -- Get the total amount for the order
    SELECT TotalAmount
    INTO total_amount
    FROM orders
    WHERE OrderID = order_id;

    -- Check if the order is eligible for a discount
    IF total_amount > 30 THEN
        -- Apply a 10% discount
        SET total_amount = total_amount * 0.9;
    END IF;

    -- Return the final discounted price
    RETURN total_amount;
END //
DELIMITER ;

-- Example: Calculate discounted price for order with ID 37

SELECT calculate_discounted_price(37);

-- TASK 3 - SUBQUERY
/* Prepare an example query with a subquery to demonstrate how to
extract data from your DB for analysis */

/* I received a phone call from Rakel Barrar asking me for advice on how to care for her plants,
I told her I would check and e-mail her instructions. To Find what plants she bought and her e-mail address
I'm building a query with a subquery. The query selects customer and order information and the subquery retrieves and 
concatenates the plant names for the order */

SELECT
    c.FirstName,
    c.LastName,
    c.Email,
    o.OrderID,
    o.OrderDate,
    (SELECT GROUP_CONCAT(ps.PlantName SEPARATOR ', ')
     FROM plant_order po
     JOIN plant_stock ps ON po.PlantID = ps.PlantID
     WHERE po.OrderID = o.OrderID) AS PlantsOrdered
FROM
    customers c
JOIN
    orders o ON c.CustomerID = o.CustomerID
WHERE
    c.FirstName = 'Rakel' 
    AND c.LastName = 'Barrar'; 


-- TASK 4 - STORED PROCEDURE

/* In your database, create a stored procedure and demonstrate how it runs. 
I created a stored procedure that updates the stock of both plant_stock and extras tables after an order has been placed, 
based on the items ordered by inputing the orderID   */

DELIMITER //
CREATE PROCEDURE UpdateStockAfterOrder(IN orderID INT)
BEGIN
    -- Update plant_stock
    UPDATE plant_stock ps
    INNER JOIN plant_order po ON ps.PlantID = po.PlantID
    SET ps.StockQuantity = ps.StockQuantity - po.Quantity
    WHERE po.OrderID = orderID;

    -- Update extras
    UPDATE extras e
    INNER JOIN extra_order eo ON e.ItemID = eo.ItemID
    SET e.StockQuantity = e.StockQuantity - eo.Quantity
    WHERE eo.OrderID = orderID;
END //
DELIMITER ;

-- Call the stored procedure for order 37 (PlantID 88 - 1 plant and ItemID 1 - 2 items)

-- Show extras and plant_stock before calling stored procedure
SELECT * FROM extras;
SELECT * FROM plant_stock;

CALL UpdateStockAfterOrder(37);

-- TASK 5 - Event 
/* In your database, create an event and demonstrate how it runs. Created a recurring event for updating the watering 
schedule based on the current date. Note - it would be good to find out if you could send a reminder to water plants for 
plants that were at or over the next watering date*/

DELIMITER //
CREATE EVENT update_watering_schedule_event
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE plantID, intervalWeeks INT;
    DECLARE cur CURSOR FOR
        SELECT PlantID, WateringFrequency
        FROM water_schedule
        WHERE NextWateringDate <= CURRENT_DATE;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO plantID, intervalWeeks;

        IF done THEN
            LEAVE read_loop;
        END IF;

        UPDATE water_schedule
        SET LastWateredDate = CURRENT_DATE,
            NextWateringDate = DATE_ADD(CURRENT_DATE, INTERVAL intervalWeeks WEEK)
        WHERE PlantID = plantID;
    END LOOP;

    CLOSE cur;
END //
DELIMITER ;

-- To see events
SHOW EVENTS;
-- To see if event scheduler is ON or OFF
SHOW VARIABLES LIKE 'event_scheduler';
-- Turn scheduler ON or OFF as required
SET GLOBAL event_scheduler = OFF; 

-- Task 6 - COMPLEX VIEW
/* Create a view that uses at least 3-4 base tables. Prepare and demonstrate a query 
that uses the view to produce a logically arranged result set for analysis. */

-- Create a Low-stock view for plants and extra items with the vendor information so you can put in an order
/*This view uses 3 tables plant_stock, vendors and extras. 
Given that the vendors sell items as wholesale, I need to make one large order from the same vendor, 
in order to make it viable. */


CREATE VIEW low_stock_view AS
SELECT
	'Plant' AS ItemType,
    ps.PlantID AS ItemID,
    ps.PlantName AS ItemName,
    ps.StockQuantity,
    v.VendorID AS VendorID,
    v.VendorName AS VendorName,
    v.Email AS VendorEmail,
    v.Phone AS VendorPhone
FROM plant_stock ps
JOIN vendors v ON ps.VendorID = v.VendorID
WHERE ps.StockQuantity < 10

UNION

SELECT
    'Extra' AS ItemType,
    e.ItemID AS ItemID,
    e.ItemName AS ItemName,
    e.StockQuantity,
    v.VendorID AS VendorID,
    v.VendorName AS VendorName,
    v.Email AS VendorEmail,
    v.Phone AS VendorPhone
FROM extras e
JOIN vendors v ON e.VendorID = v.VendorID
WHERE e.StockQuantity < 10;

SELECT * FROM low_stock_view;

-- Create query that uses this view and picks vendors who sell at least 5 different items that are in low stock. 
/* This query also meets the advanced requirement give example query with group by and 
 demonstrate how to extract data from your DB for analysis  */
 

SELECT
    VendorID,
    VendorName,
    VendorEmail,
    VendorPhone,
    COUNT(DISTINCT ItemName) AS NumberOfItems,
    GROUP_CONCAT(DISTINCT ItemName ORDER BY ItemName ASC SEPARATOR ',  ') AS LowStockItems
FROM low_stock_view
GROUP BY VendorID, VendorName, VendorEmail, VendorPhone
HAVING NumberOfItems >= 5
ORDER BY NumberOfItems DESC, VendorID;

-- It's only feasible to place an order from Nature's Haven to restock items that are low in stock 

-- Task 7 - Prepare an example query with GROUP BY and HAVING to demonstrate how to extract data from your DB for analysis 

/* I want to find out which customers make large purchases to send 
them a discount code to their e-mail */

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email,
    SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.Email
HAVING TotalSpent > 100
ORDER BY TotalSpent DESC;

-- Task 8 - Create trigger and demonstrate how it runs
/* Created a trigger to create a notification when the plant_stock quantity 
falls below a certain threshold. */

-- Create table to store the low_stock alerts

CREATE TABLE low_stock_alerts_plant (
    AlertID INT NOT NULL AUTO_INCREMENT,
    PlantID INT,  
    PlantName VARCHAR(100) NOT NULL,
    CurrentStock INT NOT NULL,
    AlertTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (AlertID),
    FOREIGN KEY (PlantID) REFERENCES plant_stock(PlantID)
);

SELECT * FROM low_stock_alerts_plant;

-- Create trigger for after an update on the plant_stock table

DELIMITER //
CREATE TRIGGER low_stock_alert_plant
AFTER UPDATE ON plant_stock
FOR EACH ROW
BEGIN
    IF NEW.StockQuantity < 10 THEN
        -- Log the alert to a separate table
        INSERT INTO low_stock_alerts_plant (PlantName, CurrentStock, AlertTimestamp)
        VALUES (NEW.PlantName, NEW.StockQuantity, CURRENT_TIMESTAMP);
        
    END IF;
END //
DELIMITER ;

-- If you need to delete a trigger
DROP TRIGGER IF EXISTS low_stock_alert_plant;

-- To show this trigger working let's update the stockquantity for African Violet (PlantID 1)
SELECT * FROM plant_stock;

UPDATE plant_stock
SET StockQuantity = 5
WHERE PlantID = '1'; 

SELECT * FROM plant_stock;
SELECT * FROM low_stock_alerts_plant;

