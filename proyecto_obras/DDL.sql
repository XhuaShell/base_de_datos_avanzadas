--DDL
CREATE DATABASE cine ;

DROP TABLE IF EXISTS cine.actor; 

CREATE TABLE actor (
    id_actor INT NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    telefono BIGINT NOT NULL,
    dia_nac INT NOT NULL,
    mes_nac INT NOT NULL,
    anio_nac INT NOT NULL,
    PRIMARY KEY(id_actor)
);


DROP TABLE IF EXISTS cine.obra;

CREATE TABLE obra (
    codigo_obra INT NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    PRIMARY KEY(codigo_obra)
);


DROP TABLE IF EXISTS cine.director;

CREATE TABLE director (
    id_director INT NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    PRIMARY KEY(id_director)
);


DROP TABLE IF EXISTS cine.preparar;

CREATE TABLE preparar (
    id_dir INT NOT NULL,
    id_prep INT NOT NULL,
    PRIMARY KEY(id_dir,id_prep),
        FOREIGN KEY(id_dir) REFERENCES director(id_director),
        FOREIGN KEY(id_prep) REFERENCES director(id_director)
);


DROP TABLE IF EXISTS cine.telefonos;

CREATE TABLE telefonos (
    telefono VARCHAR(40) NOT NULL,
    id_director INT NOT NULL,
    PRIMARY KEY(telefono,id_director),
        FOREIGN KEY(id_director) REFERENCES director(id_director)
);


DROP TABLE IF EXISTS cine.dirigir;

CREATE TABLE dirigir (
    codigo_obra INT NOT NULL,
    id_director INT NOT NULL,
    PRIMARY KEY(codigo_obra,id_director),
        FOREIGN KEY(codigo_obra) REFERENCES obra(codigo_obra),
        FOREIGN KEY(id_director) REFERENCES director(id_director)
);


DROP TABLE IF EXISTS cine.papel;

CREATE TABLE papel (
    id_papel INT NOT NULL,
    nombre VARCHAR(40)NOT NULL,
    PRIMARY KEY(id_papel)
);


DROP TABLE IF EXISTS cine.actuar;

CREATE TABLE actuar (
    codigo_obra INT NOT NULL,
    id_actor INT NOT NULL,
    fecha_retiro date NOT NULL,
    fecha_ingreso date NOT NULL,
    id_papel INT NOT NULL,
    PRIMARY KEY(codigo_obra,id_actor),
    FOREIGN KEY(id_papel) REFERENCES papel(id_papel),
    FOREIGN KEY(id_actor) REFERENCES actor(id_actor),
    FOREIGN KEY(codigo_obra) REFERENCES obra(codigo_obra)
); -- Modifiqué cod_papel por id_papel para mantener la continuidad de los nombres. 

DROP TABLE IF EXISTS cine.idiomas;
CREATE TABLE idiomas (
    idioma VARCHAR(40) NOT NULL,
    id_actor INT NOT NULL,
    PRIMARY KEY(idioma,id_actor),
    FOREIGN KEY(id_actor) REFERENCES actor(id_actor)
);
