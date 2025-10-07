CREATE DATABASE banco;


CREATE TABLE ciudad (
    codigo INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY(codigo)
);


CREATE TABLE sucursal (
    nombre VARCHAR(100) NOT NULL,
    activos INT NOT NULL,
    codigo_ciudad INT NOT NULL,
    PRIMARY KEY(nombre)
);


CREATE TABLE prestamo (
    id_prestamo INT NOT NULL,
    valor REAL NOT NULL,
    plazo INT NOT NULL, 
    nombre_sucursal VARCHAR(100),
    PRIMARY KEY(id_prestamo)
);


CREATE TABLE pago (
    numero_pago INT NOT NULL,
    id_prestamo INT NOT NULL,
    valor REAL NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY(numero_pago, id_prestamo)
);


CREATE TABLE cliente (
    id_cliente INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    codigo_ciudad INT NOT NULL,
    PRIMARY KEY(id_cliente)
);


CREATE TABLE cuenta (
    numero_cuenta INT NOT NULL,
    saldo INT,
    fecha_a DATE NOT NULL,
    PRIMARY KEY(numero_cuenta)
);


CREATE TABLE telefonos (
    telefono VARCHAR(15) NOT NULL,
    id_cliente INT NOT NULL,
    PRIMARY KEY(telefono, id_cliente)
);


CREATE TABLE tener (
    id_cliente INT NOT NULL,
    numero_cuenta INT NOT NULL,
    PRIMARY KEY(numero_cuenta, id_cliente)
);


CREATE TABLE solicitar (
    id_cliente INT NOT NULL,
    id_prestamo INT NOT NULL,
    PRIMARY KEY(id_cliente, id_prestamo)
);

-- Llaves foráneas
ALTER TABLE sucursal
    ADD CONSTRAINT sucursal_codigo_ciudad_fk FOREIGN KEY (codigo_ciudad) REFERENCES ciudad (codigo);

ALTER TABLE prestamo
    ADD CONSTRAINT prestamo_nombre_sucursal_fk FOREIGN KEY (nombre_sucursal) REFERENCES sucursal (nombre);

ALTER TABLE pago
    ADD CONSTRAINT pago_id_prestamo_fk FOREIGN KEY (id_prestamo) REFERENCES prestamo (id_prestamo);

ALTER TABLE cliente
    ADD CONSTRAINT cliente_codigo_ciudad_fk FOREIGN KEY (codigo_ciudad) REFERENCES ciudad (codigo);

ALTER TABLE telefonos
    ADD CONSTRAINT telefonos_id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente);

ALTER TABLE tener
    ADD CONSTRAINT tener_id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente);

ALTER TABLE tener
    ADD CONSTRAINT tener_numero_cuenta_fk FOREIGN KEY (numero_cuenta) REFERENCES cuenta (numero_cuenta);

ALTER TABLE solicitar
    ADD CONSTRAINT solicitar_id_cliente_fk FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente);

ALTER TABLE solicitar
    ADD CONSTRAINT solicitar_id_prestamo_fk FOREIGN KEY (id_prestamo) REFERENCES prestamo (id_prestamo);


-- Incluir la restricción de integridad que permita establecer plazo máximo de 60 meses para los préstamos. No olvidar incluir las sentencias de verificación de funcionamiento

ALTER TABLE prestamo
ADD CONSTRAINT chk_plazo_maximo
CHECK (plazo <= 60);
 
-- SELECT * FROM prestamo;
--  
-- -- Verificado No pasa 
-- INSERT INTO prestamo (id_prestamo, valor, plazo, nombre_sucursal)
-- VALUES (1, 101, 61, 'Marco Polo');
-- 
-- -- Verificado Si pasa 
-- INSERT INTO prestamo (id_prestamo, valor, plazo)
-- VALUES (1, 101, 59);
-- 
-- SELECT * FROM prestamo;
 
