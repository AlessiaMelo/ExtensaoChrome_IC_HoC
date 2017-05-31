-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2017 at 12:35 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `extensaoic`
--

-- --------------------------------------------------------

--
-- Table structure for table `alunos`
--

CREATE TABLE `alunos` (
  `idmaquina` int(11) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `atividades`
--

CREATE TABLE `atividades` (
  `nomeativ` varchar(50) NOT NULL,
  `descricao` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `atividades`
--

INSERT INTO `atividades` (`nomeativ`, `descricao`) VALUES
('HoC: Star Wars', 'Atividade em dinâmica de construção de jogo. Trabalha instruções de direção, desvio, programação de eventos e criação de funções. Estimula a criatividade e deixa o aluno livre para definir detalhes como sons e background');

-- --------------------------------------------------------

--
-- Table structure for table `fases`
--

CREATE TABLE `fases` (
  `idmaquina` int(11) NOT NULL,
  `data` date NOT NULL,
  `nomeativ` varchar(50) NOT NULL,
  `fase` int(11) NOT NULL,
  `dicas` int(11) NOT NULL,
  `tentativas` int(11) NOT NULL,
  `idhora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gabaritos`
--

CREATE TABLE `gabaritos` (
  `nomeativ` varchar(50) NOT NULL,
  `fase` int(11) NOT NULL,
  `conceito` varchar(250) DEFAULT NULL,
  `gabarito` varchar(500) DEFAULT NULL,
  `obs` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gabaritos`
--

INSERT INTO `gabaritos` (`nomeativ`, `fase`, `conceito`, `gabarito`, `obs`) VALUES
('HoC: Star Wars', 1, 'Direção', 'moveRigth();\r\nmoveRigth();', NULL),
('HoC: Star Wars', 2, 'Direção', 'moveRigth();\r\nmoveRigth();\r\nmoveDown();\r\nmoveDown();', NULL),
('HoC: Star Wars', 3, 'Direção e desvio de obstáculos', 'moveRigth();\r\nmoveUp();\r\nmoveDown();\r\nmoveRigth();', NULL),
('HoC: Star Wars', 4, 'Direção e desvio de obstáculos', 'moveDown();\r\nmoveLeft();\r\nmoveLeft();\r\nmoveDown();\r\nmoveDown();\r\nmoveLeft();', NULL),
('HoC: Star Wars', 5, 'Direção e desvio de obstáculos', 'moveRigth();\r\nmoveRigth();\r\nmoveDown();\r\nmoveDown();\r\nmoveDown();\r\nmoveLeft();', NULL),
('HoC: Star Wars', 6, 'Direção e desvio de obstáculos', 'moveDown();\r\nmoveDown();\r\nmoveUp();\r\nmoveRigth();\r\nmoveRigth();\r\nmoveUp();\r\nmoveDown();\r\nmoveRigth();', NULL),
('HoC: Star Wars', 7, 'Programação de ações/eventos por meio de funções ', 'moveUp();\r\n\r\nmoveDown();', NULL),
('HoC: Star Wars', 8, 'Programação de ações/eventos por meio de funções ', 'moveUp();\r\n\r\nmoveDown();\r\n\r\nmoveLeft();\r\n\r\nmoveRight();\r\n', NULL),
('HoC: Star Wars', 9, 'Programação de ações/eventos por meio de funções \r\n', 'Studio.playSound(\'block_id_4\', \'R2-D2random\');\r\nStudio.addPoints(\'block_id_5\', \'300\');', 'Adicionar apenas 100 pontos não é suficiente. Deve-se alterar o valor ou repetir o bloco \"addPoints\" três vezes.'),
('HoC: Star Wars', 10, 'Programação de ações/eventos por meio de funções \r\n', 'Studio.playSound(\'block_id_8\', \'R2-D2random\');\r\nStudio.removePoints(\'block_id_9\', \'100\');\r\n\r\nStudio.addPoints(\'block_id_12\', \'100\');\r\n\r\nStudio.addPoints(\'block_id_14\', \'100\');', 'Fase livre. O gabarito é apenas uma sugestão. \r\n'),
('HoC: Star Wars', 11, 'Programação de ações/eventos por meio de funções ', 'Studio.playSound(\'block_id_7\', \'R2-D2sound1\');\r\nStudio.addCharacter(\'block_id_8\', \"pufferpig\");\r\nStudio.addCharacter(\'block_id_12\', \"pufferpig\");\r\nStudio.addCharacter(\'block_id_13\', \"pufferpig\");\r\n\r\nStudio.playSound(\'block_id_10\', \'PufferPigRandom\');\r\nStudio.addPoints(\'block_id_11\', \'1000\');', 'Fase livre. Deve pelo menos adicionar 3 PufferPig.'),
('HoC: Star Wars', 12, 'Programação de ações/eventos por meio de funções ', 'Studio.addCharacter(\'block_id_8\', \"tauntaun\");\r\nStudio.addCharacter(\'block_id_9\', \"tauntaun\");\r\nStudio.addCharacter(\'block_id_10\', \"tauntaun\");\r\nStudio.addCharacter(\'block_id_11\', \"tauntaun\");\r\n\r\nStudio.playSound(\'block_id_13\', \'TauntaunRandom\');\r\nStudio.addPoints(\'block_id_14\', \'50\');\r\nStudio.addCharacter(\'block_id_15\', \"mynock\");\r\nStudio.addCharacter(\'block_id_16\', \"mynock\");', 'Fase livre.  '),
('HoC: Star Wars', 13, 'Programação de ações/eventos por meio de funções ', 'Studio.addCharacter(\'block_id_7\', \"mousedroid\");\r\nStudio.playSound(\'block_id_8\', \'R2-D2sound3\');\r\nStudio.addCharacter(\'block_id_9\', \"mousedroid\");\r\nStudio.addCharacter(\'block_id_10\', \"mousedroid\");\r\nStudio.addCharacter(\'block_id_12\', \"mousedroid\");\r\nStudio.addCharacter(\'block_id_15\', \"mousedroid\");\r\n\r\nStudio.addCharacter(\'block_id_13\', \"mousedroid\");\r\nStudio.addCharacter(\'block_id_14\', \"mousedroid\");', 'Fase livre. Pode adicionar qualquer quantidade de pontos ou mouse droids.'),
('HoC: Star Wars', 14, 'Programação de ações/eventos por meio de funções ', 'Studio.addCharacter(\'block_id_11\', \"rebelpilot\");\r\nStudio.addCharacter(\'block_id_12\', \"rebelpilot\");\r\nStudio.addCharacter(\'block_id_13\', \"rebelpilot\");\r\nStudio.setBackground(\'block_id_14\', Studio.random([\"endor\",\"hoth\",\"starship\"]));\r\nStudio.setMap(\'block_id_15\', Studio.random([\"blank\",\"circle\",\"horizontal\",\"grid\",\"blobs\"]));\r\nStudio.setDroidSpeed(\'block_id_17\', \"fast\");\r\n\r\nStudio.addPoints(\'block_id_18\', \'100\');\r\n', 'Fase livre. Deve apenas capturar os pilotos rebeldes.\r\n'),
('HoC: Star Wars', 15, 'Programação de ações/eventos por meio de funções ', 'Studio.setBackground(\'block_id_2\', \"endor\");\r\nStudio.setMap(\'block_id_3\', \"circle\");\r\nStudio.setSprite(\'block_id_4\', 0, \"r2-d2\");\r\nStudio.setDroidSpeed(\'block_id_5\', \"normal\");\r\nStudio.playSound(\'block_id_6\', \'R2-D2random\');', 'Fase completamente livre. ');

-- --------------------------------------------------------

--
-- Table structure for table `versoes`
--

CREATE TABLE `versoes` (
  `idmaquina` int(11) NOT NULL,
  `data` date NOT NULL,
  `nomeativ` varchar(50) NOT NULL,
  `fase` int(11) NOT NULL,
  `versao` int(11) NOT NULL,
  `codigo` varchar(500) DEFAULT NULL,
  `hora` time NOT NULL,
  `idhora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`idmaquina`,`data`,`hora`);

--
-- Indexes for table `atividades`
--
ALTER TABLE `atividades`
  ADD PRIMARY KEY (`nomeativ`);

--
-- Indexes for table `fases`
--
ALTER TABLE `fases`
  ADD PRIMARY KEY (`idmaquina`,`data`,`nomeativ`,`fase`,`idhora`),
  ADD KEY `idmaquina` (`idmaquina`,`data`,`idhora`),
  ADD KEY `nomeativ` (`nomeativ`);

--
-- Indexes for table `gabaritos`
--
ALTER TABLE `gabaritos`
  ADD PRIMARY KEY (`nomeativ`,`fase`);

--
-- Indexes for table `versoes`
--
ALTER TABLE `versoes`
  ADD PRIMARY KEY (`idmaquina`,`data`,`nomeativ`,`fase`,`versao`,`idhora`),
  ADD KEY `idmaquina` (`idmaquina`,`data`,`idhora`),
  ADD KEY `nomeativ` (`nomeativ`,`fase`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fases`
--
ALTER TABLE `fases`
  ADD CONSTRAINT `fases_ibfk_1` FOREIGN KEY (`idmaquina`) REFERENCES `alunos` (`idmaquina`),
  ADD CONSTRAINT `fases_ibfk_2` FOREIGN KEY (`idmaquina`,`data`) REFERENCES `alunos` (`idmaquina`, `data`),
  ADD CONSTRAINT `fases_ibfk_3` FOREIGN KEY (`nomeativ`) REFERENCES `atividades` (`nomeativ`),
  ADD CONSTRAINT `fases_ibfk_4` FOREIGN KEY (`idmaquina`,`data`,`idhora`) REFERENCES `alunos` (`idmaquina`, `data`, `hora`),
  ADD CONSTRAINT `fases_ibfk_5` FOREIGN KEY (`nomeativ`) REFERENCES `atividades` (`nomeativ`);

--
-- Constraints for table `gabaritos`
--
ALTER TABLE `gabaritos`
  ADD CONSTRAINT `gabaritos_ibfk_1` FOREIGN KEY (`nomeativ`) REFERENCES `atividades` (`nomeativ`),
  ADD CONSTRAINT `gabaritos_ibfk_2` FOREIGN KEY (`nomeativ`) REFERENCES `atividades` (`nomeativ`),
  ADD CONSTRAINT `gabaritos_ibfk_3` FOREIGN KEY (`nomeativ`) REFERENCES `atividades` (`nomeativ`);

--
-- Constraints for table `versoes`
--
ALTER TABLE `versoes`
  ADD CONSTRAINT `versoes_ibfk_1` FOREIGN KEY (`idmaquina`,`data`) REFERENCES `alunos` (`idmaquina`, `data`),
  ADD CONSTRAINT `versoes_ibfk_2` FOREIGN KEY (`nomeativ`,`fase`) REFERENCES `gabaritos` (`nomeativ`, `fase`),
  ADD CONSTRAINT `versoes_ibfk_4` FOREIGN KEY (`nomeativ`,`fase`) REFERENCES `gabaritos` (`nomeativ`, `fase`),
  ADD CONSTRAINT `versoes_ibfk_5` FOREIGN KEY (`idmaquina`,`data`,`idhora`) REFERENCES `alunos` (`idmaquina`, `data`, `hora`),
  ADD CONSTRAINT `versoes_ibfk_6` FOREIGN KEY (`nomeativ`,`fase`) REFERENCES `gabaritos` (`nomeativ`, `fase`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
