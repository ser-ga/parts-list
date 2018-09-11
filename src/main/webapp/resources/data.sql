USE test;
DROP TABLE IF EXISTS part;
CREATE TABLE part (
  `ID`    INT          NOT NULL AUTO_INCREMENT,
  `NAME`  VARCHAR(255) NOT NULL,
  `COUNT` INT          NOT NULL,
  `BIND`  TINYINT(1)   NOT NULL,
  PRIMARY KEY (`ID`)
)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('1', 'Материнская плата', '1', '52');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('2', 'Процессор', '1', '21');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('3', 'Подсветка корпуса', '0', '2');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('4', 'Память', '1', '13');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('5', 'Звукова карта', '0', '17');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('6', 'HDD SATA диск', '0', '100');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('7', 'SSD SATA диск', '1', '112');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('8', 'Видеокарта', '0', '32');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('9', 'Блок питания', '1', '8');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('10', 'Кулер процессора', '1', '15');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('11', 'Кулер корпуса', '0', '46');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('12', 'Кабель питания', '0', '1');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('13', 'Термопаста', '0', '1');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('14', 'Сетевой адаптер Wi-Fi', '0', '11');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('15', 'Сетевой адаптер Ethernet', '0', '15');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('16', 'ТВ-тюнер', '0', '1');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('17', 'Радио-тюнер', '0', '1');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('18', 'Плата видеозахвата', '0', '2');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('19', 'Кабель SATA', '1', '14');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('20', 'SSD M.2 диск', '0', '22');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('21', 'HDD IDE диск', '0', '7');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('22', 'Привод DVD', '0', '2');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('23', 'Привод BD', '0', '5');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('24', 'Привод FDD', '0', '5');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('25', 'Корпус', '1', '25');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('26', 'SAS адаптер', '0', '1');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('27', 'USB 3.0 Контроллер', '0', '1');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('28', 'Салазки', '0', '1');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('29', 'Кардридер', '0', '1');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('30', 'Переходник питания SATA', '0', '3');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('31', 'Модем', '0', '1');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('32', 'Замок для корпуса', '0', '1');
INSERT INTO part (`ID`, `NAME`, `BIND`, `COUNT`) VALUES ('33', 'Плата криптозащиты информации', '0', '1');