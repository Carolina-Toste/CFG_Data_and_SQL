CREATE DATABASE plants;
USE plants;

-- 1. Create tables


CREATE TABLE customers (
    CustomerID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    CONSTRAINT pk_customers PRIMARY KEY (CustomerID)
);


CREATE TABLE customer_addresses (
    AddressID INT NOT NULL AUTO_INCREMENT,
    CustomerID INT,
    Street VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Region VARCHAR(50),
    Postcode VARCHAR(20) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    CONSTRAINT pk_address PRIMARY KEY (AddressID), 
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);


CREATE TABLE orders (
    OrderID INT NOT NULL AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    ShipDate DATE,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    CONSTRAINT pk_order PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);


CREATE TABLE vendors (
    VendorID INT NOT NULL AUTO_INCREMENT,
    VendorName VARCHAR(100) NOT NULL,
    ContactPersonFirstName VARCHAR(50) NOT NULL,
    ContactPersonLastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    CONSTRAINT pk_vendors PRIMARY KEY (VendorID)
);


CREATE TABLE plant_stock (
    PlantID INT NOT NULL AUTO_INCREMENT,
    PlantName VARCHAR(100) NOT NULL,
    PlantType VARCHAR(100),
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    VendorID INT, 
    CONSTRAINT pk_plant_stock PRIMARY KEY (PlantID),
    CONSTRAINT fk_plant_stock_vendor FOREIGN KEY (VendorID) REFERENCES vendors(VendorID)
);
   

CREATE TABLE extras (
    ItemID INT NOT NULL AUTO_INCREMENT,
    ItemName VARCHAR(100) NOT NULL,
    ItemType VARCHAR(50),
    Description VARCHAR(255), 
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    VendorID INT, 
    CONSTRAINT pk_extras PRIMARY KEY (ItemID),
    CONSTRAINT fk_extras_vendor FOREIGN KEY (VendorID) REFERENCES vendors(VendorID)
);



-- 1. Create junction tables 
-- For plants and orders 


CREATE TABLE plant_order (
    OrderID INT,
    PlantID INT,
    Quantity INT,
    CONSTRAINT fk_plant_order_orders FOREIGN KEY (OrderID) REFERENCES orders(OrderID),
    CONSTRAINT fk_plant_order_plant_stock FOREIGN KEY (PlantID) REFERENCES plant_stock(PlantID)
);


-- For extras and orders

CREATE TABLE extra_order (
    OrderID INT,
    ItemID INT,
    Quantity INT,
    CONSTRAINT fk_extra_order_orders FOREIGN KEY (OrderID) REFERENCES orders(OrderID),
    CONSTRAINT fk_extra_order_extras FOREIGN KEY (ItemID) REFERENCES extras(ItemID)
);


-- 2. Populate tables
/*
customers data can also be imported from csv using workbench import wizard 
I used https://www.mockaroo.com/ to generate random customers data and https://www.doogal.co.uk/RandomAddresses 
to generate random UK addresses. I used https://www.soil.ninja/pages/plant-index for a comprehensive list of plant names.
*/

-- Insert data into customers table


