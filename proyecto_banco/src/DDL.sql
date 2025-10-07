
-- Elaborar script DDL para la BD, teniendo en cuenta que las restricciones de
-- integridad de PK y NOT NULL se incluyan en la creación de las tablas y las 
-- restricciones de integridad de FK no se realizan en la creación de las tablas.

-- Incluir la restricción de integridad que permita establecer plazo máximo 
-- de 60 meses para los préstamos. No olvidar incluir las sentencias de verificación 
-- de funcionamiento.

-- Creacion de la base de datos.
CREATE DATABASE banco;


DROP TABLE IF EXISTS ciudad;

CREATE TABLE ciudad(
    codigo_ciudad INT,
    nombre VARCHAR(50),
    PRIMARY KEY(codigo_ciudad)
);


DROP TABLE IF EXISTS cliente;

DROP TABLE IF EXISTS telefonos;

DROP TABLE IF EXISTS sucursal;

DROP TABLE IF EXISTS prestamo;

DROP TABLE IF EXISTS pago;

DROP TABLE IF EXISTS solicitar;

DROP TABLE IF EXISTS tener;

DROP TABLE IF EXISTS pago;

