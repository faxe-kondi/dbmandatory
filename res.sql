DROP DATABASE IF EXISTS restaurant;
CREATE DATABASE restaurant DEFAULT CHARACTER SET utf8mb4;
USE restaurant;

CREATE TABLE customer (
    customer_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(60) NOT NULL,
    Lname VARCHAR(60) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(120) NOT NULL UNIQUE
);

CREATE TABLE restaurant_table (
    table_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    table_num INT(3) NOT NULL,
    table_size INT(2) NOT NULL
);

CREATE TABLE books (
    booking_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    table_id INT(11) NOT NULL,
    customer_id INT(11) NOT NULL,
    bookedFor DATETIME NOT NULL,
    customer_amount INT(2) NOT NULL,
    FOREIGN KEY (table_id) REFERENCES restaurant_table(table_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- ---------- Mock data ----------

INSERT INTO restaurant_table (table_num, table_size) VALUES
    (1, 2),
    (2, 2),
    (3, 2),
    (4, 4),
    (5, 4),
    (6, 4),
    (7, 6),
    (8, 6),
    (9, 8),
    (10, 10);

INSERT INTO customer (Fname, Lname, email, phone) VALUES
    ('Mads',    'Jensen',      'mads.jensen@example.com',      '+4520123456'),
    ('Sofie',   'Nielsen',     'sofie.nielsen@example.com',    '+4521234567'),
    ('Emil',    'Hansen',      'emil.hansen@example.com',      '+4522345678'),
    ('Ida',     'Pedersen',    'ida.pedersen@example.com',     '+4523456789'),
    ('Oliver',  'Andersen',    'oliver.andersen@example.com',  '+4524567890'),
    ('Freja',   'Christensen', 'freja.christensen@example.com','+4525678901'),
    ('Lucas',   'Larsen',      'lucas.larsen@example.com',     NULL),
    ('Clara',   'Sørensen',    'clara.sorensen@example.com',   '+4526789012'),
    ('Noah',    'Rasmussen',   'noah.rasmussen@example.com',   '+4527890123'),
    ('Emma',    'Jørgensen',   'emma.jorgensen@example.com',   '+4528901234'),
    ('William', 'Petersen',    'william.petersen@example.com', '+4529012345'),
    ('Agnes',   'Madsen',      'agnes.madsen@example.com',     '+4530123456');

-- Bookings follow the 2-hour rule: no table has two bookings less than 2 hours apart,
-- and no party is larger than the table's seat count.
INSERT INTO books (table_id, customer_id, bookedFor, customer_amount) VALUES
    -- Sat 3 Oct (past)
    (4,  3, '2026-10-03 19:00:00', 4),
    -- Mon 5 Oct
    (1,  1, '2026-10-05 18:00:00', 2),
    (4,  2, '2026-10-05 18:30:00', 4),
    (4,  5, '2026-10-05 20:30:00', 3),
    (7,  3, '2026-10-05 19:00:00', 6),
    -- Tue 6 Oct
    (2,  4, '2026-10-06 17:30:00', 2),
    (2,  6, '2026-10-06 19:30:00', 2),
    (5,  7, '2026-10-06 18:00:00', 4),
    (9,  8, '2026-10-06 19:00:00', 7),
    -- Wed 7 Oct
    (3,  9, '2026-10-07 18:00:00', 2),
    (6, 10, '2026-10-07 19:00:00', 4),
    (10,11, '2026-10-07 18:30:00', 9),
    -- Thu 8 Oct
    (1, 12, '2026-10-08 19:00:00', 2),
    (8,  1, '2026-10-08 18:00:00', 5),
    (8,  3, '2026-10-08 20:15:00', 6),
    (4,  9, '2026-10-08 19:30:00', 4),
    -- Fri 9 Oct
    (7,  2, '2026-10-09 18:00:00', 6),
    (7,  6, '2026-10-09 20:00:00', 5),
    (5,  8, '2026-10-09 19:00:00', 3),
    (10, 4, '2026-10-09 19:30:00', 10),
    (9, 11, '2026-10-09 18:30:00', 8),
    -- Sat 10 Oct
    (1,  5, '2026-10-10 19:00:00', 2),
    (6, 12, '2026-10-10 18:00:00', 4),
    (6, 10, '2026-10-10 20:00:00', 2),
    (8,  7, '2026-10-10 19:00:00', 6),
    (10, 2, '2026-10-10 19:00:00', 8);