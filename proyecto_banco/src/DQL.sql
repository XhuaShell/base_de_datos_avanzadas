-- El nombre de todos los clientes de Bogotá que han solicitado préstamos.

SELECT cliente.nombre
FROM cliente
JOIN ciudad ON cliente.codigo_ciudad = ciudad.codigo
JOIN solicitar ON cliente.id_cliente = solicitar.id_cliente
WHERE ciudad.nombre = 'Bogotá';

-- El identificador y nombre de los clientes que han accedido por última vez a sus
-- cuentas en el mes de agosto de 2025.  Incluir en la consulta el número de cuenta 
-- y la fecha completa de acceso.
SELECT 
    cliente.id_cliente, 
    cliente.nombre, 
    cuenta.numero_cuenta, 
    cuenta.fecha_a
FROM 
    cliente
JOIN tener ON cliente.id_cliente = tener.id_cliente
JOIN cuenta ON tener.numero_cuenta = cuenta.numero_cuenta
WHERE 
    cuenta.fecha_a >= '2025-08-01' AND cuenta.fecha_a < '2025-09-01'
ORDER BY 
    cuenta.fecha_a DESC;
