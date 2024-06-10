
--*1. Muestre, a través de una consulta, los materiales (descripción) pedidos el día 06/06/2020.

SELECT * from materiales NATURAL join pedidos where fecha='2020-12-05';

--*2. Muestre para cada obra (indicando descripción) todos los materiales solicitados (descripción). Deben informarse todas las obras, más allá que aún no tenga materiales pedidos.

SELECT obras.descrip,materiales.descrip 
FROM obras LEFT JOIN pedidos ON obras.co = pedidos.co 
LEFT JOIN materiales ON materiales.cm = pedidos.cm ;

--kevin hice un primer join y lo uni con el otro, muy cerca de lo que intestaste
-- pero en caso del join es left join por las dudas de que alguna celda sea null
--*3. Muestre la cantidad total de bolsas de cal que han sido pedidas a la ferretería MR S.A.
SELECT count(cuit) FROM materiales natural join pedidos where materiales.descrip = 'Cal' and cuit = (SELECT cuit from ferreterias where nom= 'MR S.A');

--*4. Muestre la cantidad total de obras que han pedido materiales a la ferretería MR S.A.

SELECT count(*) FROM obras natural join pedidos WHERE cuit = (SELECT cuit from ferreterias where nom= 'MR S.A');

--*5. Muestre, para cada material pedido a alguna ferretería, el código de material, código de obra y la cantidad total pedida (independientemente de la ferretería).

SELECT materiales.cm, obras.co, pedidos.cant FROM 
obras JOIN pedidos ON obras.co = pedidos.co 
JOIN materiales ON materiales.cm = pedidos.cm;

--*6. Muestre la descripción de materiales pedidos para alguna obra en una cantidad promedio mayor a 320 unidades.

SELECT materiales.descrip from materiales join pedidos on materiales.cm = pedidos.cm and pedidos.cant >(SELECT avg(cant) from pedidos);
--*7. Muestre el nombre del material menos pedido (en cantidad total).
--*8. Muestre la descripción de las obras que no han utilizado pintura.
--*9. Muestre el nombre de las obras abastecidas totalmente por la ferretería MR S.A.
--*10. Muestre el nombre de los materiales que han sido pedidos para todas las obras realizadas.
11. Actualice el teléfono de la Ferretería San Ignacio por el número 4312548.
12. Elimine el Material con descripción Cemento Avellaneda.
13. Especifique la Vista “ObrasCuyoNorte” que contenga Co (código de la obra), Direc(dirección de la obra) y EmpCon 
(empresa constructora) de las obras ubicadas en la zona Santa Lucia.
14. Especifique la Vista “ObrasMat” que contenga Obra (código de la obra), Empresa (empresa constructora), Material 
(descripción del material) y CantMat (cantidad de materiales pedidos).
a. Muestre los datos contenidos en la vista, ordenados según obra (descendente) y material (ascendente).
b. Actualice la cantidad de materiales pedidos de las obras incrementándolas en 100.*/