INSERT INTO customers (CustomerID, FirstName, LastName, Email, Phone)
VALUES
(1, 'Wendye', 'Durrell', 'wdurrell0@ovh.net', '108-950-2928'),
(2, 'Clerissa', 'Imesson', 'cimesson1@creativecommons.org', '803-695-7931'),
(3, 'Lisha', 'Blazi', 'lblazi2@imageshack.us', '251-175-9234'),
(4, 'Mikael', 'Peacop', 'mpeacop3@ft.com', '384-790-6100'),
(5, 'Mayer', 'Seathwright', 'mseathwright4@bizjournals.com', '281-456-4278'),
(6, 'Perle', 'Charrette', 'pcharrette5@google.com.au', '521-794-2710'),
(7, 'Judy', 'Elman', 'jelman6@abc.net.au', '673-890-1204'),
(8, 'Phaidra', 'Glennon', 'pglennon7@un.org', '221-393-3190'),
(9, 'Rakel', 'Barrar', 'rbarrar8@fastcompany.com', '477-952-1963'),
(10, 'Frances', 'Kestian', 'fkestian9@rediff.com', '803-144-8216'),
(11, 'Silvester', 'Garritley', 'sgarritleya@naver.com', '915-753-7357'),
(12, 'Seamus', 'Poulglais', 'spoulglaisb@rambler.ru', '754-320-8488'),
(13, 'Karee', 'Courtman', 'kcourtmanc@unesco.org', '134-793-7399'),
(14, 'Camella', 'Hugueville', 'chuguevilled@scribd.com', '698-494-9485'),
(15, 'Gan', 'Sheppard', 'gshepparde@blogspot.com', '321-672-4164'),
(16, 'Valerie', 'Litherborough', 'vlitherboroughf@nasa.gov', '856-661-1865'),
(17, 'Marget', 'Gradley', 'mgradleyg@people.com.cn', '168-503-3558'),
(18, 'Pammie', 'Rennick', 'prennickh@privacy.gov.au', '830-135-5785'),
(19, 'Jacquelyn', 'Privett', 'jprivetti@behance.net', '398-941-0272'),
(20, 'Raimundo', 'Ommanney', 'rommanneyj@blogtalkradio.com', '603-732-3844'),
(21, 'Iona', 'Courvert', 'icourvertk@deviantart.com', '149-643-1287'),
(22, 'George', 'Grasha', 'ggrashal@youtu.be', '741-574-4647'),
(23, 'Herminia', 'Heeron', 'hheeronm@stanford.edu', '335-583-8152'),
(24, 'Cassandre', 'Hawkeridge', 'chawkeridgen@paypal.com', '799-442-8621'),
(25, 'Fabien', 'Garthland', 'fgarthlando@webmd.com', '819-106-6612'),
(26, 'Siward', 'Cockill', 'scockillp@1688.com', '916-592-9915'),
(27, 'Cheryl', 'Tamblingson', 'ctamblingsonq@tmall.com', '238-751-6777'),
(28, 'Karmen', 'De Giovanni', 'kdegiovannir@digg.com', '525-860-5890'),
(29, 'Rriocard', 'Sealove', 'rsealoves@live.com', '478-152-5578'),
(30, 'Jeanette', 'Warlock', 'jwarlockt@mapquest.com', '426-404-9341'),
(31, 'Cindie', 'Lovejoy', 'clovejoyu@icio.us', '909-157-3360'),
(32, 'Orson', 'Siley', 'osileyv@techcrunch.com', '779-934-6769'),
(33, 'Arlina', 'Torre', 'atorrew@fema.gov', '718-449-8735'),
(34, 'Kesley', 'Cordle', 'kcordlex@gizmodo.com', '753-154-9098'),
(35, 'Arlina', 'Gecks', 'agecksy@tamu.edu', '656-346-2530'),
(36, 'Keelby', 'Wozencroft', 'kwozencroftz@mapquest.com', '216-109-1909'),
(37, 'Bernarr', 'Hewes', 'bhewes10@timesonline.co.uk', '365-489-9159'),
(38, 'Bondy', 'Kubiak', 'bkubiak11@printfriendly.com', '890-795-1520'),
(39, 'Lynnea', 'Montrose', 'lmontrose12@google.es', '630-384-1554'),
(40, 'Artus', 'Tunnow', 'atunnow13@slideshare.net', '151-333-4963'),
(41, 'Gasper', 'De Coursey', 'gdecoursey14@usa.gov', '126-723-0624'),
(42, 'Lola', 'Kohlert', 'lkohlert15@booking.com', '457-822-2680'),
(43, 'Weidar', 'Zamora', 'wzamora16@sciencedirect.com', '333-491-2964'),
(44, 'Kata', 'Ewbanke', 'kewbanke17@upenn.edu', '368-634-9983'),
(45, 'Amanda', 'Iannazzi', 'aiannazzi18@smugmug.com', '811-312-3338'),
(46, 'Jamesy', 'Camell', 'jcamell19@flavors.me', '756-947-4148'),
(47, 'Sunshine', 'Hailey', 'shailey1a@desdev.cn', '210-658-2421'),
(48, 'Flossi', 'Deaconson', 'fdeaconson1b@baidu.com', '702-371-3929'),
(49, 'Noel', 'Pankhurst.', 'npankhurst1c@uiuc.edu', '216-217-2442'),
(50, 'Biron', 'Conrath', 'bconrath1d@who.int', '317-158-7969'),
(51, 'Sergio', 'Gerrit', 'sgerrit1e@webs.com', '298-238-4197'),
(52, 'Adler', 'McCann', 'amccann1f@altervista.org', '709-249-2845'),
(53, 'Isaiah', 'Cleve', 'icleve1g@berkeley.edu', '945-886-5525'),
(54, 'Rafe', 'Dybald', 'rdybald1h@pagesperso-orange.fr', '399-471-2075'),
(55, 'Devin', 'Coulsen', 'dcoulsen1i@people.com.cn', '616-794-8046'),
(56, 'Augie', 'Cluderay', 'acluderay1j@is.gd', '115-880-1816'),
(57, 'Kaleb', 'McFayden', 'kmcfayden1k@icio.us', '741-721-4422'),
(58, 'Emelen', 'Bilton', 'ebilton1l@marketwatch.com', '567-471-6244'),
(59, 'Wenda', 'Swatman', 'wswatman1m@bloglines.com', '102-892-3142'),
(60, 'Janenna', 'Burker', 'jburker1n@cocolog-nifty.com', '405-851-4902');

-- Insert data into customer_addresses table


