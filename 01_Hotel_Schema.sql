CREATE TABLE users (
  user_id VARCHAR(50),
  name VARCHAR(100),
  phone_number VARCHAR(15),
  email_id VARCHAR(100),
  billing_address VARCHAR(200)
);

CREATE TABLE bookings (
  booking_id VARCHAR(50),
  booking_date DATETIME,
  room_no VARCHAR(50),
  user_id VARCHAR(50)
);

CREATE TABLE booking_commercials (
  id VARCHAR(50),
  booking_id VARCHAR(50),
  bill_id VARCHAR(50),
  bill_date DATETIME,
  item_id VARCHAR(50),
  item_quantity VARCHAR(50)
);

CREATE TABLE items (
  item_id VARCHAR(50),
  item_name VARCHAR(50),
  item_rate VARCHAR(50)
);

INSERT INTO
  users
VALUES
  (
    '21wrcxuy-67erfn',
    'John Doe',
    '97XXXXXXXX',
    'john@example.com',
    'ABC City'
  );

INSERT INTO
  bookings
VALUES
  (
    'bk-09f3e-95hj',
    '2021-09-23 7:36:48',
    'rm-bhf9-aerjn',
    '21wrcxuy-67erfn'
  );

INSERT INTO
  booking_commercials
VALUES
  (
    'q34r-3q4o8-q34u',
    'bk-09f3e-95hj',
    'bl-0a87y-q340',
    '2021-09-23 12:03:22',
    'itm-a9e8-q8fu',
    3
  ),
  (
    'q3o4-ahf32-o2u4',
    'bk-09f3e-95hj',
    'bl-0a87y-q340',
    '2021-09-23 12:03:22',
    'itm-a07vh-aer8',
    1
  ),
  (
    '134lr-oyfo8-3qk4',
    'bk-q034-q4o',
    'bl-34qhd-r7h8',
    '2021-09-23 12:05:37',
    'itm-w978-23u4',
    0.5
  );

INSERT INTO
  items
VALUES
  ('itm-a9e8-q8fu', 'Tawa Paratha', 18),
  ('itm-a07vh-aer8', 'Mix Veg', 89),
  ('itm-w978-23u4', 'Fried Rice', 120);