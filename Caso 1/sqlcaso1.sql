CREATE TABLE PERS (
    Correo VARCHAR(255),
    NomU VARCHAR(255),
    Nom VARCHAR(255)
);

CREATE TABLE CURSO (
    Nom VARCHAR(255),
    Ch INTEGER
);

CREATE TABLE INSC (
    Correo VARCHAR(255),
    Nom VARCHAR(255),
    Correod VARCHAR(255),
    Nota INTEGER
);

CREATE TABLE DICTA (
    Correo VARCHAR(255),
    Nom VARCHAR(255)
);

CREATE TABLE TEMAS (
    Nom VARCHAR(255),
    Tema VARCHAR(255)
);
-- Insertar datos en la tabla PERS
INSERT INTO PERS (Correo, NomU, Nom)
VALUES
    ('anagarcia32@gmail.com','AnaGarcia131','Ana Garcia'),
    ('pablogomes45@gmail.com','Pablito45','Pablo Gomes'),
    ('rubengonzales104@gmail.com','RubenG10','Ruben Gonzales'),
    ('estefaniaperalta@gmail.com','Estefania22','Estefania Peralta'),
    ('gonzaloramos1978@yahoo.com.ar','GonzaloR78','Gonzalo Ramos');

-- Insertar datos en la tabla CURSO
INSERT INTO CURSO (Nom, Ch)
VALUES
    ('Javascript I', 50),
    ('Javascript II', 38),
    ('SQL', 25);

-- Insertar datos en la tabla INSC
INSERT INTO INSC (Correo, Nom, Correod, Nota)
VALUES
    ('anagarcia56@gmail.com', 'Javascript I', 'pablogomes45@gmail.com', 7),
    ('gisellevasquez201@yahoo.com.ar', 'Javascript I', 'pablogomes45@gmail.com', 8),
    ('gisellevasquez201@yahoo.com.ar', 'Javascript II', 'pablogomes45@gmail.com', 7),
    ('giselleV146@gmail.com', 'Javascript II', 'pablogomes45@gmail.com', 7);

-- Insertar datos en la tabla DICTA
INSERT INTO DICTA (Correo, Nom)
VALUES
    ('pedroibañez@yahoo.com.ar', 'Kotlin I'),
    ('gonzaloramos1978@yahoo.com.ar', 'Python I'),
    ('gonzaloramos1978@yahoo.com.ar', 'SQL'),
    ('pablogomes45@gmail.com', 'Javascript I'),
    ('pablogomes45@gmail.com', 'Javascript II');

-- Insertar datos en la tabla TEMAS
INSERT INTO TEMAS (Nom, Tema)
VALUES
    ('Python I', 'Estructuras de datos'),
    ('Python I', 'Caracteristicas'),
    ('Python II', 'Aplicacion'),
    ('Python II', 'Caracteristicas'),
    ('Javascript I', 'Estructuras de datos'),
    ('Javascript I', 'Estructuras de control'),
    ('Javascript I', 'Aplicacion'),
    ('Javascript I', 'Caracteristicas'),
    ('Javascript II', 'Estructuras de datos'),
    ('Javascript II', 'Estructuras de control'),
    ('Javascript II', 'Aplicacion'),
    ('Javascript II', 'Caracteristicas'),
    ('Kotlin I', 'Estructuras de control'),
    ('Kotlin I', 'Caracteristicas'),
    ('Kotlin II', 'Estructuras de datos'),
    ('Kotlin II', 'Estructuras de control'),
    ('Kotlin II', 'Aplicacion'),
    ('Kotlin II', 'Caracteristicas');

-- eje1
INSERT INTO PERS (Correo,NomU,Nom) VALUES ('anagarcia56@gmail.com', 'AnaG56','AnaG56'),
('franciscopeña52@yahoo.com.ar','FranPeña865','Gonzalo Ramos'),
('pedroibañez@yahoo.com.ar','PedroIbañez223','Pedro Ibañez'),
('gisellevasquez201@yahoo.com.ar','Giselle201','Giselle Vasquez'),
('giselleV146@gmail.com','GVasquez24','Giselle Vasquez');

-- eje2
INSERT INTO curso (Nom,Ch) VALUES ('Python I', 29),
('Python II', 28),
('Kotlin I',45),
('Kotlin II',42);
('Ruby',42);


-- eje3
INSERT INTO temas (Nom,Tema) VALUES 
('Python I', 'Estructuras de control'),
('Python I', 'Aplicacion'),
('Python II', 'Estructuras de datos'),
('Python II', 'Estructuras de control'),
('Kotlin I','Estructuras de datos'),
('Kotlin I', 'Aplicacion');

-- eje4
INSERT INTO DICTA (Correo, Nom)
VALUES ('estefaniaperalta@gmail.com', 'Python I'),
('estefaniaperalta@gmail.com', 'Python II'),
('gonzaloramos1978@yahoo.com.ar', 'Kotlin I'),
('gonzaloramos1978@yahoo.com.ar',' Kotlin II');