INSERT INTO customer_addresses (CustomerID, Street, City, Region, Postcode, Country)
VALUES
(1, '39 Cross Road', 'Dewsbury', 'West Yorkshire', 'WF12 0ED', 'UK'),
(2, '29 Thomas Street', 'St Pauls', 'Bristol', 'BS2 9LJ', 'UK'),
(3, '3 Church Croft Cottage', 'Streatley', 'Berkshire', 'RG8 9HU', 'UK'),
(4, '10 Willow Walk', 'Barnsley', 'South Yorkshire', 'S70 4NG', 'UK'),
(5, '97 Pitman Place', 'Wotton-Under-Edge', 'Gloucestershire', 'GL12 7SG', 'UK'),
(6, '1 Waypark Cottages', 'Morebath', 'Devon', 'EX16 9AP', 'UK'),
(7, '5 Grafton Avenue', 'Stoke-On-Trent', 'Staffordshire', 'ST6 7DB', 'UK'),
(8, '19 - 21 Schneider Close', 'Felixstowe', 'Suffolk', 'IP11 3BQ', 'UK'),
(9, '2 Church Close', 'Anlaby', 'East Yorkshire', 'HU10 7DF', 'UK'),
(10, '41 Hillside Avenue', 'Whitefield', 'Greater Manchester', 'M45 7SH', 'UK'),
(11, '10 Jacobs Croft', 'Clayton', 'West Yorkshire', 'BD14 6SU', 'UK'),
(12, '36 Town Street', 'Duffield', 'Derbyshire', 'DE56 4GD', 'UK'),
(13, '1 Almond Close', 'Ruislip', 'London', 'HA4 6EB', 'UK'),
(14, '54 Oldway', 'Bishopston', 'Swansea', 'SA3 3DJ', 'UK'),
(15, '5 Oakcross Gardens', 'Woolton', 'Liverpool', 'L25 9GH', 'UK'),
(16, '98 Graham Road', 'Birmingham', 'West Midlands', 'B25 8JX', 'UK'),
(17, 'The School House', 'Sandwich', 'Kent', 'CT13 9HS', 'UK'),
(18, '5 Armstrong Close', 'Waterlooville', 'Hampshire', 'PO7 6AY', 'UK'),
(19, '6 Woodlands Park', 'Shrewsbury', 'Shropshire', 'SY2 6JN', 'UK'),
(20, '34 Rydal Crescent', 'Worsley', 'Greater Manchester', 'M28 7JD', 'UK'),
(21, 'Bracken Lodge', 'Terrington', 'North Yorkshire', 'YO60 6NX', 'UK'),
(22, '1 Castille Gardens', 'Kings Langley', 'Hertfordshire', 'WD4 9PT', 'UK'),
(23, '8 Heathervale', 'West Bridgford', 'Nottinghamshire', 'NG2 7ST', 'UK'),
(24, 'Derwen Fawr', 'Llanwrda', 'Carmarthenshire', 'SA19 8AA', 'UK'),
(25, '3 Granfield Gardens', 'Langford', 'Somerset', 'BS40 5JP', 'UK'),
(26, '42 St Andrews Drive', 'Stanmore', 'London', 'HA7 2NB', 'UK'),
(27, '8 Viking Close', 'Manchester', 'Greater Manchester', 'M11 3JF', 'UK'),
(28, '1 Dewstow Gardens', 'Caldicot', 'Monmouthshire', 'NP26 4HL', 'UK'),
(29, 'Lower Hook Cottage', 'North Cheriton', 'Somerset', 'BA8 0AL', 'UK'),
(30, 'Burcher House', 'Titley', 'Herefordshire', 'HR5 3RS', 'UK'),
(31, '33 School Lane', 'Great Budworth', 'Cheshire', 'CW9 6HQ', 'UK'),
(32, '4 Tristrams Croft', 'Bootle', 'Merseyside', 'L30 2NL', 'UK'),
(33, '94 Edgecombe', 'Cambridge', 'Cambridgeshire', 'CB4 2LR', 'UK'),
(34, '38 The Water Gardens', 'London', 'London', 'W2 2DB', 'UK'),
(35, '58 Huntington Road', 'York', 'North Yorkshire', 'YO31 8RE', 'UK'),
(36, '18 The Beeches', 'Yelverton', 'Devon', 'PL20 6FE', 'UK'),
(37, '1 St Michaels Cottages', 'Ilsington', 'Devon', 'TQ13 9RJ', 'UK'),
(38, '19 Westbury Lane', 'Buckhurst Hill', 'Essex', 'IG9 5NF', 'UK'),
(39, '4 Windsor Avenue', 'Nantwich', 'Cheshire', 'CW5 7DN', 'UK'),
(40, 'Stone Grange', 'Grinshill', 'Shropshire', 'SY4 3BW', 'UK'),
(41, '36 Oxted Green', 'Milford', 'Surrey', 'GU8 5DE', 'UK'),
(42, '1 Pen Gelli', 'Talsarnau', 'Gwynedd', 'LL47 6UH', 'UK'),
(43, '2 Earwigs, Furnace Lane', 'Cowden', 'Kent', 'TN8 7JP', 'UK'),
(44, '12 Ashford Road', 'Sheldwich', 'Kent', 'ME13 0LL', 'UK'),
(45, '31 Rectory Road', 'Tiptree', 'Essex', 'CO5 0SX', 'UK'),
(46, '37 Endway', 'Surbiton', 'Surrey', 'KT5 9BT', 'UK'),
(47, '1 Woodlands', 'Bexhill-On-Sea', 'East Sussex', 'TN39 4RJ', 'UK'),
(48, 'Rift Farm Cottage', 'Wylam', 'Northumberland', 'NE41 8BL', 'UK'),
(49, '10 Penlan', 'Llandudno', 'Conwy', 'LL30 1PE', 'UK'),
(50, '18 Tean', 'Porthkea', 'Cornwall', 'TR3 6AH', 'UK'),
(51, 'Hawthorn Cottage, 3 Kennels Lane', 'Albrighton', 'Shropshire', 'WV7 3BQ', 'UK'),
(52, '23 Jessie Road', 'Havant', 'Hampshire', 'PO9 3TH', 'UK'),
(53, '4 Cleugh Head', 'Greenhaugh', 'Northumberland', 'NE48 1PT', 'UK'),
(54, '52 Wulfric Place', 'Sheffield', 'South Yorkshire', 'S2 1GZ', 'UK'),
(55, '29 Dean Lane', 'Hazel Grove', 'Cheshire', 'SK7 6DH', 'UK'),
(56, '23 Darwin Road', 'Mickleover', 'Derbyshire', 'DE3 9HU', 'UK'),
(57, 'The Lodge, 6 Baldon Lane', 'Marsh Baldon', 'Oxfordshire', 'OX44 9LT', 'UK'),
(58, '2 Tudbury Way', 'Salford', 'Greater Manchester', 'M3 6TW', 'UK'),
(59, '1 Weir End Road', 'Poundbury', 'Dorset', 'DT1 3RX', 'UK'),
(60, '1 Glebe Close', 'Long Ashton', 'Somerset', 'BS41 9DB', 'UK');

