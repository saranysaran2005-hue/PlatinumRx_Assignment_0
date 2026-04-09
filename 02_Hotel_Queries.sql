SELECT user_id, room_no
FROM bookings b1
WHERE booking_date = (
    SELECT MAX(booking_date)
    FROM bookings b2
    WHERE b2.user_id = b1.user_id
);  

SELECT 
    b.booking_id,
    SUM(bc.item_quantity * i.item_rate) AS total_amount
FROM bookings b
JOIN booking_commercials bc 
    ON b.booking_id = bc.booking_id
JOIN items i 
    ON bc.item_id = i.item_id
WHERE MONTH(b.booking_date) = 11 
  AND YEAR(b.booking_date) = 2021
GROUP BY b.booking_id;  

SELECT 
    bc.bill_id,
    SUM(bc.item_quantity * i.item_rate) AS total_amount
FROM booking_commercials bc
JOIN items i 
    ON bc.item_id = i.item_id
WHERE MONTH(bc.bill_date) = 10
  AND YEAR(bc.bill_date) = 2021
GROUP BY bc.bill_id
HAVING total_amount > 1000;  

SELECT 
    MONTH(bc.bill_date) AS month,
    i.item_name,
    SUM(bc.item_quantity) AS total_qty
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE YEAR(bc.bill_date) = 2021
GROUP BY MONTH(bc.bill_date), i.item_name
HAVING total_qty = (
    SELECT MAX(total_qty)
    FROM (
        SELECT 
            SUM(item_quantity) AS total_qty
        FROM booking_commercials
        WHERE YEAR(bill_date) = 2021
        GROUP BY MONTH(bill_date), item_id
    ) t
);  

SELECT *
FROM (
    SELECT 
        MONTH(bc.bill_date) AS month,
        bc.bill_id,
        SUM(bc.item_quantity * i.item_rate) AS total_amount
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    WHERE YEAR(bc.bill_date) = 2021
    GROUP BY MONTH(bc.bill_date), bc.bill_id
    ORDER BY total_amount DESC
) t
LIMIT 1 OFFSET 1;