INSERT INTO INSC (Correo, Nom, Correod, Nota)
VALUES ('anagarcia32@gmail.com', 'Python I', 'estefaniaperalta@gmail.com', 7),
('franciscopeña52@yahoo.com.ar', 'Python I', 'estefaniaperalta@gmail.com', 9),
('anagarcia32@gmail.com', 'Python II', 'pedroibañez@yahoo.com.ar', 8),
('anagarcia56@gmail.com', 'Python II', 'estefaniaperalta@gmail.com', 6),
('pedroibañez@yahoo.com.ar', 'Python I', 'estefaniaperalta@gmail.com', 9),
('rubengonzales104@gmail.com', 'Kotlin I', 'gonzaloramos1978@yahoo.com.ar', 8),
('rubengonzales104@gmail.com', 'Kotlin II', 'gonzaloramos1978@yahoo.com.ar', 6);

-- 7. Actualice la carga horaria del curso Ruby por 60.
UPDATE curso SET Ch = 60 WHERE Nom = 'Ruby';

--8. Elimine el curso Ruby I
DELETE FROM curso WHERE Nom = 'Ruby';

--9. Correo y nombre de todas las personas.
SELECT Correo,Nom FROM pers;

--10. Cantidad de cursos.
SELECT count(*) FROM curso

--11. Cantidad de docentes.
SELECT count(*) FROM dicta;
-- *12. Nota máxima obtenida en el curso ‘’Python I‘’.
SELECT MAx(Nota) from insc where Nom='Python I';
--13. Nombre de los cursos ordenados por nombre.
SELECT Nom from curso ORDER BY Nom ASC;

--14. Nombre del curso que tiene una carga horaria superior a la de todos los cursos que dicta “pedroibañez@yahoo.com.ar”.
SELECT Nom FROM curso WHERE Ch > (SELECT MAX(Ch) FROM curso WHERE Nom IN (SELECT Nom FROM dicta WHERE Correo = 'pedroibañez@yahoo.com.ar'));
15. Personas, docentes o alumnos(todos sus datos) que se llama Rosa
SELECT * FROM dicta;
16. Cursos que tienen una carga horaria superior a la del curso “Kotlin I”, ordenados descendentemente por cantidad de
horas.
17. Cursos (todos los datos) cuya carga horaria sea superior a las 40 horas reloj.
18. Cursos (todos los datos) cuya carga horaria se encuentre entre 40 y 45 horas reloj.
19. Docentes (correo y nombre) que dictan cursos.
20. Listado de los cursos (nombre) junto a los datos del docente que los dicta.
21. Obtenga el curso (todos los datos) junto a los datos de los alumnos inscriptos. Se deben incluir todos los cursos
registrados más allá que no tengan alumnos inscriptos.. (Usar OUTER JOIN)
22. Docentes (todos los datos) que dictan los cursos “Python I”.
23. Docentes (todos los datos) que dictan los cursos “Python II”.
24. Listado de docentes (correo) que dictan el curso “Python I” y/o “Python II”.
25. Docentes (correo) que dictan los cursos “Python I” y “Python II”.
26. Docentes (todos los datos) que cursaron algún curso de verano.
27. Alumnos (todos los datos) que se inscribieron en el curso “Kotlin I”.
28. Alumnos (todos los datos) que se inscribieron en el curso “Kotlin II”.
29. Listado de alumnos (correo) que se inscribieron tanto en el curso “Kotlin I” como “Kotlin II”.
30. Alumnos (todos los datos) que aprobaron el curso “Python I” y “Python II”.
31. Alumnos (Correo) que se inscribieron en más de un curso de verano.
32. Docentes (correo) que dictan más de un curso.
33. Docentes (todos los datos) que dictan más de un curso cuya carga horaria sea inferior a 30 horas reloj.
34. Alumnos (correo) que cursaron los mismos cursos.
35. Pares de Alumnos (todos los datos) que cursaron los mismos cursos.
36. Pares de Alumnos que cursaron los mismos cursos con distinto profesor.
37. Alumnos (todos los datos) que se inscribieron en todos los cursos de verano.
38. Alumnos (todos los datos) que se inscribieron en todos los cursos que dicta el profesor con correo
“pedroibañez@yahoo.com.ar”
39. Nombre/s de los cursos que tienen la mayor carga horaria.
40. Especifique la Vista “Cursoscortos” que tenga los siguientes atributos nombre, carga horaria. Los cursos cortos son
aquellos cuya carga horaria es inferior a las 40 horas.
41. Muestre los datos contenidos en la vista, ordenados según el nombre.
42. Especifique la Vista (Alumnos_python1) que contenga los alumnos que se inscribieron en el curso “PYTHON I”
correo, nombre de usuario y nombre).
43. Muestre los datos contenidos en la vista creada en el punto anterior, cuyo correo sea una cuenta de Gmail