-- Function to insert a record into SalesPerson table
CREATE OR REPLACE FUNCTION insert_salesperson(
  p_firstname VARCHAR,
  p_lastname VARCHAR,
  p_phone_number BIGINT,
  p_email VARCHAR,
  p_address VARCHAR,
  p_city VARCHAR,
  p_state VARCHAR,
  p_zipcode INTEGER,
  p_hiredate DATE,
  p_commission_rate NUMERIC
)
RETURNS VOID 
AS $$
BEGIN
  INSERT INTO SalesPerson (
	  firstname, 
	  lastname, 
	  phone_number, 
	  email, 
	  address, 
	  city, 
	  "state", 
	  zipcode, 
	  hiredate, 
	  commission_rate
  )
  VALUES (
	  p_firstname, 
	  p_lastname, 
	  p_phone_number, 
	  p_email, 
	  p_address, 
	  p_city, 
	  p_state, 
	  p_zipcode, 
	  p_hiredate, 
	  p_commission_rate
  );
END;
$$ 
LANGUAGE PLPGSQL;


-- Function to insert a record into Customer table
CREATE OR REPLACE FUNCTION insert_customer(
  p_firstname VARCHAR,
  p_lastname VARCHAR,
  p_phone_number BIGINT,
  p_email VARCHAR,
  p_address VARCHAR,
  p_city VARCHAR,
  p_state VARCHAR,
  p_zipcode INTEGER,
  p_birthdate DATE,
  p_gender VARCHAR
)
RETURNS VOID 
AS $$
BEGIN
  INSERT INTO Customer (
	  firstname, 
	  lastname,
	  phone_number,
	  email,
	  address,
	  city,
	  "state", 
	  zipcode, 
	  birthdate, 
	  gender
  ) VALUES (
	  p_firstname, 
	  p_lastname, 
	  p_phone_number, 
	  p_email, 
	  p_address, 
	  p_city, 
	  p_state, 
	  p_zipcode, 
	  p_birthdate, 
	  p_gender
 );
END;
$$ 
LANGUAGE PLPGSQL;


-- Function to insert a record into Mechanic table
CREATE OR REPLACE FUNCTION insert_mechanic(
  p_firstname VARCHAR,
  p_lastname VARCHAR,
  p_phone_number BIGINT,
  p_email VARCHAR,
  p_address VARCHAR,
  p_city VARCHAR,
  p_state VARCHAR,
  p_zipcode INTEGER,
  p_hiredate DATE,
  p_hourly_rate NUMERIC,
  p_specialization VARCHAR
)
RETURNS VOID 
AS $$
BEGIN
  INSERT INTO Mechanic (
	  firstname, 
	  lastname, 
	  phone_number, 
	  email, 
	  address, 
	  city, 
	  "state", 
	  zipcode, 
	  hiredate, 
	  hourly_rate, 
	  specialization
  ) VALUES (
	  p_firstname, 
	  p_lastname, 
	  p_phone_number, 
	  p_email, p_address,
	  p_city,
	  p_state,
	  p_zipcode,
	  p_hiredate,
	  p_hourly_rate,
	  p_specialization
  );
END;
$$ 
LANGUAGE PLPGSQL;


-- Function to insert a record into Supplier table
CREATE OR REPLACE FUNCTION insert_supplier(
  p_supplier_name VARCHAR,
  p_phone_number BIGINT,
  p_email VARCHAR,
  p_address VARCHAR,
  p_city VARCHAR,
  p_state VARCHAR,
  p_zipcode INTEGER
)
RETURNS VOID 
AS $$
BEGIN
  INSERT INTO Supplier (
	  supplier_name, 
	  phone_number, 
	  email, 
	  address, 
	  city, 
	  "state", 
	  zipcode
  ) VALUES (
	  p_supplier_name, 
	  p_phone_number, 
	  p_email, p_address, 
	  p_city,
	  p_state,
	  p_zipcode
  );
END;
$$ 
LANGUAGE PLPGSQL;


-- Function to insert a record into Car table
CREATE OR REPLACE FUNCTION insert_car(
  p_make VARCHAR,
  p_model VARCHAR,
  p_year INTEGER,
  p_vin VARCHAR,
  p_color VARCHAR,
  p_price NUMERIC,
  p_customer_id INTEGER
)
RETURNS VOID 
AS $$
BEGIN
  INSERT INTO Car (
	  make, 
	  model, 
	  "year", 
	  vin, 
	  color, 
	  price, 
	  customer_id
  ) VALUES (
	  p_make, 
	  p_model, 
	  p_year, 
	  p_vin, 
	  p_color, 
	  p_price, 
	  p_customer_id
  );
