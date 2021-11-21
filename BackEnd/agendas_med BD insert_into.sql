CREATE TABLE registro_paciente (
`Id_Paciente` int not null, -- cc --
`Nombre` varchar (100) not null,
`tipo doc` varchar (20) not null, 
`genero` varchar (5) not null,
`email` varchar (30) not null,
`Teléfono` varchar (20) not null,
`Ciudad` varchar (20) not null,
`Dirección` varchar (30) not null, 
`Edad`int not null,
`Contraseña` varchar (12) not null,
primary key (`Id_Paciente`)
);

CREATE TABLE registro_medico (
`Id_Medico` varchar (20) not null, -- tarjeta profesional --
`Nombre` varchar (100) not null,
`tipo doc` varchar (20) not null, 
`Doc Identidad`varchar (20) not null,
`email` varchar (30) not null,
`Teléfono` varchar (20) not null,
`Contraseña` varchar (12) not null,
primary key (`Id_Medico`)
);

CREATE TABLE c_medico ( 
`Id_CMedico` int not null auto_increment,
`C Medico` varchar (30) not null,
primary key (`Id_CMedico`)
);

CREATE TABLE especialidad (
`Id_Espe` int not null auto_increment,
`Especialidad`  varchar (30) not null,
primary key (`Id_Espe`)
);

CREATE TABLE especialidad_med (
`Id_Medico` varchar (20) not null,
`Id_Espe` int not null,
constraint `fk_Id_Medico` foreign key (`Id_Medico`) references `registro_medico` (`Id_Medico`),
constraint `fk_Id_Espe` foreign key (`Id_Espe`) references `especialidad` (`Id_Espe`)
);

CREATE TABLE Cmedico_Med (
`Id_CMedico` int not null,
`Id_Medico` varchar (20) not null,
constraint `fk_Id_CMedico` foreign key (`Id_CMedico`) references `c_medico` (`Id_CMedico`),
constraint `fk_Id_MedicoRel` foreign key (`Id_Medico`) references `registro_medico` (`Id_Medico`)
);

CREATE TABLE Consultoríos(
`Id_Consul` int not null auto_increment,
`Id_CMedico` int not null,
`Consultorío` varchar (10) not null,
primary key (`Id_Consul`),
constraint `fk_Id_CMedicoRel` foreign key (`Id_CMedico`) references `c_medico` (`Id_CMedico`)
);

CREATE TABLE Estados (
`Id_Estados` int not null,
`Estados` varchar (10) not null,
primary key (`Id_Estados`)
);

CREATE TABLE citas(
`Id_Citas` int not null auto_increment,
`Id_Paciente` int default null,
`Id_Medico` varchar (20) not null,
`Id_CMedico` int not null,
`Id_Espe` int not null,
`Id_Consul` int not null,
`Fecha` date not null,
`Hora` time not null,
`Valor` float not null,
`Id_Estados` int not null,
primary key (`Id_Citas`),
constraint `fk_Id_PacienteCitas` foreign key (`Id_Paciente`) references `registro_paciente` (`Id_Paciente`),
constraint `fk_Id_MedicoCitas` foreign key (`Id_Medico`) references `registro_medico` (`Id_Medico`),
constraint `fk_Id_CMedicoCitas` foreign key (`Id_CMedico`) references `c_medico` (`Id_CMedico`),
constraint `fk_Id_EspeCitas` foreign key (`Id_Espe`) references `especialidad` (`Id_Espe`),
constraint `fk_Id_ConsulCitas` foreign key (`Id_Consul`) references `Consultoríos` (`Id_Consul`),
constraint `fk_Id_EstadosCitas` foreign key (`Id_Estados`) references `Estados` (`Id_Estados`)
);

INSERT INTO `agendas_med`.`registro_medico` (`Id_Medico`, `Nombre`, `tipo doc`, `Doc Identidad`, `email`, `Teléfono`, `Contraseña`) VALUES ('TP564589', 'Carlos Parra', 'CC', '91689748', 'cparra@hotmail.com', '3625648796', 'parra');
INSERT INTO `agendas_med`.`registro_medico` (`Id_Medico`, `Nombre`, `tipo doc`, `Doc Identidad`, `email`, `Teléfono`, `Contraseña`) VALUES ('TP367895', 'Sandra  Perez', 'CC', '37458968', 'sandraperez@hotmail.com', '3204879687', 'sandra');
INSERT INTO `agendas_med`.`registro_medico` (`Id_Medico`, `Nombre`, `tipo doc`, `Doc Identidad`, `email`, `Teléfono`, `Contraseña`) VALUES ('TP450009', 'Juan Diaz', 'CC', '1085645879', 'juan.diad@hotmail.com', '320458796', 'diaz');
INSERT INTO `agendas_med`.`registro_medico` (`Id_Medico`, `Nombre`, `tipo doc`, `Doc Identidad`, `email`, `Teléfono`, `Contraseña`) VALUES ('TP474503', 'Roberto Calderon', 'CC', '91782466', 'roberto@hotmail.com', '316425897', 'roberto');

