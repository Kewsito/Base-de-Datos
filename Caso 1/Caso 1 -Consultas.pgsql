-- * 7. Actualice la carga horaria del curso Ruby por 60.
UPDATE curso SET Ch = 60 WHERE Nom = 'Ruby';

-- *8. Elimine el curso Ruby I
DELETE FROM curso WHERE Nom = 'Ruby';

-- *9. Correo y nombre de todas las personas.
SELECT Correo,Nom FROM pers;

-- *10. Cantidad de cursos.
SELECT count(*) FROM curso;

-- *11. Cantidad de docentes.
SELECT count(*) FROM dicta;
-- *12. Nota máxima obtenida en el curso ‘’Python I‘’.
SELECT MAx(Nota) from insc where Nom='Python I';
-- *13. Nombre de los cursos ordenados por nombre.
SELECT Nom from curso ORDER BY Nom ASC;

-- *14. Nombre del curso que tiene una carga horaria superior a la de todos los cursos que dicta “pedroibañez@yahoo.com.ar”.
SELECT Nom FROM curso WHERE Ch > (SELECT MAX(Ch) FROM curso WHERE Nom IN (SELECT Nom FROM dicta WHERE Correo = 'pedroibañez@yahoo.com.ar'));
-- *15. Personas, docentes o alumnos(todos sus datos) que se llama Rosa

--? se agrego una fila con un nombre rosa para generar un resultado
INSERT INTO pers (correo, nomu,nom) VALUES ('rosa18@gmail.com','rosa18','Rosa Gonzales');

SELECT * from pers WHERE nom LIKE '%Rosa%';
-- *16. Cursos que tienen una carga horaria superior a la del curso “Kotlin I”, ordenados descendentemente por cantidad de horas.

SELECT * from curso WHERE Ch > (Select Ch from curso where nom='Kotlin I') ORDER BY Ch DESC;

-- *17. Cursos (todos los datos) cuya carga horaria sea superior a las 40 horas reloj.
SELECT * from curso WHERE Ch > 40;
--*18. Cursos (todos los datos) cuya carga horaria se encuentre entre 40 y 45 horas reloj.
select * from curso where Ch BETWEEN 40 and 45;

--*19. Docentes (correo y nombre) que dictan cursos.
SELECT Correo, Nom FROM pers WHERE Correo IN (SELECT Correo FROM dicta);
--*20. Listado de los cursos (nombre) junto a los datos del docente que los dicta.
SELECT Correo FROM curso, dicta WHERE curso.Nom = dicta.Nom;
--*21. Obtenga el curso (todos los datos) junto a los datos de los alumnos inscriptos. Se deben incluir todos los cursos  registrados más allá que no tengan alumnos inscriptos.. (Usar OUTER JOIN)
SELECT DISTINCT* FROM CURSO LEFT OUTER JOIN INSC ON CURSO.Nom = INSC.Nom;

--*22. Docentes (todos los datos) que dictan los cursos “Python I”.
SELECT * from pers where correo in (select correo from dicta where nom='Python I');
--*23. Docentes (todos los datos) que dictan los cursos “Python II”.
SELECT * from pers where correo in (select correo from dicta where nom='Python II');

--*24. Listado de docentes (correo) que dictan el curso “Python I” y/o “Python II”.
SELECT DISTINCT correo from dicta where nom='Python I' or nom='Python II';
--*25. Docentes (correo) que dictan los cursos “Python I” y “Python II”.
select correo from dicta where nom='Python I' INTERSECT select correo from dicta where nom='Python II';
--*26. Docentes (todos los datos) que cursaron algún curso de verano.
SELECT DISTINCT * FROM PERS WHERE Correo IN (SELECT Correod FROM INSC);
--*27. Alumnos (todos los datos) que se inscribieron en el curso “Kotlin I”.
SELECT * from pers WHERE correo in (SELECT correo from insc WHERE nom='Kotlin I');
--*28. Alumnos (todos los datos) que se inscribieron en el curso “Kotlin II”.
SELECT * from pers WHERE correo in (SELECT correo from insc WHERE nom='Kotlin II');