-- Insert data into orders table


INSERT INTO orders (CustomerID, OrderDate, ShipDate, TotalAmount)
VALUES
(46, '2023-11-01', '2023-11-05', 50.50),
(12, '2023-11-02', '2023-11-07', 75.25),
(28, '2023-11-03', '2023-11-09', 25.00),
(3, '2023-11-03', '2023-11-09', 60.75),
(9, '2023-11-04', '2023-11-09', 30.00),
(35, '2023-11-05', '2023-11-10', 120.90),
(18, '2023-11-06', '2023-11-10', 95.60),
(24, '2023-11-07', '2023-11-10', 60.75),
(17, '2023-11-08', '2023-11-12', 150.25),
(50, '2023-11-09', '2023-11-12', 75.00),
(2, '2023-11-10', '2023-11-15', 20.50),
(41, '2023-11-11', '2023-11-15', 80.25),
(14, '2023-11-12', '2023-11-15', 20.00),
(7, '2023-11-13', '2023-11-15', 35.75),
(30, '2023-11-14', '2023-11-17', 70.20),
(23, '2023-11-15', '2023-11-17', 75.50),
(19, '2023-11-16', '2023-11-25', 30.00),
(8, '2023-11-17', '2023-11-23', 80.75),
(33, '2023-11-18', '2023-11-23', 90.90),
(16, '2023-11-19', '2023-11-25', 95.60),
(38, '2023-11-20', '2023-11-25', 120.75),
(25, '2023-11-21', '2023-11-28', 50.25),
(48, '2023-11-22', '2023-11-28', 175.00),
(5, '2023-11-23', '2023-12-02', 120.50),
(42, '2023-11-24', '2023-12-02', 40.25),
(27, '2023-11-25', '2023-12-02', 200.00),
(13, '2023-11-26', '2023-12-05', 85.75),
(22, '2023-11-27', '2023-12-05', 30.20),
(36, '2023-11-28', '2023-12-05', 75.50),
(31, '2023-11-29', '2023-12-05', 20.00),
(56, '2023-12-05', NULL , 20.00),
(7, '2023-12-05', NULL , 130.00),
(23, '2023-12-06', NULL , 50.50),
(3, '2023-12-06', NULL , 30.00),
(46, '2023-12-06', NULL , 80.00),
(60, '2023-12-07', NULL , 90.00),
(25, '2023-12-07', NULL , 110.00);

-- Insert data into vendors table


