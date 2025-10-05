    --DDL

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



    -- DML

    -- DIRECTOR
    INSERT INTO director 
        (id_director, nombre)  
    VALUES 
        (801010, 'Guillermo del Toro'), 
        (801020, 'Steven Spielberg'),
        (801040, 'Tim Burton'),
        (801060, 'Hayao Miyazaki'),
        (801080, 'Zack Snyder'),
        (801090, 'Denis Villeneuve'); 
        
    -- OBRA 
    INSERT INTO obra
        (codigo_obra, nombre) 
    VALUES
        (200101, 'El viaje de Chihiro'),
        (198801, 'Mi vecino Totoro'),
        (202301, 'El niño y la Garza'),
        (199701, 'La Princesa Mononoke'),
        (200801, 'Ponyo en el acantilado'),
        
        (200601, 'El laberinto del Fauno'),
        (201701, 'La forma del agua'),
        (202201, 'Pinocho'),
        (200401, 'Hellboy'),
        
        (201001, 'Alicia en el Pais de las maravillas'),
        (199301, 'El extraño mundo de Jack'),
        (200501, 'El cadáver de la novia'),
        
        (199801, 'Rescatando al Soldado Ryan'),
        (197501, 'Tiburón'),
        (198201, 'E.T., el extraterrestre'),
        
        (200901, 'Coraline y la puerta secreta'),
        (201901, 'Klaus'),
        (202101, 'Arcane: League of Legends'),
        (199501, 'Ghost in the Shell'),
        
        (200902, 'Watchmen'),
        (201301, 'Man of Steel'),
        (201601, 'Batman v Superman'),
        (202102, 'Army of the Dead');
        
    -- DIRIGIR (Relaciona las obras con sus directores)
    INSERT INTO dirigir 
        (codigo_obra, id_director)
    VALUES
        -- Hayao Miyazaki
        (200101, 801060), 
        (198801, 801060), 
        (202301, 801060), 
        (199701, 801060), 
        (200801, 801060),
        
        -- Guillermo del Toro
        (200601, 801010),
        (201701, 801010), 
        (202201, 801010), 
        (200401, 801010),
        
        -- Tim Burton
        (201001, 801040), 
        (199301, 801040), 
        (200501, 801040),
        
        -- Steven Spielberg
        (199801, 801020), 
        (197501, 801020), 
        (198201, 801020),
        
        -- Zack Snyder 
        (200902, 801080), 
        (201301, 801080), 
        (201601, 801080), 
        (202102, 801080); 

    -- TELEFONOS (Corregido a 'telefonos' y con formato colombiano)
    INSERT INTO telefonos 
        (id_director, telefono)
    VALUES 
        (801010, '3043946278'),
        (801020, '3104567890'),
        (801020, '3149876543'),
        (801040, '3152223344'),
        (801060, '3167778899'),
        (801060, '3171234567'),
        (801060, '3189012345'),
        (801080, '3005550011'),
        (801080, '3016660022'),
        (801090, '3054441122'); 

    -- PREPARAR (Director preparado por Preparador)
    INSERT INTO preparar 
        (id_dir, id_prep)
    VALUES
        (801060, 801020),   
        (801010, 801010),  
        (801080, 801040);   

    -- PAPEL
    INSERT INTO papel 
        (id_papel, nombre)
    VALUES 
        (1, 'Protagonista'),
        (2, 'Secundario'),
        (3, 'Antagonista'),
        (4, 'Extra'),
        (5, 'Co-Protagonista'),
        (6, 'Villano'); 

    -- ACTOR (20 actores adicionales para llegar a un mínimo de 30)
    INSERT INTO actor 
        (id_actor, nombre, telefono, dia_nac, mes_nac, anio_nac)
    VALUES 
        (20241001, 'Tilda Swinton', '3201112233', 5, 11, 1960),
        (20241002, 'Christian Bale', '3204445566', 30, 1, 1974),
        (20241003, 'Dakota Fanning', '3207778899', 23, 2, 1994),
        (20241004, 'Tom Hanks', '3200001122', 9, 7, 1956),
        (20241005, 'Elijah Wood', '3203334455', 28, 1, 1981),
        (20241006, 'Danny DeVito', '3206667788', 17, 11, 1944),
        (20241007, 'Emma Watson', '3209990011', 15, 4, 1990),
        (20241008, 'Leonardo DiCaprio', '3202223344', 11, 11, 1974),
        (20241009, 'Marion Cotillard', '3205556677', 30, 9, 1975),
        (20241010, 'Robert Downey Jr.', '3208889900', 4, 4, 1965),
        (20241011, 'Timothée Chalamet', '3211112222', 27, 12, 1995), 
        (20241012, 'Zendaya', '3213334444', 1, 9, 1996),           
        (20241013, 'Keanu Reeves', '3215556666', 2, 9, 1964),         
        (20241014, 'Cate Blanchett', '3217778888', 14, 5, 1969),      
        (20241015, 'Ryan Gosling', '3219990000', 12, 11, 1980),       
        (20241016, 'Margot Robbie', '3001113333', 2, 7, 1990),        
        (20241017, 'Chris Evans', '3004446666', 13, 6, 1981),         
        (20241018, 'Scarlett Johansson', '3007779999', 22, 11, 1984), 
        (20241019, 'Jason Momoa', '3012224455', 1, 8, 1979),          
        (20241020, 'Gal Gadot', '3016668899', 30, 4, 1985),           
        (20241021, 'Henry Cavill', '3021113344', 5, 5, 1983),         
        (20241022, 'Amy Adams', '3025557788', 20, 8, 1974),           
        (20241023, 'Ben Affleck', '3031112233', 15, 8, 1972),         
        (20241024, 'Viola Davis', '3034445566', 11, 8, 1965),         
        (20241025, 'Denzel Washington', '3041112233', 28, 12, 1954),   
        (20241026, 'Nicole Kidman', '3044445566', 20, 6, 1967),        
        (20241027, 'Brad Pitt', '3051112233', 18, 12, 1963),           
        (20241028, 'Angelina Jolie', '3054445566', 4, 6, 1975),        
        (20241029, 'Will Smith', '3061112233', 25, 9, 1968),           
        (20241030, 'Charlize Theron', '3064445566', 7, 8, 1975);        

    -- IDIOMAS (Asumiendo tabla 'actor_idioma') - MÁS IDIOMAS Y REPETICIONES
    INSERT INTO idiomas 
        (idioma, id_actor)
    VALUES 
        ('Inglés', 20241001), 
        ('Alemán', 20241001), 
        ('Inglés', 20241007), 
        ('Español', 20241007), 
        ('Francés', 20241007),
        ('Inglés', 20241010), 
        ('Inglés', 20241009), 
        ('Francés', 20241009), 
        ('Inglés', 20241004), 
        ('Español', 20241002), 
        ('Francés', 20241002),
        ('Chino', 20241003), 
        ('Japonés', 20241004), 
        ('Francés', 20241005), 
        ('Portugués', 20241006),
        ('Castellano', 20241007),
        ('Inglés', 20241011), 
        ('Francés', 20241011), 
        ('Inglés', 20241012), 
        ('Español', 20241012), 
        ('Inglés', 20241013), 
        ('Francés', 20241013), 
        ('Inglés', 20241014), 
        ('Alemán', 20241014), 
        ('Inglés', 20241015), 
        ('Inglés', 20241016), 
        ('Francés', 20241016),
        ('Inglés', 20241017),
        ('Inglés', 20241018),
        ('Inglés', 20241019),
        ('Inglés', 20241020), 
        ('Hebreo', 20241020),
        ('Inglés', 20241021),
        ('Inglés', 20241022),
        ('Inglés', 20241023),
        ('Inglés', 20241024),
        ('Inglés', 20241025),
        ('Inglés', 20241026),
        ('Inglés', 20241027),
        ('Inglés', 20241028), 
        ('Francés', 20241028),
        ('Inglés', 20241029),
        ('Inglés', 20241030), 
        ('Afrikáans', 20241030);

    -- ACTUAR (Cada actor debe estar al menos una vez)
    INSERT INTO actuar
        (codigo_obra, id_actor, fecha_retiro, fecha_ingreso, id_papel)
    VALUES
        (200101, 20241001, '2001-12-31', '2000-01-01', 1),  
        (198801, 20241002, '1988-06-01', '1987-01-01', 2),  
        (200601, 20241003, '2006-07-01', '2005-01-01', 3),  
        (201701, 20241004, '2017-12-01', '2016-01-01', 4),  
        (202201, 20241005, '2022-06-01', '2021-01-01', 5),  
        (200401, 20241006, '2004-12-01', '2003-01-01', 6),  
        (200901, 20241007, '2009-08-01', '2008-01-01', 1),  
        (199301, 20241002, '1993-12-01', '1992-01-01', 2),  
        (200501, 20241003, '2005-12-01', '2004-01-01', 1),  
        (200101, 20241008, '2001-12-31', '2000-01-01', 2),  
        (200101, 20241009, '2001-12-31', '2000-01-01', 3),  
        (200101, 20241010, '2001-12-31', '2000-01-01', 4),  
        (202201, 20241011, '2022-06-01', '2021-01-01', 1),  
        (202201, 20241012, '2022-06-01', '2021-01-01', 2), 
        (199701, 20241013, '1997-12-31', '1996-01-01', 1),
        (199701, 20241014, '1997-12-31', '1996-01-01', 2),
        (200902, 20241015, '2009-08-01', '2008-01-01', 1),  
        (200902, 20241016, '2009-08-01', '2008-01-01', 2),  
        (201301, 20241017, '2013-06-01', '2012-01-01', 1), 
        (201301, 20241018, '2013-06-01', '2012-01-01', 2), 
        (201601, 20241019, '2016-12-01', '2015-01-01', 1), 
        (201601, 20241020, '2016-12-01', '2015-01-01', 2), 
        (201601, 20241021, '2016-12-01', '2015-01-01', 3), 
        (201601, 20241022, '2016-12-01', '2015-01-01', 4), 
        (202102, 20241023, '2021-12-01', '2020-01-01', 1),   
        (202102, 20241024, '2021-12-01', '2020-01-01', 2),   
        (199801, 20241025, '1998-12-01', '1997-01-01', 1),   
        (197501, 20241026, '1975-08-01', '1974-01-01', 1),  
        (198201, 20241027, '1982-12-01', '1981-01-01', 1),
        (201001, 20241028, '2010-12-01', '2009-01-01', 1),  
        (201901, 20241029, '2019-12-01', '2018-01-01', 1),  
        (202101, 20241030, '2021-12-01', '2020-01-01', 1);  