--*29. Listado de alumnos (correo) que se inscribieron tanto en el curso “Kotlin I” como “Kotlin II”.
SELECT * from pers WHERE correo in (SELECT correo from insc WHERE nom='Kotlin I') INTERSECT SELECT * from pers WHERE correo in (SELECT correo from insc WHERE nom='Kotlin II');


--*30. Alumnos (todos los datos) que aprobaron el curso “Python I” y “Python II”.
SELECT * from pers WHERE correo in (SELECT correo from insc WHERE nom='Python I' and nota>=4) INTERSECT SELECT * from pers WHERE correo in (SELECT correo from insc WHERE nom='Python II' and nota>=4);
--*31. Alumnos (Correo) que se inscribieron en más de un curso de verano.
select correo from insc GROUP by correo HAVING count(*)>1;
--*32. Docentes (correo) que dictan más de un curso.
select correo from dicta GROUP by correo HAVING count(*)>1;
--*33. Docentes (todos los datos) que dictan más de un curso cuya carga horaria sea inferior a 30 horas reloj.
SELECT * from pers where correo in (select correo from dicta GROUP by correo HAVING count(*)>1) and correo in (select correo from dicta where nom in (select nom from curso where ch<30));

--*34. Alumnos (correo) que cursaron los mismos cursos.
SELECT P1.Correo,P1.Nom FROM (SELECT * FROM INSC) AS P1 JOIN (SELECT * FROM INSC) AS P2 ON P1.Correo <> P2.Correo AND P1.Nom = P2.Nom;
--*35. Pares de Alumnos (todos los datos) que cursaron los mismos cursos.
(SELECT P1.Correo,P1.Nom,P2.Correo,P2.Nom
FROM (SELECT * FROM INSC) AS P1 
JOIN (SELECT * FROM INSC) AS P2 
ON P1.Correo <> P2.Correo AND P1.Nom = P2.Nom);

--*36. Pares de Alumnos que cursaron los mismos cursos con distinto profesor.
SELECT P1.Correo,P1.Nom,P2.Correo,P2.Nom
FROM (SELECT * FROM INSC) AS P1 
JOIN (SELECT * FROM INSC) AS P2 
ON P1.Correo <> P2.Correo AND P1.Nom = P2.Nom and P1.correod<>P2.correod;
--*37. Alumnos (todos los datos) que se inscribieron en todos los cursos de verano.
SELECT * FROM PERS WHERE NOT EXISTS ( -- <- Lo que muestro
    SELECT * FROM CURSO WHERE NOT EXISTS ( -- <- Divisor
        SELECT * FROM INSC -- <- Dividendo
        WHERE INSC.Nom = CURSO.Nom and INSC.Correo = PERS.Correo
    )
);

--*38. Alumnos (todos los datos) que se inscribieron en todos los cursos que dicta el profesor con correo “pedroibañez@yahoo.com.ar”

SELECT * FROM PERS WHERE NOT EXISTS ( -- <- Lo que muestro
    SELECT * FROM DICTA WHERE DICTA.Correo = 'pedroibañez@yahoo.com.ar' AND NOT EXISTS ( -- <- Divisor
        SELECT * FROM INSC -- <- Dividendo
        WHERE INSC.Correo = PERS.Correo AND INSC.Nom = DICTA.Nom
    )
);

--*39. Nombre/s de los cursos que tienen la mayor carga horaria.
SELECT Nom FROM CURSO WHERE Ch = (SELECT MAX(Ch) FROM CURSO);
--*40. Especifique la Vista “Cursoscortos” que tenga los siguientes atributos nombre, carga horaria. Los cursos cortos son aquellos cuya carga horaria es inferior a las 40 horas.

CREATE VIEW Cursoscortos AS SELECT Nom, ch FROM CURSO WHERE ch < 40;
--*41. Muestre los datos contenidos en la vista, ordenados según el nombre.

SELECT * from cursoscortos ORDER by nom;
--*42. Especifique la Vista (Alumnos_python1) que contenga los alumnos que se inscribieron en el curso “PYTHON I” correo, nombre de usuario y nombre).
CREATE view Alumnos_python1 as SELECT correo, nomu, nom from pers where correo in (select correo from insc WHERE nom='Python I');
--*43. Muestre los datos contenidos en la vista creada en el punto anterior, cuyo correo sea una cuenta de Gmail
SELECT * from alumnos_python1 where correo like '%@gmail%';