END;
$$ 
LANGUAGE PLPGSQL;


-- Function to insert a record into Service table
CREATE OR REPLACE FUNCTION insert_service(
  p_service_date DATE,
  p_description VARCHAR,
  p_service_status VARCHAR,
  p_amount NUMERIC,
  p_car_id INTEGER
)
RETURNS VOID 
AS $$
BEGIN
  INSERT INTO Service (
	  service_date, 
	  description, 
	  service_status, 
	  amount, 
	  car_id
  ) VALUES (
	  p_service_date, 
	  p_description, 
	  p_service_status, 
	  p_amount, 
	  p_car_id
  );
END;
$$ 
LANGUAGE PLPGSQL;


-- Function to insert a record into Parts table
CREATE OR REPLACE FUNCTION insert_parts(
  p_parts_name VARCHAR,
  p_price NUMERIC,
  p_quantity INTEGER,
  p_description VARCHAR,
  p_supplier_id INTEGER
)
RETURNS VOID 
AS $$
BEGIN
  INSERT INTO Parts (
	  parts_name, 
	  price, 
	  quantity, 
	  description, 
	  supplier_id
  ) VALUES (
	  p_parts_name, 
	  p_price, 
	  p_quantity, 
	  p_description, 
	  p_supplier_id
  );
END;
$$ 
LANGUAGE PLPGSQL;


-- Function to insert a record into Parts_Service table
CREATE OR REPLACE FUNCTION insert_parts_service(
  p_service_id INTEGER,
  p_parts_id INTEGER
)
RETURNS VOID 
AS $$
BEGIN
  INSERT INTO Parts_Service (service_id, parts_id)
  VALUES (p_service_id, p_parts_id);
END;
$$ 
LANGUAGE PLPGSQL;



-- Function to insert a record into Mechanic_Service table
CREATE OR REPLACE FUNCTION insert_mechanic_service(
  p_service_id INTEGER,
  p_mechanic_id INTEGER
)
RETURNS VOID 
AS $$
BEGIN
  INSERT INTO Mechanic_Service (service_id, mechanic_id)
  VALUES (p_service_id, p_mechanic_id);
END;
$$ 
LANGUAGE PLPGSQL;


-- Function to insert a record into Invoice table
CREATE OR REPLACE FUNCTION insert_invoice(
  p_invoice_date DATE,
  p_total_amount NUMERIC,
  p_tax NUMERIC,
  p_discount NUMERIC,
  p_mrp_car NUMERIC,
  p_car_id INTEGER,
  p_sales_person_id INTEGER
)
RETURNS VOID 
AS $$
BEGIN
  INSERT INTO Invoice (
	  invoice_date, 
	  total_amount, 
	  tax, 
	  discount, 
	  mrp_car, 
	  car_id, 
	  sales_person_id
  ) VALUES (
	  p_invoice_date, 
	  p_total_amount, 
	  p_tax, 
	  p_discount, 
	  p_mrp_car, 
	  p_car_id, 
	  p_sales_person_id
  );
END;
$$ 
LANGUAGE PLPGSQL;






-- INSERTING RECORDS USING FUNCTION



-- Customer Table

-- Insert first record
SELECT insert_customer(
  'John', 
  'Doe', 
  1234567890, 
  'john.doe@example.com', 
  '1234 Elm Street', 
  'New York', 
  'NY', 
  12345, 
  '1985-01-01', 
  'Male'
);

-- Insert second record
SELECT insert_customer(
  'Jane', 
  'Smith', 
  9876543210, 
  'jane.smith@example.com', 
  '5678 Oak Street', 
  'Los Angeles', 
  'CA', 
  67890, 
  '1990-05-15', 
  'Female'
);

-- Insert third record
SELECT insert_customer(
  'Michael', 
  'Johnson', 
  5558889999, 
  'michael.johnson@example.com', 
  '7890 Maple Street', 
  'Chicago', 
  'IL', 
  54321, 
  '1982-09-30', 
  'Male'
);

-- Insert fourth record
SELECT insert_customer(
  'Emma', 
  'Brown', 
  1112223333, 
  'emma.brown@example.com', 
  '4321 Pine Street', 
  'San Francisco', 
  'CA', 
  98765, 
  '1995-12-10', 
  'Female'
);

-- Retrieve all records from the Customer table
SELECT * FROM Customer;



