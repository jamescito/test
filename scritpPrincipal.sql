CREATE database test;

CREATE TABLE test.dbo.gestores (
  id numeric(38,0) IDENTITY(0,1) NOT NULL,
  nombre varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  CONSTRAINT gestores_pk PRIMARY KEY (id)
);

CREATE TABLE test.dbo.saldos (
  id numeric(38,0) IDENTITY(0,1) NOT NULL,
  valor decimal(38,0) NULL,
  CONSTRAINT saldo_pk PRIMARY KEY (id)
);

CREATE TABLE test.dbo.asignaciones (
  gestores_id numeric(38,0) NULL,
  saldo_id numeric(38,0) NULL
);


-- test.dbo.asignaciones foreign keys

ALTER TABLE test.dbo.asignaciones ADD CONSTRAINT asignaciones_saldo_FK FOREIGN KEY (gestores_id) REFERENCES test.dbo.saldo(id);
ALTER TABLE test.dbo.asignaciones ADD CONSTRAINT asignaciones_saldo_FK_1 FOREIGN KEY (saldo_id) REFERENCES test.dbo.saldo(id);



-- crearemos la consulta para agregar los saldos

INSERT INTO saldos (valor)
VALUES 
(2277), (3953), (4726), (1414), (627), (1784), (1634), (3958), (2156), (1347), 
(2166), (820), (2325), (3613), (2389), (4130), (2007), (3027), (2591), (3940), 
(3888), (2975), (4470), (2291), (3393), (3588), (3286), (2293), (4353), (3315), 
(4900), (794), (4424), (4505), (2643), (2217), (4193), (2893), (4120), (3352), 
(2355), (3219), (3064), (4893), (272), (1299), (4725), (1900), (4927), (4011);

-- agregamos los gestores

INSERT INTO gestores (nombre)
VALUES 
('Carlos Pérez'),
('María López'),
('Juan García'),
('Ana Rodríguez'),
('Luis Martínez'),
('Elena Fernández'),
('Jorge Sánchez'),
('Sara Morales'),
('David Ruiz'),
('Patricia Jiménez');
