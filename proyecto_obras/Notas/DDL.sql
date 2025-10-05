CREATE TABLE actor (
    id_actor INT,
    nombre VARCHAR(40),
    telefono BIGINT,
    dia_nac INT,
    mes_nac INT,
    anio_nac INT
);

CREATE TABLE obra (
    codigo_obra INT,
    nombre VARCHAR(40)    
);

CREATE TABLE director (
    id_director INT,
    nombre VARCHAR(40)
);

CREATE TABLE preparar (
    id_dir INT,
    id_prep INT
);



CREATE TABLE telefonos (
    telefono VARCHAR(40),
    id_director INT
);



CREATE TABLE dirigir (
    codigo_obra INT,
    id_director INT
);



CREATE TABLE papel (
    id_papel INT,
    nombre VARCHAR(40)
);



CREATE TABLE actuar (
    codigo_obra INT,
    id_actor INT,
    fecha_retiro date,
    fecha_ingreso date,
    id_papel INT
); -- Modifiqué cod_papel por id_papel para mantener la continuidad de los nombres. 

CREATE TABLE idiomas (
    idioma VARCHAR(40),
    id_actor INT
);

-- CONSTRAINT PK
ALTER TABLE actor 
    ADD CONSTRAINT actor_pk
    PRIMARY KEY (id_actor);

ALTER TABLE obra
    ADD CONSTRAINT obra_pkey
    PRIMARY KEY (codigo_obra); 

ALTER TABLE director
    ADD CONSTRAINT director_pkey
    PRIMARY KEY (id_director);

ALTER TABLE preparar
    ADD CONSTRAINT preparar_pkey
    PRIMARY KEY (id_dir, id_prep);

ALTER TABLE dirigir
    ADD CONSTRAINT dirigir_pkey
    PRIMARY KEY (codigo_obra, id_director);

ALTER TABLE papel
    ADD CONSTRAINT papel_pkey
    PRIMARY KEY (id_papel);

ALTER TABLE actuar
    ADD CONSTRAINT obra_pkey
    PRIMARY KEY (codigo_obra, id_actor);

ALTER TABLE idioamas
    ADD CONSTRAINT idioamas_pkey
    PRIMARY KEY (idioma, id_actor);

ALTER TABLE telefonos
    ADD CONSTRAINT telefonos_pkey
    PRIMARY KEY (telefono, id_director);

-- FK
ALTER TABLE preparar 
    ADD CONSTRAINT preparar_id_dir_director_fk 
    FOREIGN KEY (id_direc_fk) REFERENCES director (id_director);

ALTER TABLE preparar 
    ADD CONSTRAINT preparar_id_prep_director_fk 
    FOREIGN KEY (id_prep_fk) REFERENCES director (id_director);

-- NOT NULL

ALTER TABLE actor
    ALTER COLUMN nombre SET NOT NULL,
    ALTER COLUMN telefono SET NOT NULL,    
    ALTER COLUMN dia_nac SET NOT NULL,
    ALTER COLUMN nombre SET NOT NULL;

ALTER TABLE actor
    ADD CONSTRAINT actor_mes_chk
    CHECK( mes_nac IS NOT NULL );

ALTER TABLE actor
    ADD CONSTRAINT actor_anio_chk
    CHECK( anio_nac IS NOT NULL );

ALTER TABLE actor 
    ADD CONSTRAINT actor_dia_chk
    CHECK( dia_nac > 0 AND dia_nac <= 31 );

ALTER TABLE actor 
    ADD CONSTRAINT actor_mes_chk1
    CHECK( mes_nac > 0 AND mes_nac <= 12 );

-- INSERTs

INSERT INTO actor 
    VALUES (20203010, 'María Ovalle', 302, 20, 09, 2000); 

-- DROP AND ALTER

ALTER TABLE actor 
    DROP 

ALTER TABLE actor
    DROP CONSTRAINT actor_mes_chk;

ALTER TABLE actor
    ALTER COLUMN mes_nac SET NOT NULL;

-- Debe ser posible registrar el género de los actores 
-- de acuerdo con los valores: Femenino, Masculino 
-- y No Binary

-- ADD genero
ALTER TABLE actor
    ADD COLUMN genero VARCHAR(9);

ALTER TABLE actor
    ADD CONSTRAINT actor_genero_chk
    CHECK ( genero = 'Femenino' 
    OR genero = 'Masculino' 
    OR genero = 'No binario') ;

ALTER TABLE actor
    ADD CONSTRAINT actor_genero_chk
    CHECK ( genero IN ('Femenino' , 'Masculino' , 'No binario'));

-- Como hacer dominios para una tabla
-- Restriccion o integridad de dominio

-- Comparacion en 
    -- Restriccion de chequeo
    -- Tipo dato
    -- Dominio