-- Sales person Table


-- Insert the first record
SELECT insert_salesperson(
  'David', 
  'Lee', 
  4567890123, 
  'david.lee@example.com', 
  '2345 Cedar Street', 
  'Seattle', 
  'WA', 
  54321, 
  '2017-09-20', 
  2.00
);

-- Insert the second record
SELECT insert_salesperson(
  'Sophia', 
  'Kim', 
  9870123456, 
  'sophia.kim@example.com', 
  '6789 Birch Avenue', 
  'Houston', 
  'TX', 
  87654, 
  '2016-08-15', 
  2.50
);

-- Insert the third record
SELECT insert_salesperson(
  'Daniel', 
  'Wang', 
  1234567890, 
  'daniel.wang@example.com', 
  '1234 Elm Street', 
  'New York', 
  'NY', 
  12345, 
  '2015-07-10', 
  3.00
);

-- Insert the fourth record
SELECT insert_salesperson(
  'Olivia', 
  'Chen', 
  9876543210, 
  'olivia.chen@example.com', 
  '5678 Oak Avenue', 
  'Los Angeles', 
  'CA', 
  67890, 
  '2014-06-05', 
  3.50
);

-- Retrieve all records from the SalesPerson table
SELECT * FROM SalesPerson;



-- Mechanic Table

-- Insert record 1
SELECT insert_mechanic(
  'Amit', 
  'Patel', 
  1234567566, 
  'amit.patel@example.com', 
  '1234 Elm Street', 
  'Mt. Pospet', 
  'OH', 
  547458, 
  '2018-01-15'::DATE, 
  25.0,
  'Engine Repair'
);

-- Insert record 2
SELECT insert_mechanic(
  'Priya', 
  'Sharma', 
  9876543210, 
  'priya.sharma@example.com', 
  '5678 Oak Avenue', 
  'Des Plaines', 
  'ILL', 
  60016, 
  '2017-02-20'::DATE, 
  22.5,
  'Transmission Repair'
);

-- Insert record 3
SELECT insert_mechanic(
  'Rahul', 
  'Gupta', 
  4567890123, 
  'rahul.gupta@example.com', 
  '2345 Cedar Street', 
  'Barttlet', 
  'ILL', 
  600501, 
  '2016-03-25'::DATE, 
  20.0,
  'Brake Repair'
);

-- Insert record 4
SELECT insert_mechanic(
  'Shreya', 
  'Kumar', 
  7890123456, 
  'shreya.kumar@example.com', 
  '6789 Birch Avenue', 
  'Chicago', 
  'ILL', 
  600001, 
  '2015-04-30'::DATE, 
  18.0,
  'Suspension Repair'
);

-- Retrieve records from Mechanic table

SELECT * FROM Mechanic;



-- Supplier Table

-- Insert record 1
SELECT insert_supplier(
	'Tires LLC', 
	987654321, 
	'tire.llc@example.com', 
	'1234 Oak Street', 
	'Springfield', 
	'IL', 
	62704
);

-- Insert record 2
SELECT insert_supplier(
	'MotorPro Unlimited', 
	123456789, 
	'mpu@example.com', 
	'5678 Maple Avenue', 
	'Denver', 
	'CO', 
	80202
);

-- Insert record 3
SELECT insert_supplier(
	'CarQuest Auto Parts', 
	987654321, 
	'cqauto5@example.com', 
	'9876 Elm Drive', 
	'Miami', 
	'FL', 
	33126
);

-- Insert record 4
SELECT insert_supplier(
	'Parts RUs', 
	123456789, 
	'parts_rus@example.com', 
	'4321 Pine Lane', 
	'Portland', 
	'OR', 
	97209
);

-- Retrieve records from Supplier table

SELECT * FROM Supplier;



-- Car Table

-- Inserting record 1
SELECT insert_car(
	'Toyota', 
	'Camry', 
	2021, 
	'JTDKARFU012345678', 
	'Blue', 
	25000.00, 
	1
);

-- Inserting record 2
SELECT insert_car(
	'Honda', 
	'Accord', 
	2020, 
	'1HGCR2F30EA123456', 
	'Red', 
	22000.00, 
	2
);

-- Inserting record 3
SELECT insert_car(
	'Ford', 
	'Mustang', 
	2019, 
	'1FA6P8TH5K5123456', 
	'Yellow', 
	35000.00, 
	3
);

-- Inserting record 4
SELECT insert_car(
	'Chevrolet', 
	'Cruze', 
	2018, 
	'3G1BE6SM3JS123456', 
	'Silver', 
	18000.00, 
	4
);