INSERT INTO vendors (VendorName, ContactPersonFirstName, ContactPersonLastName, Email, Phone)
VALUES
('Succulent Emporium', 'John', 'Young', 'john.young@succulentemporium.com', '555-1234'),
('Tropigaz', 'Alice', 'Smithers', 'alice.smithers@tropigaz.com', '555-5678'),
('Spiky Cacti', 'Robert', 'Johnson', 'robert.johnson@spikycacti.com', '555-9876'),
('Beechwood Nursery', 'Emily', 'Williams', 'emily.williams@beechwoodnursery.com', '555-4321'),
('Green Thumb Gardens', 'Michael', 'Anderson', 'michael.anderson@greenthumbgardens.com', '555-1111'),
('Blooming Blossoms', 'Sophia', 'Martin', 'sophia.martin@bloomingblossoms.com', '555-2222'),
('Natures Haven', 'William', 'Jones', 'william.jones@natureshaven.com', '555-3333'),
('Sunshine Plants', 'Olivia', 'Davis', 'olivia.davis@sunshineplants.com', '555-4444'),
('Leafy Dreams', 'James', 'Miller', 'james.miller@leafydreams.com', '555-5555');


-- Insert data into plant_stock table


INSERT INTO plant_stock (PlantName, PlantType, Price, StockQuantity, VendorID)
VALUES
('African Violet', 'Flowering Plant', 12.99, 50, 8),  -- Blooming Blossoms
('Aloe Tiger Plant', 'Succulent', 9.99, 6, 2),  -- Succulent Emporium
('Angel''s Wing', 'Foliage Plant', 15.99, 40, 4),  -- Leafy Dreams
('Ant Plant', 'Exotic Plant', 18.50, 25, 5),  -- Sunshine Plants
('Aralia Ming', 'Foliage Plant', 14.75, 35, 4),   -- Leafy Dreams
('Asparagus Fern', 'Fern', 8.99, 6, 7),  -- Nature's Haven
('Australian Chestnut', 'Tree', 22.50, 20, 3),  -- Tropigaz
('Autograph Tree', 'Tree', 19.99, 15, 3),  -- Tropigaz
('Avocado Plant', 'Fruit Plant', 25.99, 10, 6),  -- Beechwood Nursery
('Baby’s Tears', 'Ground Cover', 6.99, 75, 7),  -- Nature's Haven
('Bamboo', 'Grass', 17.50, 50, 7),  -- Nature's Haven
('Banana Plant', 'Fruit Plant', 23.75, 12, 6),   -- Beechwood Nursery
('Begonia', 'Flowering Plant', 11.25, 9, 8),  -- Blooming Blossoms
('Angel Wing Begonia', 'Flowering Plant', 14.99, 30, 8),  -- Blooming Blossoms
('Begonia ''Exotica''', 'Flowering Plant', 13.50, 35, 8),  -- Blooming Blossoms
('Butterfly Begonia', 'Flowering Plant', 16.25, 25, 8),  -- Blooming Blossoms
('Escargot Begonia', 'Flowering Plant', 19.99, 20, 8),  -- Blooming Blossoms
('Eyelash Begonia', 'Flowering Plant', 18.50, 3, 8),   -- Blooming Blossoms
('Lucerna'' Begonia', 'Flowering Plant', 15.75, 28, 8),  -- Blooming Blossoms
('Polka Dot Begonia', 'Flowering Plant', 17.99, 26, 8),  -- Blooming Blossoms
('Red Ruby Begonia', 'Flowering Plant', 20.50, 18, 8),  -- Blooming Blossoms
('Bloodleaf', 'Foliage Plant', 14.25, 40, 4),  -- Leafy Dreams
('Blue Star Fern', 'Fern', 9.50, 55, 7),  -- Nature's Haven
('Bonsai', 'Tree', 25.99, 15, 3),  -- Tropigaz
('Boston Fern', 'Fern', 12.99, 8, 7),  -- Nature's Haven
('Brake Fern', 'Fern', 11.50, 35, 7),  -- Nature's Haven
('Bright Star', 'Foliage Plant', 16.75, 25, 4),  -- Leafy Dreams
('Bromeliad', 'Flowering Plant', 18.99, 5, 8),  -- Blooming Blossoms
('Buddha Belly Plant', 'Succulent', 21.50, 18, 2),  -- Succulent Emporium
('Burro’s Tail', 'Succulent', 14.75, 40, 2),  -- Succulent Emporium
('Bush Lily', 'Flowering Plant', 19.99, 20, 8),   -- Blooming Blossoms
('Bush Senecio', 'Succulent', 13.25, 32, 2),  -- Succulent Emporium
('Calla Lily', 'Flowering Plant', 15.50, 28, 8),  -- Blooming Blossoms
('Caricature Plant', 'Exotic Plant', 22.75, 15, 5),  -- Sunshine Plants
('Cast Iron', 'Foliage Plant', 17.25, 30, 4),  -- Leafy Dreams
('China Doll Plant', 'Foliage Plant', 14.99, 35, 4),  -- Leafy Dreams
('Chilli Plant', 'Vegetable Plant', 8.50, 65, 6),  -- Beechwood Nursery
('Chinese Evergreen', 'Foliage Plant', 16.99, 25, 4),  -- Leafy Dreams
('Christmas Cactus', 'Cactus', 12.50, 45, 5),  -- Sunshine Plants
('Corkscrew Grass', 'Grass', 9.99, 50, 7),  -- Nature's Haven
('Corpse Flower', 'Exotic Plant', 25.50, 10, 5),  -- Sunshine Plants
('Cranesbills', 'Flowering Plant', 15.99, 30, 8), -- Blooming Blossoms
('Creeping Fig', 'Foliage Plant', 11.75, 38, 4),  -- Leafy Dreams
('Crocodile fern', 'Fern', 10.50, 6, 7),  -- Nature's Haven
('Crotons', 'Foliage Plant', 18.25, 22, 4),  -- Leafy Dreams
('Dragon Tree', 'Tree', 21.99, 18, 3),  -- Tropigaz
('Dumb Cane', 'Foliage Plant', 14.50, 35, 4),  -- Leafy Dreams
('Earth Star', 'Succulent', 12.75, 40, 2),   -- Succulent Emporium
('Easter Cactus', 'Cactus', 16.99, 26, 5),  -- Sunshine Plants
('Elephant Bush Plant', 'Succulent', 13.25, 32, 2),  -- Succulent Emporium
('Elephant''s Foot Plant', 'Succulent', 15.50, 28, 2),  -- Succulent Emporium
('Elephant Ears', 'Foliage Plant', 17.75, 24, 4),   -- Leafy Dreams
('Fiddle Leaf Fig', 'Foliage Plant', 25.99, 15, 4),  -- Leafy Dreams
('Fire Flash', 'Succulent', 19.50, 20, 2),  -- Succulent Emporium
('Fishbone Cactus', 'Cactus', 14.75, 8, 5),  -- Sunshine Plants
('Flapjack Plant', 'Succulent', 11.99, 36, 2),  -- Succulent Emporium
('Forrest Cactus', 'Cactus', 10.50, 42, 5),  -- Sunshine Plants
('Jade Plant', 'Succulent', 16.25, 28, 2),  -- Succulent Emporium
('Jasmine', 'Flowering Plant', 18.99, 22, 8),  -- Blooming Blossoms
('Jewel Orchids', 'Orchid', 21.50, 18, 1),   -- Spiky Cacti
('Money Tree', 'Foliage Plant', 23.75, 15, 6),  -- Beechwood Nursery
('Monkey Mask', 'Foliage Plant', 20.99, 18, 4),  -- Leafy Dreams
('Monkey Tail Cactus', 'Cactus', 17.25, 24, 5),  -- Sunshine Plants
('Monstera Albo', 'Foliage Plant', 25.99, 2, 4),  -- Leafy Dreams
('Mother of Thousands', 'Succulent', 12.50, 35, 2),  -- Succulent Emporium
('Nerve Plant / Polka Dot Plant', 'Flowering Plant', 15.99, 30, 8),  -- Blooming Blossoms
('Orchids', 'Orchid', 18.50, 9, 1),  -- Spiky Cacti
('Orchid Cacti', 'Cactus', 16.75, 26, 5),   -- Sunshine Plants
('Palms', 'Tree', 20.50, 20, 3),  -- Tropigaz
('Areca Palm', 'Tree', 15.99, 8, 3), -- Tropigaz
('Cascade Palm', 'Tree', 18.75, 24, 3),  -- Tropigaz
('Chinese Fan Palm', 'Tree', 22.99, 8, 3),  -- Tropigaz
('Coconut Palm Tree', 'Tree', 24.50, 15, 3),  -- Tropigaz
('Hawaiian Palm', 'Tree', 21.25, 22, 3),   -- Tropigaz
('Kentia Palm', 'Tree', 19.50, 26, 3),  -- Tropigaz
('Majesty Palm', 'Tree', 20.99, 24, 3),  -- Tropigaz
('Parlor Palm', 'Tree', 17.99, 30, 3),  -- Tropigaz
('Ponytail Palm', 'Tree', 16.75, 35, 3),  -- Tropigaz
('Sago Palm', 'Tree', 23.99, 20, 3),  -- Tropigaz
('Parakeet Flower', 'Flowering Plant', 18.25, 22, 8),   -- Blooming Blossoms
('Parrot Plant', 'Flowering Plant', 20.50, 18, 8),  -- Blooming Blossoms
('Party Time Plant', 'Flowering Plant', 21.99, 15, 8),  -- Blooming Blossoms
('Paperplant', 'Foliage Plant', 17.50, 28, 4),  -- Leafy Dreams
('Peace Lily', 'Flowering Plant', 19.75, 24, 8),  -- Blooming Blossoms
('Peperomia', 'Foliage Plant', 14.99, 35, 4),  -- Leafy Dreams
('Baby Rubberplant', 'Foliage Plant', 16.25, 30, 4),  -- Leafy Dreams
('Beetle Peperomia', 'Foliage Plant', 15.50, 3, 4),  -- Leafy Dreams
('Rocca Verde', 'Foliage Plant', 18.75, 6, 4),  -- Leafy Dreams
('Rosso Peperomia', 'Foliage Plant', 20.99, 22, 4),   -- Leafy Dreams
('String of Turtles', 'Succulent', 11.75, 6, 2),  -- Succulent Emporium
('Watermelon Peperomia', 'Foliage Plant', 13.99, 36, 4),  -- Leafy Dreams
('Persian Shield', 'Foliage Plant', 15.50, 32, 4),  -- Leafy Dreams
('Persian Violet', 'Flowering Plant', 17.25, 28, 6),  -- Blooming Blossoms
('String of Hearts', 'Succulent', 12.99, 5, 1),      -- Succulent Emporium
('String of Nickels', 'Succulent', 14.50, 30, 1),     -- Succulent Emporium
('String of Pearls', 'Succulent', 16.75, 25, 1),      -- Succulent Emporium
('Swedish Ivy', 'Foliage Plant', 13.25, 38, 7),     -- Leafy Dreams
('Swiss Cheese / Cheese Plant', 'Foliage Plant', 18.99, 22, 7),  -- Leafy Dreams
('Tea Plant', 'Foliage Plant', 20.50, 18, 7),         -- Leafy Dreams
('Tender Herbs', 'Herb Plant', 10.99, 50, 4),         -- Beechwood Nursery
('Thai Constellation', 'Foliage Plant', 23.75, 2, 7), -- Leafy Dreams
('Thanksgiving Cactus', 'Cactus', 16.50, 28, 3),     -- Spiky Cacti
('Yucca', 'Tree', 22.99, 18, 2),                      -- Tropigaz
('Zebra Basket Vine', 'Foliage Plant', 17.75, 24, 7), -- Leafy Dreams
('Zebra Plant', 'Succulent', 15.99, 30, 1),           -- Succulent Emporium
('ZZ Plant', 'Foliage Plant', 21.50, 20, 7);          -- Leafy Dreams

