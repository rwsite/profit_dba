DROP TABLE product;

CREATE TABLE product (
     id INTEGER PRIMARY KEY AUTOINCREMENT,
     title TEXT NOT NULL,
     sku TEXT UNIQUE NOT NULL CHECK ( length(product_version) <= 20 ),
     img TEXT,
     price INTEGER CHECK (price > 0),
     create_on DATE NOT NULL,
     stock INTEGER CHECK (stock >= 0),

     gallery TEXT,
     short_description TEXT,
     description TEXT,
     sale_price INTEGER CHECK (sale_price > 0),
     weight TEXT CHECK ( length(product_version) <= 5 ),
     height TEXT CHECK ( length(product_version) <= 5 ),
     depth TEXT CHECK ( length(product_version) <= 5 ),
     product_version TEXT CHECK ( length(product_version) <= 5 )
);

INSERT INTO product (title, sku, img, price, create_on, stock)
VALUES ('Пармезан', 2003, '', 2500, '2022-06-08', 20),
       ('Хлеб черный', 01, 'https://pr-of-it.ru/courses/dba-start.html', 50, '2022-06-08', 0),
       ('Хлеб белый', 200022, 'https://i.pinimg.com/736x/95/30/41/953041070f000d45c05c912005f63724.jpg', '80', '2022-06-08', 30),
       ('Молоко', 190091, '', 90, '2022-06-08', 100),
       ('Кефир', '100965', 'http://via.placeholder.com/640x360', 80, '2022-06-08', 50);

SELECT * FROM product;

INSERT INTO product (title, sku, img, price, create_on, stock)
VALUES ('Пармезан', 20ыва03, '', 2500, '2022-06-08', 20);
/* [1] [SQLITE_ERROR] SQL error or missing database (unrecognized token: "20ыва03") */

INSERT INTO product (title, sku, img, price, create_on, stock)
VALUES (null, 2003, '', 2500, '2022-06-08', 20);
/*
[19] [SQLITE_CONSTRAINT_NOTNULL] A NOT NULL constraint failed (NOT NULL constraint failed: product.title)
*/

INSERT INTO product (title, sku, img, price, create_on, stock)
VALUES ('null', 23, '', -2500, '2022-06-08', 20);
/*
[19] [SQLITE_CONSTRAINT_CHECK] A CHECK constraint failed (CHECK constraint failed: price > 0)
*/

INSERT INTO product (title, sku, img, price, create_on, stock)
VALUES ('title', 'sd34', 'https://via.placeholder.com/640x360', 0, '2022-13-08', 20);
/*
[19] [SQLITE_CONSTRAINT_CHECK] A CHECK constraint failed (CHECK constraint failed: price > 0)
*/

INSERT INTO product (title, sku, img, price, create_on, stock)
VALUES ('title', 'sd34', 'https://via.placeholder.com/640x360', 0, '2022-12-08', -3);
/*
[19] [SQLITE_CONSTRAINT_CHECK] A CHECK constraint failed (CHECK constraint failed: price > 0)
*/
