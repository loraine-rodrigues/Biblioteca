-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.35-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema biblioteca
--

CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

--
-- Definition of table `autor`
--

DROP TABLE IF EXISTS `autor`;
CREATE TABLE `autor` (
  `cd_autor` int(11) NOT NULL,
  `nm_autor` varchar(50) DEFAULT NULL,
  `nm_nacionalidade` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`cd_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `autor`
--

/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` (`cd_autor`,`nm_autor`,`nm_nacionalidade`) VALUES 
 (22564411,'Walter Isaacson','Americana'),
 (55490076,'Adélia Prado','Brasileira'),
 (77548854,'Ana Lucia Jankovic Barduchi','Brasileira'),
 (85668900,'Ethevaldo Siqueira','Brasileira'),
 (90984133,'Steven K. Scott','Americana');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;


--
-- Definition of table `editora`
--

DROP TABLE IF EXISTS `editora`;
CREATE TABLE `editora` (
  `cd_editora` int(11) NOT NULL,
  `nm_editora` varchar(35) DEFAULT NULL,
  `nm_endereco` varchar(60) DEFAULT NULL,
  `cd_contato` char(11) DEFAULT NULL,
  PRIMARY KEY (`cd_editora`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `editora`
--

/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` (`cd_editora`,`nm_editora`,`nm_endereco`,`cd_contato`) VALUES 
 (2134000,'Saraiva','São Paulo','08003434'),
 (2287000,'Eras','Brasilia','08002432'),
 (3557000,'Summer','Curitiba','08002198'),
 (6655000,'Pontos','São Paulo','08005600'),
 (9898000,'Saraiva','São Paulo','08003434');
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;


--
-- Definition of table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE `funcionario` (
  `cd_cpf` char(11) NOT NULL,
  `nm_funcionario` varchar(50) DEFAULT NULL,
  `nm_endereco` varchar(60) DEFAULT NULL,
  `cd_telefone` char(11) DEFAULT NULL,
  `vl_salario` decimal(9,2) DEFAULT NULL,
  `nm_funcao` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cd_cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `funcionario`
--

/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` (`cd_cpf`,`nm_funcionario`,`nm_endereco`,`cd_telefone`,`vl_salario`,`nm_funcao`) VALUES 
 ('20321295096','João Alberto Smith','Itatiba','22441865','0.00',NULL),
 ('23161197770','Ana Salles Azir','Salto','22317865','0.00','Recepcionista'),
 ('30361290876','Ademir José Silva','Campinas','22317865','0.00',NULL),
 ('32361298734','Luiz Henrique Talles','Campinas','21531785','800.00','Auxiliar'),
 ('45403612087','Francisco José Almeida','Indaiatuba','25417761','0.00',NULL),
 ('61254590871','Lucia Vicentim','Salto','21316565','0.00','Bibliotecaria');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;


--
-- Definition of table `livro`
--

DROP TABLE IF EXISTS `livro`;
CREATE TABLE `livro` (
  `cd_livro` int(11) NOT NULL,
  `nm_titulo` varchar(60) DEFAULT NULL,
  `nm_genero` varchar(25) DEFAULT NULL,
  `aa_publicacao` year(4) DEFAULT NULL,
  `cd_cpf_funcionario` char(11) DEFAULT NULL,
  `cd_editora` int(11) DEFAULT NULL,
  `cd_cpf_usuario_retirar` char(11) DEFAULT NULL,
  `cd_cpf_usuario_reservar` char(11) DEFAULT NULL,
  PRIMARY KEY (`cd_livro`),
  KEY `fk_livro_funcinario` (`cd_cpf_funcionario`),
  KEY `fk_livro_editora` (`cd_editora`),
  KEY `fk_livro_usuario_retirar` (`cd_cpf_usuario_retirar`),
  KEY `fk_livro_usuario_reservar` (`cd_cpf_usuario_reservar`),
  CONSTRAINT `fk_livro_editora` FOREIGN KEY (`cd_editora`) REFERENCES `editora` (`cd_editora`),
  CONSTRAINT `fk_livro_funcinario` FOREIGN KEY (`cd_cpf_funcionario`) REFERENCES `funcionario` (`cd_cpf`),
  CONSTRAINT `fk_livro_usuario_reservar` FOREIGN KEY (`cd_cpf_usuario_reservar`) REFERENCES `usuario` (`cd_cpf`),
  CONSTRAINT `fk_livro_usuario_retirar` FOREIGN KEY (`cd_cpf_usuario_retirar`) REFERENCES `usuario` (`cd_cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `livro`
--

/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` (`cd_livro`,`nm_titulo`,`nm_genero`,`aa_publicacao`,`cd_cpf_funcionario`,`cd_editora`,`cd_cpf_usuario_retirar`,`cd_cpf_usuario_reservar`) VALUES 
 (10277843,'O Pelicano','Romance',1984,NULL,2134000,NULL,NULL),
 (32176500,'Salomão - O homem Mais Rico que já Existiu','Romance',2011,'61254590871',6655000,NULL,NULL),
 (45112239,'Steve Jobs - A Biografia','Biografia',2011,NULL,2287000,'19321122213',NULL),
 (67392217,'Empregabilidade - Competências Pessoais e Profissionais','Administração',1977,'32361298734',9898000,NULL,NULL),
 (67554421,'Bagagem','Poesia',1972,NULL,6655000,NULL,'19321122213'),
 (77680012,'A Duração do Dia','Poesia',2010,NULL,2134000,'10122020232',NULL),
 (87659908,'Tecnologias que Mudam a Nossa Vida','Tecnologia',2007,NULL,2134000,NULL,'70964411900');
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;


--
-- Definition of table `livro_autor`
--

DROP TABLE IF EXISTS `livro_autor`;
CREATE TABLE `livro_autor` (
  `cd_livro` int(11) NOT NULL DEFAULT '0',
  `cd_autor` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cd_livro`,`cd_autor`),
  KEY `fk_livro_autor_autor` (`cd_autor`),
  CONSTRAINT `fk_livro_autor_autor` FOREIGN KEY (`cd_autor`) REFERENCES `autor` (`cd_autor`),
  CONSTRAINT `fk_livro_autor_livro` FOREIGN KEY (`cd_livro`) REFERENCES `livro` (`cd_livro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `livro_autor`
--

/*!40000 ALTER TABLE `livro_autor` DISABLE KEYS */;
INSERT INTO `livro_autor` (`cd_livro`,`cd_autor`) VALUES 
 (10277843,55490076),
 (10277843,85668900),
 (32176500,90984133),
 (45112239,22564411),
 (67392217,77548854),
 (67554421,55490076),
 (77680012,55490076),
 (87659908,85668900);
/*!40000 ALTER TABLE `livro_autor` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `cd_cpf` char(11) NOT NULL,
  `nm_nome` char(50) DEFAULT NULL,
  `nm_endereco` varchar(60) DEFAULT NULL,
  `cd_telefone` char(11) DEFAULT NULL,
  PRIMARY KEY (`cd_cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`cd_cpf`,`nm_nome`,`nm_endereco`,`cd_telefone`) VALUES 
 ('10122020232','Maria de Lourdes Amaral','35440089',NULL),
 ('19321122213','José Francisco de Paula','27219756',NULL),
 ('22539910976','Ivete Medina Chernell','48170352',NULL),
 ('45399109881','Raquel Santos','87603451',NULL),
 ('70964411900','Luiza Souza Prado','34559087',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
