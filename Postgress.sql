CREATE DATABASE shop;

CREATE TABLE product (
     id SERIAL,
     title VARCHAR(250) NOT NULL,
     sku VARCHAR(20) UNIQUE NOT NULL,
     img TEXT,
     price BIGINT CHECK (price > 0),
     create_on DATE NOT NULL,
     stock BIGINT CHECK (stock >= 0),

     gallery TEXT,
     short_description TEXT,
     description TEXT,
     sale_price BIGINT CHECK (sale_price > 0),
     weight varchar(10),
     height varchar(10),
     depth varchar(10),
     product_version varchar(200)
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
/* [42601] ОШИБКА: ошибка синтаксиса (примерное положение: "ыва03") Позиция: 87 */

INSERT INTO product (title, sku, img, price, create_on, stock)
VALUES (null, 2003, '', 2500, '2022-06-08', 20);
/*
[23502] ОШИБКА: значение NULL в столбце "title" отношения "product" нарушает ограничение NOT NULL Подробности:
Ошибочная строка содержит (1, null, 2003, , 2500, 2022-06-08, 20, null, null, null, null, null, null, null, null).
*/

INSERT INTO product (title, sku, img, price, create_on, stock)
VALUES ('null', 23, '', -2500, '2022-06-08', 20);
/*
[2022-06-08 20:52:41] [23514] ОШИБКА: новая строка в отношении "product" нарушает ограничение-проверку "product_price_check"
[2022-06-08 20:52:41] Подробности: Ошибочная строка содержит (2, null, 23, , -2500, 2022-06-08, 20, null, null, null, null, null, null, null, null).
*/

INSERT INTO product (title, sku, img, price, create_on, stock)
VALUES ('title', 'sd34', 'https://via.placeholder.com/640x360', 0, '2022-13-08', 20);
/*
[22008] ОШИБКА: значение поля типа date/time вне диапазона: "2022-13-08"
Подсказка: Возможно, вам нужно изменить настройку "datestyle". Позиция: 132
*/

INSERT INTO product (title, sku, img, price, create_on, stock)
VALUES ('title', 'sd34', 'https://via.placeholder.com/640x360', 0, '2022-12-08', -3);
/*
[23514] ОШИБКА: новая строка в отношении "product" нарушает ограничение-проверку "product_price_check"
Подробности: Ошибочная строка содержит (3, title, sd34, https://via.placeholder.com/640x360, 0, 2022-12-08, -3, null, null, null, null, null, null, null, null).
*/