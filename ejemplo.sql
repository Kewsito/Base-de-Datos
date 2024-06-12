--* Caso Obras 
--* menos tuplas para hacer un seguimiento mas sencillo
drop schema Obras cascade create schema Obras CREATE TABLE Obras.obras (
	Co INT NOT NULL PRIMARY KEY,
	Descrip VARCHAR(50),
	Direc VARCHAR(50),
	Zona VARCHAR(50),
	EmpCon VARCHAR(50)
);
Insert into Obras.obras
values (
		100,
		'Construccion de Barrio',
		'Av. José Ignacio de la Roza Oeste 2174',
		'Santa Lucia',
		'FyF'
	),
	(
		200,
		'Departamentos',
		'Av. Rioja 2174 (s)',
		'Rawson',
		'CREAR'
	),
	(
		300,
		'Barrio',
		'Av. Libertador 774 (e)',
		'Rivadavia',
		'CREAR'
	);
CREATE TABLE Obras.Materiales (
	Cm INT NOT NULL PRIMARY KEY,
	Descrip VARCHAR(50),
	Precio INT
);
Insert into Obras.Materiales
values (10, 'Arena', 700),
	(20, 'Cal', 6000),
	(30, 'Hierro', 10000);
CREATE TABLE Obras.Ferreterias (
	Cuit INT NOT NULL PRIMARY KEY,
	Nom VARCHAR(50),
	Direc VARCHAR(50),
	Zona VARCHAR(50),
	Tel INT
);
Insert into Obras.Ferreterias
values (
		1,
		'Ferreteria Cordoba',
		'Av. Cordoba 44 (e)',
		'Capital',
		'4282169'
	),
	(
		2,
		'La cosita del coso',
		'Mendoza 15(s)',
		'Rawson',
		'4452132'
	);
CREATE TABLE Obras.Pedidos (
	Co INTEGER NOT NULL,
	Cm INTEGER NOT NULL,
	Cuit INTEGER NOT NULL,
	Fecha DATE NOT NULL,
	Cant INTEGER,
	primary key (Co, Cm, Cuit, Fecha),
	constraint fk_obra FOREIGN KEY (Co) REFERENCES Obras.Obras (Co),
	constraint fk_material FOREIGN KEY (Cm) REFERENCES Obras.Materiales (Cm),
	constraint fk_ferreteria FOREIGN KEY (Cuit) REFERENCES Obras.Ferreterias (Cuit)
);
Insert into Obras.Pedidos
values (100, 10, 1, '2020/12/05', 100),
	(100, 20, 1, '2018/04/22', 600),
	(100, 30, 2, '2019/06/05', 400),
	(100, 10, 1, '2020/12/06', null),
	(300, 10, 2, '2020/12/05', 300),
	(200, 10, 2, '2020/02/13', 10),
	(200, 30, 2, '2020/02/13', 5000);
--* 10. Muestre el nombre de los materiales que han sido pedidos para todas las obras realizadas.
select *
from Obras.materiales
where not exists (
		select *
		from Obras.obras
		where not exists (
				select *
				from Obras.pedidos
				where pedidos.cm = materiales.cm
					and pedidos.co = obras.co
			)
	) --* Obras que pedieron el material 10 y 20 
	--* INTERSECCION con intersect
select co
from Obras.pedidos
where cm = 10
intersect
select co
from Obras.pedidos
where cm = 20 --* IDEM ANTERIOR, pero MOSTRANDO TODOS LOS DATOS DE LA TABLA OBRAS
	--* INTERSECCION con intersect y subquery en el from
select *
from Obras.obras
	natural join (
		select co
		from Obras.pedidos
		where cm = 10
		intersect
		select co
		from Obras.pedidos
		where cm = 20
	) x --* INTERSECCION CON  IN
select *
from Obras.obras
where co in (
		select co
		from Obras.pedidos
		where cm = 10
	)
	and co in (
		select co
		from Obras.pedidos
		where cm = 20
	) --* INTERSECCION CON exists
select *
from Obras.obras
where exists (
		select co
		from Obras.pedidos
		where cm = 10
			and obras.co = pedidos.co
	)
	and exists (
		select co
		from Obras.pedidos
		where cm = 20
			and obras.co = pedidos.co
	) -- Obras que pedieron el material 10 y no pidieron el 20 
	-- !RESTA con EXCEPT
select co
from Obras.pedidos
where cm = 10
except
select co
from Obras.pedidos
where cm = 20 -- !RESTA con NOT IN
select co
from Obras.pedidos
where cm = 10
	and co not in (
		select co
		from Obras.pedidos
		where cm = 20
	) -- !RESTA con NOT EXISTS
select co
from Obras.pedidos p1
where cm = 10
	and not exists (
		select co
		from Obras.pedidos p2
		where p2.cm = 20
			and p1.co = p2.co
	) -- Muestre la cantidad total de arena pedida
select sum(cant)
from Obras.pedidos
	natural join Obras.materiales
where descrip = 'Arena' -- Muestre la cantidad total de arena pedida por Obra
select co,
	sum(cant)
from Obras.pedidos
	natural join Obras.materiales
where descrip = 'Arena'
group by co -- Muestre la cantidad total de arena pedida por Obra, para aquellas obras cuya cantidad es inferior a 300
select co,
	sum(cant)
from Obras.pedidos
	natural join Obras.materiales
where descrip = 'Arena'
group by co
having sum(cant) < 300 --* Muestre la cantidad de pedidos que realizo la obra 100
select count(*)
from Obras.pedidos
where co = 100 --* OJO!!! Muestre la cantidad de obras que pidieron el material 10
select count(distinct co)
from Obras.pedidos
where cm = 10
select count(co)
from Obras.pedidos
where cm = 10
select *
from Obras.pedidos
where cm = 10