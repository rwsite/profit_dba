CREATE DATABASE shop;

SHOW DATABASES;

USE shop;

CREATE TABLE product (

    id SERIAL,
    title VARCHAR(250) NOT NULL,
    sku VARCHAR(20) UNIQUE NOT NULL,
    img LONGTEXT,
    price BIGINT UNSIGNED,
    create_on DATE NOT NULL,
    stock BIGINT UNSIGNED,

    gallery longtext,
    short_description longtext,
    description longtext,
    sale_price BIGINT UNSIGNED,
    weight varchar(10),
    height varchar(10),
    depth varchar(10),
    product_version varchar(200)
);

SELECT * FROM product;

INSERT INTO product (title, sku, img, price, create_on, stock)
VALUES ('Пармезан', 2003, '', 2500, '2022-06-08', 20),
       ('Хлеб черный', 01, 'https://pr-of-it.ru/courses/dba-start.html', 50, '2022-06-08', 0),
       ('Хлеб белый', 200022, 'https://i.pinimg.com/736x/95/30/41/953041070f000d45c05c912005f63724.jpg', '80', '2022-06-08', 30),
       ('Молоко', 190091, '', 90, '2022-06-08', 100),
       ('Кефир', '100965', 'http://via.placeholder.com/640x360', 80, '2022-06-08', 50);

SELECT * FROM product;

INSERT INTO product (title, sku, img, price, create_on, stock)
VALUES ('Пармезан', 20ыва03, '', 2500, '2022-06-08', 20);
# [42S22][1054] Unknown column '20ыва03' in 'field list'

INSERT INTO product (title, sku, img, price, create_on, stock)
VALUES (null, 2003, '', 2500, '2022-06-08', 20);
# [23000][1048] Column 'title' cannot be null

INSERT INTO product (title, sku, img, price, create_on, stock)
VALUES ('null', 23, '', -2500, '2022-06-08', 20);
# [22001][1264] Data truncation: Out of range value for column 'price' at row 1

INSERT INTO product (title, sku, img, price, create_on, stock)
VALUES ('title', 'sd34', 'https://via.placeholder.com/640x360', 0, '2022-13-08', 20);
# [22001][1292] Data truncation: Incorrect date value: '2022-13-08' for column `shop`.`product`.`create_on` at row 1

INSERT INTO product (title, sku, img, price, create_on, stock)
VALUES ('title', 'sd34', 'https://via.placeholder.com/640x360', 0, '2022-12-08', -3);
# [22001][1264] Data truncation: Out of range value for column 'stock' at row 1