-- Insert data into extras stock table 


INSERT INTO extras (ItemName, ItemType, Description, Price, StockQuantity, VendorID)
VALUES
('Plant Soil - Premium', 'Soil', 'High-quality potting soil for optimal plant growth', 9.99, 50, 5),  -- Green Thumb Gardens
('Plant Soil - Basic', 'Soil', 'Standard potting soil for general plant care', 6.99, 75, 5),          -- Green Thumb Gardens
('Ceramic Pot - Small', 'Pot', 'Small ceramic pot for tabletop plants', 12.50, 30, 7),                -- Natures Haven
('Ceramic Pot - Medium', 'Pot', 'Medium-sized ceramic pot for medium plants', 15.99, 25, 7),         -- Natures Haven
('Ceramic Pot - Large', 'Pot', 'Large ceramic pot for floor plants', 19.99, 20, 7),                 -- Natures Haven
('Terracotta Pot - Small', 'Pot', 'Small terracotta pot for succulents', 8.99, 40, 7),              -- Natures Haven
('Terracotta Pot - Medium', 'Pot', 'Medium-sized terracotta pot for various plants', 11.75, 35, 7), -- Natures Haven
('Terracotta Pot - Large', 'Pot', 'Large terracotta pot for outdoor plants', 14.99, 25, 7),          -- Natures Haven
('Moss Pole', 'Accessory', 'Support pole covered with moss for climbing plants', 16.50, 30, 5),      -- Green Thumb Gardens
('Glass Terrarium', 'Accessory', 'Glass container for creating a mini ecosystem', 24.99, 15, 5),     -- Green Thumb Gardens
('Decorative Stones', 'Accessory', 'Colorful stones for decorating plant containers', 8.25, 50, 7),  -- Natures Haven
('Plant Fertilizer - Liquid', 'Fertilizer', 'Liquid fertilizer for indoor and outdoor plants', 12.99, 20, 5),  -- Green Thumb Gardens
('Plant Fertilizer - Granules', 'Fertilizer', 'Granular fertilizer for slow-release nutrients', 14.75, 8, 5),  -- Green Thumb Gardens
('Plant Labels', 'Accessory', 'Set of labels for identifying different plants', 5.50, 60, 7),          -- Natures Haven
('Watering Can', 'Tool', 'Metal watering can for precise plant watering', 18.25, 22, 5),             -- Green Thumb Gardens
('Pruning Shears', 'Tool', 'Sharp shears for trimming and pruning plants', 15.99, 5, 5),            -- Green Thumb Gardens
('Humidity Tray', 'Accessory', 'Tray for increasing humidity around plants', 11.50, 30, 7),          -- Natures Haven
('Plant Mister', 'Tool', 'Handheld mister for misting water on plants', 9.75, 35, 5),               -- Green Thumb Gardens
('Plant Stand', 'Accessory', 'Decorative stand for elevating plants', 22.99, 15, 7),                 -- Natures Haven
('Gardening Gloves', 'Tool', 'Protective gloves for handling plants and soil', 7.99, 45, 5),        -- Green Thumb Gardens
('LED Grow Light', 'Lighting', 'Artificial light source for promoting plant growth', 29.50, 8, 7),  -- Natures Haven
('Plant Hangers', 'Accessory', 'Macrame hangers for hanging plants', 13.99, 28, 7),                   -- Natures Haven
('Insecticidal Soap', 'Pest Control', 'Natural soap solution for insect control', 10.50, 40, 5),     -- Green Thumb Gardens
('Neem Oil', 'Pest Control', 'Organic oil for pest prevention on plants', 14.99, 25, 5),             -- Green Thumb Gardens
('Plant Stand - Wooden', 'Accessory', 'Wooden stand for displaying multiple plants', 19.75, 7, 7);  -- Natures Haven


