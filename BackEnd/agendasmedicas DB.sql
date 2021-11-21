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

