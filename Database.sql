Create database INVENTORY;

USE INVENTORY;

CREATE table CATEGORY(
CATEGORY VARCHAR (20) NOT NULL,
SUB_CATEGORY VARCHAR (20) NOT NULL);

INSERT INTO CATEGORY (CATEGORY, SUB_CATEGORY ) values ('Electronics', 'Smartphones');

CREATE TABLE table1_seq
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);
CREATE TABLE SMARTPHONES (
PID varchar(5) PRIMARY KEY NOT NULL,
BRAND VARCHAR (20) NOT NULL,
PRODUCT_NAME VARCHAR (20) NOT NULL,
COLOUR VARCHAR (20) NOT NULL,
SIZE VARCHAR (20) NOT NULL,
PROCESSOR VARCHAR (50) NOT NULL,
OS VARCHAR (20) NOT NULL,
RAM VARCHAR (20) NOT NULL,
STORAGE_CAPACITY VARCHAR (20) NOT NULL,
PRICE FLOAT NOT NULL,
QUANTITY INT
);
DELIMITER $$
CREATE TRIGGER tg_table1_insert
BEFORE INSERT ON Smartphones
FOR EACH ROW
BEGIN
  INSERT INTO table1_seq VALUES (NULL);
  SET NEW.Pid = CONCAT('ES', LPAD(LAST_INSERT_ID(), 3, '0'));
END$$
DELIMITER ;

INSERT INTO SMARTPHONES (BRAND, PRODUCT_NAME, COLOUR, SIZE, PROCESSOR, OS, RAM, STORAGE_CAPACITY, PRICE, QUANTITY) VALUES ('Samsung', 'S7', 'Black', '5.1 Inches', '
Exynos 8890', 'Android M', '4 GB', '32 GB', 43000, 20)  ;
INSERT INTO SMARTPHONES (BRAND, PRODUCT_NAME, COLOUR, SIZE, PROCESSOR, OS, RAM, STORAGE_CAPACITY, PRICE, QUANTITY) VALUES ('Samsung', 'S7', 'Gold', '5.1 Inches', '
Exynos 8890', 'Android M', '4 GB', '32 GB', 43000, 17)  ;
INSERT INTO SMARTPHONES (BRAND, PRODUCT_NAME, COLOUR, SIZE, PROCESSOR, OS, RAM, STORAGE_CAPACITY, PRICE, QUANTITY) VALUES ('Samsung', 'S7 EDGE', 'Black', '5.1 Inches', '
Exynos 8890', 'Android M', '4 GB', '32 GB', 50900, 12)  ;
INSERT INTO SMARTPHONES (BRAND, PRODUCT_NAME, COLOUR, SIZE, PROCESSOR, OS, RAM, STORAGE_CAPACITY, PRICE, QUANTITY) VALUES ('Apple', '6S', 'Golden', '4.7 Inches', '
Twister', 'IOS 7', '2 GB', '32 GB', 40000, 13)  ;
INSERT INTO SMARTPHONES (BRAND, PRODUCT_NAME, COLOUR, SIZE, PROCESSOR, OS, RAM, STORAGE_CAPACITY, PRICE, QUANTITY) VALUES ('Apple', '6S Plus', 'Golden', '5.3 Inches', '
Twister', 'IOS 7', '4 GB', '32 GB', 50000, 23)  ;
INSERT INTO SMARTPHONES (BRAND, PRODUCT_NAME, COLOUR, SIZE, PROCESSOR, OS, RAM, STORAGE_CAPACITY, PRICE, QUANTITY) VALUES ('Xiaomi', 'Mi 5', 'Golden', '5.1 Inches', '
Snapdragon 820', 'Android M', '4 GB', '32 GB', 23000, 52)  ;
INSERT INTO SMARTPHONES (BRAND, PRODUCT_NAME, COLOUR, SIZE, PROCESSOR, OS, RAM, STORAGE_CAPACITY, PRICE, QUANTITY) VALUES ('One Plus', '3', 'Grey', '5.5 Inches', '
Snapdragon 820', 'Android M', '6 GB', '64 GB', 28000, 34)  ;


select * from smartphones;



CREATE TABLE SMARTPHONES1 (
PID int PRIMARY KEY NOT NULL,
BRAND VARCHAR (20) NOT NULL,
PRODUCT_NAME VARCHAR (20) NOT NULL,
COLOUR VARCHAR (20) NOT NULL,
PRICE FLOAT NOT NULL,
QUANTITY INT,
EMI int
);
DELIMITER $$
CREATE PROCEDURE InsertRand(IN NumRows INT)
    BEGIN
        DECLARE i INT;
        SET i = 1;
        START TRANSACTION;
        WHILE i <= NumRows DO
            INSERT INTO SMARTPHONES1 (PID,BRAND,PRODUCT_NAME,COLOUR,PRICE,QUANTITY,EMI) VALUES (i,ELT(0.5 + RAND() * 6, 'SAMSUNG', 'APPLE', 'XIAOMI', 'MICROMAX', 'INTEX', 'ONEPLUS'),ELT(0.5 + RAND() * 6, 'S7', 'REDMI', 'MI5', 'S7 EDGE', '6S PLUS', 'ZENFONE'),ELT(0.5 + RAND() * 6, 'BLACK', 'GOLDEN', 'WHITE', 'GREY', 'BLUE', 'PINK'),(10000*(0.5+RAND()*6)),(10*(0.5+RAND()*9)),RAND()*1);
            SET i = i + 1;
        END WHILE;
        COMMIT;
    END$$
DELIMITER ;

CALL INSERTRAND (10000);
SELECT * FROM SMARTPHONES1;