-- Insert data into water_schedule table with LastWateredDate at beginning November 2023 and calculate NextWateringDate


INSERT INTO water_schedule (PlantID, WateringFrequency, LastWateredDate, NextWateringDate) VALUES
-- Cacti
(28, 'Every 8 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 8 WEEK)),
(35, 'Every 8 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 8 WEEK)),
(38, 'Every 8 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 8 WEEK)),
(44, 'Every 8 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 8 WEEK)),
(48, 'Every 8 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 8 WEEK)),
(63, 'Every 8 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 8 WEEK)),
-- Succulents
(2, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(8, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(18, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(20, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(26, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(29, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(30, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(32, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(33, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(39, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(40, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(41, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(47, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(49, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(50, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(55, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(56, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(57, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(58, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(61, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(68, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(90, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(94, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(96, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
(102, 'Every 4 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 4 WEEK)),
-- Trees
(6, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(7, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(12, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(13, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(19, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(23, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(25, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(37, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(42, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(43, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(46, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(51, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(53, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(59, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(69, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(70, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(71, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(72, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(73, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(74, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(75, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(76, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(77, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(78, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(79, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(95, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
(103, 'Every 3 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 3 WEEK)),
-- Other plants
(1, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(3, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(4, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(5, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(9, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(10, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(11, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(14, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(15, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(16, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(17, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(21, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(22, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(24, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(27, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(31, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(34, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(36, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(45, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(52, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(54, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(60, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(62, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(64, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(65, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(66, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(67, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(80, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(81, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(82, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(83, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(84, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(85, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(86, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(87, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(88, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(89, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(91, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(92, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(93, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(97, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(98, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(99, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(100, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(101, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(104, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(105, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK)),
(106, 'Every 2 weeks', '2023-11-01', DATE_ADD('2023-11-01', INTERVAL 2 WEEK));


--  insert data into plant_order


INSERT INTO plant_order (OrderID, PlantID, Quantity)
VALUES
(1, 25, 2), -- OrderID 1: Yucca x 2 
(2, 38, 1), 
(3, 12, 3), 
(4, 6, 2),  
(5, 18, 4), 
(6, 31, 1), 
(7, 2, 2), 
(8, 42, 3), 
(9, 12, 2),
(10, 22, 1), 
(11, 16, 4), 
(12, 10, 2), 
(13, 36, 1), 
(13, 17, 2),
(14, 74, 1),
(14, 100, 2),
(15, 67, 3),
(16, 12, 1),
(17, 86, 2),
(18, 65, 2),
(19, 23, 4),
(20, 1, 5),
(21, 6, 2),
(22, 17, 1),
(22, 57, 1),
(22, 32, 1),
(23, 55, 2),
(24, 89, 3),
(25, 65, 2),
(26, 36, 3),
(27, 10, 1),
(27, 19, 2),
(28, 96, 2),
(30, 41, 2),
(30, 3, 1),
(31, 6, 3),
(31, 78, 1),
(32, 23, 2),
(33, 48, 1),
(33, 15, 1),
(34, 18, 2),
(35, 64, 4),
(36, 9, 1),
(36, 50, 2),
(37, 88, 1);


-- Insert data into extra_order 


INSERT INTO extra_order (OrderID, ItemID, Quantity)
VALUES
(4, 12, 3),  -- OrderID 4: Ceramic Pot - Medium x 3
(9, 18, 2),  
(9, 22, 1),  
(14, 16, 4),  
(15, 10, 2),  
(16, 6, 1),  
(17, 14, 3),
(22, 20, 2), 
(25, 8, 1),
(29, 4, 10),
(33, 12, 3),
(34, 6, 2),
(35, 8, 3),
(37, 1,2); 


-- Check tables:


SELECT * FROM customers;
SELECT * FROM customer_addresses;
SELECT * FROM orders;
SELECT * FROM vendors;
SELECT * FROM plant_stock;
SELECT * FROM extras;
SELECT * FROM water_schedule;
SELECT * FROM plant_order;
SELECT * FROM  extra_order;

