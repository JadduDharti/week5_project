-- Adding colunm to car table

ALTER TABLE Car
ADD COLUMN is_serviced BOOLEAN;


-- Procedure to update the vaule of is_service colunm in car table

CREATE OR REPLACE PROCEDURE update_car_service_status(
  p_car_id INTEGER,
  p_is_serviced BOOLEAN
)
LANGUAGE PLPGSQL
AS $$
BEGIN
  UPDATE Car
  SET is_serviced = p_is_serviced
  WHERE car_id = p_car_id;
END;
$$;

-- Calling the procedure

CALL update_car_service_status(7, true);
CALL update_car_service_status(2, true);
CALL update_car_service_status(9, true);
CALL update_car_service_status(1, true);
CALL update_car_service_status(4, true);

SELECT *
FROM car;



-- Extra update and alter

UPDATE invoice
SET mrp_car = c.price
FROM car c
WHERE invoice.car_id = c.car_id;

-- updating total amount as per tax discount and mrp

UPDATE invoice
SET total_amount = (mrp_car - discount) + ((tax / 100) * mrp_car);

SELECT *
FROM invoice;