-- Inserting record 5
SELECT insert_car(
	'Toyota', 
	'Camry', 
	2021, 
	'JTDKARFU012345678', 
	'Blue', 
	25000.00, 
	NULL
);

-- Inserting record 6
SELECT insert_car(
	'Toyota', 
	'Corolla', 
	2020, 
	'1NXBU4EE3AZ123456', 
	'Silver', 
	22000.00,
	NULL
);

-- Inserting record 7
SELECT insert_car(
	'Toyota', 
	'Rav4', 
	2019, 
	'JTMDFREV7HD123456', 
	'White', 
	28000.00, 
	NULL
);

-- Inserting record 8
SELECT insert_car(
	'Toyota', 
	'Highlander', 
	2018, 
	'5TDJZRFH8JS123456', 
	'Red', 
	35000.00, 
	NULL
);

-- Inserting record 9
SELECT insert_car(
	'Toyota', 
	'Prius', 
	2017, 
	'JTDKBRFU912345678', 
	'Green', 
	20000.00, 
	NULL
);

-- Retriving records from Car table
SELECT * FROM Car;


-- Insertion of records in Service table

SELECT insert_service(
	'2023-04-14', 
	'Oil change', 
	'Completed', 
	50.0, 
	1);
	
SELECT insert_service(
	'2023-04-14', 
	'Brake replacement', 
	'Pending', 
	100.0, 
	2);
	
SELECT insert_service(
	'2023-04-14', 
	'Tire rotation', 
	'Completed', 
	30.0, 
	3);
	
SELECT insert_service(
	'2023-04-14', 
	'Spark plug replacement', 
	'Pending', 
	40.0, 
	4);

SELECT insert_service(
	'2023-04-14', 
	'Battery replacement',
	'Completed', 
	80.0, 
	5);
	
SELECT insert_service(
	'2023-04-14', 
	'Air filter replacement', 
	'Pending', 
	20.0, 
	6);
	
SELECT insert_service(
	'2023-04-14', 
	'Coolant flush', 
	'Completed', 
	60.0,
	4);
	
SELECT insert_service(
	'2023-04-14', 
	'Transmission fluid change', 
	'Pending',
	100.0,
	2);
	
SELECT insert_service(
	'2023-04-14', 
	'Wheel alignment', 
	'Completed',
	70.0, 
	1);
	
	
-- Retrieve the inserted records
SELECT * FROM Service;



-- Insertion of records in Invoice table

SELECT insert_invoice
('2023-04-14', 5000.0, 10.0, 5.0, 5500.0, 1, 1);

SELECT insert_invoice
('2023-04-14', 7500.0, 15.0, 7.0, 8000.0, 2, 2);

SELECT insert_invoice
('2023-04-14', 6000.0, 12.0, 6.0, 6500.0, 3, 1);

SELECT insert_invoice
('2023-04-14', 4500.0, 8.0, 4.0, 4800.0, 4, 3);

-- Retrieve the inserted records
SELECT * FROM Invoice;


-- Insertion of records in Parts table

SELECT insert_parts('Fuel pump', 9.99, 10, 'The fuel pump is responsible for delivering 
					fuel from the gas tank to the engine.', 1);
SELECT insert_parts('Air filter', 19.99, 5, 'The air filter is responsible for filtering the 
					air that enters the engine, removing dirt, dust, and debris.', 2);
SELECT insert_parts('Brake pads', 29.99, 15, ' Brake pads are a critical part of the braking 
					system that provide friction 
					against the brake rotors to slow down and stop the vehicle', 1);
SELECT insert_parts('Engine oil', 39.99, 8, 'Engine oil is responsible for lubricating 
					the engine moving parts, reducing friction, and helping to dissipate heat', 3);

-- Retrieve the inserted records
SELECT * FROM Parts;


-- Insertion of records in Parts_Service table

SELECT insert_parts_service(1, 1);
SELECT insert_parts_service(2, 2);
SELECT insert_parts_service(3, 3);
SELECT insert_parts_service(4, 4);

-- Retrieve the inserted records
SELECT * FROM Parts_Service;


-- Insertion of records in mechanic_service table

SELECT insert_mechanic_service(1, 1); 
SELECT insert_mechanic_service(2, 2); 
SELECT insert_mechanic_service(3, 3); 
SELECT insert_mechanic_service(4, 4);

-- Retrieve the inserted records
SELECT *
FROM Mechanic_Service;