INSERT INTO `agendas_med`.`registro_paciente` (`Id_Paciente`, `Nombre`, `tipo doc`, `genero`, `email`, `Teléfono`, `Ciudad`, `Dirección`, `Edad`, `Contraseña`) VALUES ('18425789', 'Maria Rojas', 'CC', 'F', 'maria@hotmail.com', '3214587989', 'Bucaramanga', 'cra 20 45-79', '27', 'maria');
INSERT INTO `agendas_med`.`registro_paciente` (`Id_Paciente`, `Nombre`, `tipo doc`, `genero`, `email`, `Teléfono`, `Ciudad`, `Dirección`, `Edad`, `Contraseña`) VALUES ('37879435', 'Andres Rodriguez', 'CC', 'M', 'andres@gmail.com', '3154879654', 'Piedecuesta', 'clle 20 25-30', '35', 'andres');
INSERT INTO `agendas_med`.`registro_paciente` (`Id_Paciente`, `Nombre`, `tipo doc`, `genero`, `email`, `Teléfono`, `Ciudad`, `Dirección`, `Edad`, `Contraseña`) VALUES ('91789456', 'Roberto Meza', 'CC', 'M', 'ROBERTO@HOTMAIL.COM', '3214787985', 'BUCARAMANGA', 'Calle 25 96-78', '45', 'roberto');

INSERT INTO `agendas_med`.`c_medico` (`C Medico`) VALUES ('Centro Medico Bucaramanga');
INSERT INTO `agendas_med`.`c_medico` (`C Medico`) VALUES ('Clinica Comunero');
INSERT INTO `agendas_med`.`c_medico` (`C Medico`) VALUES ('Clinica Ardila Lule');
INSERT INTO `agendas_med`.`c_medico` (`C Medico`) VALUES ('Clinica Internacional');
INSERT INTO `agendas_med`.`c_medico` (`C Medico`) VALUES ('Clinica Chicamocha');
INSERT INTO `agendas_med`.`c_medico` (`C Medico`) VALUES ('Clinica Bucaramanga');

INSERT INTO `agendas_med`.`especialidad` (`Especialidad`) VALUES ('General');
INSERT INTO `agendas_med`.`especialidad` (`Especialidad`) VALUES ('Internista');
INSERT INTO `agendas_med`.`especialidad` (`Especialidad`) VALUES ('Cardiólogo');
INSERT INTO `agendas_med`.`especialidad` (`Especialidad`) VALUES ('Ginecólogo');
INSERT INTO `agendas_med`.`especialidad` (`Especialidad`) VALUES ('Cirujano');
INSERT INTO `agendas_med`.`especialidad` (`Especialidad`) VALUES ('Odontólogo');
INSERT INTO `agendas_med`.`especialidad` (`Especialidad`) VALUES ('Ortopedista');
INSERT INTO `agendas_med`.`especialidad` (`Especialidad`) VALUES ('Pediatra');

INSERT INTO `agendas_med`.`estados` (`Id_Estados`, `Estados`) VALUES ('1', 'Activo');
INSERT INTO `agendas_med`.`estados` (`Id_Estados`, `Estados`) VALUES ('2', 'Cancelado');
INSERT INTO `agendas_med`.`estados` (`Id_Estados`, `Estados`) VALUES ('3', 'Reagendar');
INSERT INTO `agendas_med`.`estados` (`Id_Estados`, `Estados`) VALUES ('4', 'Ralizada');
INSERT INTO `agendas_med`.`estados` (`Id_Estados`, `Estados`) VALUES ('5', 'Ausente');
INSERT INTO `agendas_med`.`estados` (`Id_Estados`, `Estados`) VALUES ('6', 'Agendado');

