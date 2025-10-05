-- ( 0 ) => ¿Cuál es el nombre de las obras dirigidas por Guillermo del Toro? 
SELECT obra.nombre 
FROM 
    obra, dirigir, director
WHERE 
    obra.codigo_obra = dirigir.codigo_obra
    AND director.id_director =dirigir.id_director
    AND director.nombre = 'Guillermo del Toro';

--

SELECT obra.nombre
FROM 
    obra JOIN dirigir ON(obra.codigo_obra=dirigir.codigo_obra)
    INNER JOIN director USING (id_director)
WHERE 
    director.nombre = 'Guillermo del Toro';

--

SELECT obra.nombre
FROM 
    obra JOIN dirigir ON(obra.codigo_obra=dirigir.codigo_obra)
    INNER JOIN director ON (dirigir.id_director = director.id_director)
WHERE 
    director.nombre = 'Guillermo del Toro';

--

SELECT O.nombre as nombre_obra
FROM 
    obra as O NATURAL JOIN dirigir as D
    JOIN director as DR ON (D.id_director = DR.id_director);
WHERE 
    DR.nombre = 'Guillermo del Toro';


-- ( 1 ) => ¿Cuál es el nombre de cada actor y el título de la obra en la que actuó?
SELECT actor.nombre, obra.nombre
FROM
    obra NATURAL JOIN actuar
    INNER JOIN actor USING (id_actor);

-- ( 2 ) => ¿Cuáles son los nombres de los directores que tienen teléfonos registrados?
SELECT director.nombre
FROM
    director NATURAL JOIN telefonos
WHERE
    telefonos.telefono IS NOT NULL
UNION
SELECT director.nombre
FROM
    director NATURAL JOIN telefonos
WHERE
    telefonos.telefono IS NOT NULL; 

--

SELECT DISTINCT director.nombre
FROM
    director INNER JOIN telefonos ON director.id_director = telefonos.id_director; 

-- ( 3 ) => Para cada actor, ¿qué idiomas habla? (Muestra el nombre del actor y el idioma).
SELECT nombre, idioma
FROM
    actor NATURAL JOIN idiomas; 

-- ( 4 ) => ¿Cuál es el título de la obra y el nombre del director que la dirigió?
SELECT obra.nombre, director.nombre 
FROM 
    obra INNER JOIN dirigir ON (obra.codigo_obra = dirigir.codigo_obra) 
    INNER JOIN director USING (id_director);

-- ( 5 ) => ¿Qué nombre de papel interpretó cada actor? (Muestra el nombre del actor y el nombre del papel).
SELECT obra.nombre, director.nombre 
FROM 
    obra INNER JOIN dirigir ON (obra.codigo_obra = dirigir.codigo_obra) 
    INNER JOIN director USING (id_director);

-- ( 6 ) => ¿Cuál es el nombre de los directores que NO tienen obras registradas en la tabla DIRIGIR?.


-- ( 7 ) => ¿Cuál es el título de la obra, el nombre del actor y el nombre del papel que desempeñó 
-- en esa obra?.

-- ( 8 ) => ¿Qué directores fueron preparados por el director 'Guillermo del Toro'? 

-- ( 9 ) => ¿Cuáles son los títulos de las obras que NO tienen ningún actor registrado en la tabla ACTUAR?

-- ( 10 ) => ¿Cuál es el nombre de todos los actores que han trabajado en alguna obra dirigida por 
-- 'Hayao Miyazaki'?

-- ( 11 ) => Muestra el nombre del director y el número total de teléfonos que tiene registrados.

-- ( 12 ) => ¿Cuál es el nombre del actor que habla la mayor cantidad de idiomas?.

-- ( 13 ) => Muestra el título de las obras que tienen más de 5 actores registrados en la tabla ACTUAR.

-- ( 14 ) => ¿Cuál es el nombre del director, el nombre de su preparador, y el título de TODAS 
-- las obras que dirigió?.

-- ( 15 ) => Muestra el nombre del actor, el idioma que habla, el título de la obra, y el nombre del director 
-- de esa obra, solo si el papel del actor fue de 'Protagonista' o 'Villano'.


