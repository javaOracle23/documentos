DROP TABLE IF EXISTS `banco`.`persona`;
CREATE TABLE  `banco`.`persona` (
  `personaid` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(35) DEFAULT NULL,
  `genero` varchar(1) DEFAULT NULL,
  `edad` int(3) NOT NULL,
  `identificacion` int(11) NOT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `telefono` int(11) NOT NULL,
  PRIMARY KEY (`personaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `banco`.`cliente`;
CREATE TABLE  `banco`.`cliente` (
  `clienteid` int(11) NOT NULL AUTO_INCREMENT,
  `contrasena` varchar(35) DEFAULT NULL,
  `estado` varchar(5) DEFAULT NULL,
  `fkpersonaid` int(11) NOT NULL,
  PRIMARY KEY (`clienteid`),
  KEY `fkclientepersonaid` (`fkpersonaid`),
  CONSTRAINT `fkclientepersonaid` FOREIGN KEY (`fkpersonaid`) REFERENCES `persona` (`personaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `banco`.`cuenta`;
CREATE TABLE  `banco`.`cuenta` (
  `cuentaid` int(11) NOT NULL AUTO_INCREMENT,
  `numerocuenta` varchar(255) NOT NULL,
  `tipocuenta` varchar(10) NOT NULL DEFAULT '',
  `saldoinicial` float NOT NULL,
  `estado` varchar(5) NOT NULL,
  `fkclienteid` int(11) NOT NULL,
  PRIMARY KEY (`cuentaid`),
  UNIQUE KEY `uknumerocuenta` (`numerocuenta`,`tipocuenta`) USING HASH,
  KEY `fkcuentaclienteid` (`fkclienteid`),
  CONSTRAINT `fkcuentaclienteid` FOREIGN KEY (`fkclienteid`) REFERENCES `cliente` (`clienteid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `banco`.`movimientos`;
CREATE TABLE  `banco`.`movimientos` (
  `movimientosid` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` varchar(255) NOT NULL,
  `tipomovimiento` varchar(10) NOT NULL,
  `valor` float NOT NULL,
  `saldo` float NOT NULL,
  `estado` varchar(5) NOT NULL,
  `fkclienteid` int(11) NOT NULL DEFAULT '0',
  `fkcuentaid` int(11) NOT NULL,
  PRIMARY KEY (`movimientosid`),
  UNIQUE KEY `ukfecha` (`fecha`,`tipomovimiento`) USING HASH,
  KEY `fkmovclienteid` (`fkclienteid`),
  KEY `fkmovcuentaid` (`fkcuentaid`),
  CONSTRAINT `fkmovcuentaid` FOREIGN KEY (`fkcuentaid`) REFERENCES `cuenta` (`cuentaid`),
  CONSTRAINT `fkmovclienteid` FOREIGN KEY (`fkclienteid`) REFERENCES `cliente` (`clienteid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


