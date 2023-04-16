-- Create a function to get car ids in service
CREATE OR REPLACE FUNCTION get_cars_in_service()
RETURNS SETOF INTEGER
AS $$
DECLARE
  car_id INTEGER;
  cur CURSOR FOR
  SELECT DISTINCT s.car_id 
  FROM car s 
  WHERE s.is_serviced IS true; -- Assuming is_serviced is true for services that are currently in progress
BEGIN
  -- Open the cursor
  OPEN cur;
  
  -- Fetch car ids from the cursor
  LOOP
    FETCH cur INTO car_id;
    EXIT WHEN NOT FOUND;
    
    -- Return each car id as a result
    RETURN NEXT car_id;
  END LOOP;
  
  -- Close the cursor
  CLOSE cur;
  
  -- Return the result
  RETURN;
END;
$$ 
LANGUAGE PLPGSQL;



-- Call the get_cars_in_service function and fetch the result
SELECT * FROM get_cars_in_service();




--  SOME EXTRA SPICE


CREATE OR REPLACE FUNCTION calculate_car_revenue(p_car_id INTEGER)
RETURNS NUMERIC
AS $$
DECLARE
  total_revenue NUMERIC;
BEGIN
  -- Perform calculations to determine total revenue for the car with the given car_id
  -- For example, assuming you have tables named Invoice and Car with appropriate columns
  SELECT SUM(total_amount) INTO total_revenue
  FROM Invoice
  WHERE car_id = p_car_id;
  
  RETURN total_revenue;
END;
$$ 
LANGUAGE PLPGSQL;


-- Create a procedure that calls the calculate_car_revenue function
CREATE OR REPLACE PROCEDURE get_car_revenue(p_car_id INTEGER)
AS $$
DECLARE
  car_revenue NUMERIC;
BEGIN
  -- Call the calculate_car_revenue function to get the total revenue for the car
  car_revenue := calculate_car_revenue(p_car_id);
  
  -- Print the total revenue for the car
  RAISE NOTICE 'Total revenue for Car ID %: $%', p_car_id, car_revenue;
END;
$$ 
LANGUAGE PLPGSQL;

-- Call the get_car_revenue procedure for car with car_id = 1
CALL get_car_revenue(1);