INSERT INTO `agendas_med`.`consultoríos` (`Id_CMedico`, `Consultorío`) VALUES ('1', '120A');
INSERT INTO `agendas_med`.`consultoríos` (`Id_CMedico`, `Consultorío`) VALUES ('1', '205C');
INSERT INTO `agendas_med`.`consultoríos` (`Id_CMedico`, `Consultorío`) VALUES ('2', 'TB305');
INSERT INTO `agendas_med`.`consultoríos` (`Id_CMedico`, `Consultorío`) VALUES ('2', 'TA205');
INSERT INTO `agendas_med`.`consultoríos` (`Id_CMedico`, `Consultorío`) VALUES ('3', '606');
INSERT INTO `agendas_med`.`consultoríos` (`Id_CMedico`, `Consultorío`) VALUES ('3', '405');
INSERT INTO `agendas_med`.`consultoríos` (`Id_CMedico`, `Consultorío`) VALUES ('4', '110');
INSERT INTO `agendas_med`.`consultoríos` (`Id_CMedico`, `Consultorío`) VALUES ('4', '201');
INSERT INTO `agendas_med`.`consultoríos` (`Id_CMedico`, `Consultorío`) VALUES ('5', 'T1101');
INSERT INTO `agendas_med`.`consultoríos` (`Id_CMedico`, `Consultorío`) VALUES ('5', 'T1303');
INSERT INTO `agendas_med`.`consultoríos` (`Id_CMedico`, `Consultorío`) VALUES ('6', '201');
INSERT INTO `agendas_med`.`consultoríos` (`Id_CMedico`, `Consultorío`) VALUES ('6', '302');

 INSERT INTO `agendas_med`.`cmedico_med` (`Id_CMedico`, `Id_Medico`) values ('1','TP367895');
 INSERT INTO `agendas_med`.`cmedico_med` (`Id_CMedico`, `Id_Medico`) values ('2','TP450009');
 INSERT INTO `agendas_med`.`cmedico_med` (`Id_CMedico`, `Id_Medico`) values ('3','TP474503');
 INSERT INTO `agendas_med`.`cmedico_med` (`Id_CMedico`, `Id_Medico`) values ('4','TP564589');
 INSERT INTO `agendas_med`.`cmedico_med` (`Id_CMedico`, `Id_Medico`) values ('5','TP564589');
 INSERT INTO `agendas_med`.`cmedico_med` (`Id_CMedico`, `Id_Medico`) values ('6','TP564589');
 INSERT INTO `agendas_med`.`cmedico_med` (`Id_CMedico`, `Id_Medico`) values ('4','TP474503');
 INSERT INTO `agendas_med`.`cmedico_med` (`Id_CMedico`, `Id_Medico`) values ('1','TP450009');

INSERT INTO `agendas_med`.`especialidad_med` (`Id_Medico`, `Id_Espe`) values ('TP474503','8');
INSERT INTO `agendas_med`.`especialidad_med` (`Id_Medico`, `Id_Espe`) values ('TP564589','5');
INSERT INTO `agendas_med`.`especialidad_med` (`Id_Medico`, `Id_Espe`) values ('TP450009','7');
INSERT INTO `agendas_med`.`especialidad_med` (`Id_Medico`, `Id_Espe`) values ('TP367895','1');
INSERT INTO `agendas_med`.`especialidad_med` (`Id_Medico`, `Id_Espe`) values ('TP367895','3');
INSERT INTO `agendas_med`.`especialidad_med` (`Id_Medico`, `Id_Espe`) values ('TP474503','1');
INSERT INTO `agendas_med`.`especialidad_med` (`Id_Medico`, `Id_Espe`) values ('TP564589','1');
INSERT INTO `agendas_med`.`especialidad_med` (`Id_Medico`, `Id_Espe`) values ('TP450009','1');

INSERT INTO `agendas_med`.`citas` (`Id_Paciente`, `Id_Medico`, `Id_CMedico`, `Id_Espe`, `Id_Consul`, `Fecha`, `Hora`, `Valor`, `Id_Estados`) VALUES ('18425789', 'TP367895', '1', '3', '1', '2021-11-20', '8:00:00', '50000', '6');
INSERT INTO `agendas_med`.`citas` (`Id_Medico`, `Id_CMedico`, `Id_Espe`, `Id_Consul`, `Fecha`, `Hora`, `Valor`, `Id_Estados`) VALUES ('TP564589', '4', '5', '7', '2021-11-21', '9:00', '50000', '1');
INSERT INTO `agendas_med`.`citas` (`Id_Medico`, `Id_CMedico`, `Id_Espe`, `Id_Consul`, `Fecha`, `Hora`, `Valor`, `Id_Estados`) VALUES ('TP564589', '4', '5', '7', '2021-11-21', '10:00', '50000', '1');
INSERT INTO `agendas_med`.`citas` (`Id_Paciente`, `Id_Medico`, `Id_CMedico`, `Id_Espe`, `Id_Consul`, `Fecha`, `Hora`, `Valor`, `Id_Estados`) VALUES ('91789456', 'TP450009', '2', '1', '3', '2021-11-20', '7:00', '50000', '1');




















