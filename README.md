# 💀 Base de Datos Avanzadas (PostgreSQL/Docker Compose)

Este repositorio contiene las actividades prácticas de la materia de BDD Avanzadas. Todos los entornos de desarrollo están virtualizados usando **Docker Compose** con **PostgreSQL 17**.

## Dependencias y Preparación

Necesitas tener **Docker** y **Docker Compose** instalados en tu sistema.

- [Docker (Instalación)](https://www.docker.com/get-started/)

## Ejecución del Entorno

Sigue estos pasos para levantar la base de datos de la universidad:

1.  **Clona** el repositorio.
2.  Asegúrate de tener un archivo `.gitignore` que excluya la carpeta de datos (`postgres-universidad/`).
3.  Desde la raíz del proyecto, ejecuta el comando para levantar el contenedor:

```bash
docker compose up -d
```

## Configuraciones de coneccion

En el [docker-compose](PostgreSQL/docker-compose.yml) se define los siguientes valores iniciales de configuracion:

- **nombre del contenedor**: db-universidad
- **puerto:** 5435 
- **base de datos:** universidad
- **usuario:** postgres
- **contraseña:** 123456

Para conectarse a la base de datos desde `psql` se tienen dos formas, dependiendo de si se tiene instalado `psql` en local o no. 

**Opción A:** Conectarse al servidor Postgres **desde dentro** del contenedor. Entra al contenedor y luego inicia el cliente psql. 

```bash
docker exec -it db-universidad psql -U postgres -d universidad
```

**Opción B:** Conectarse al servidor Postgres desde tu PC usando el mapeo de puertos (5435). Esto funciona SOLO si tienes el cliente 'psql' instalado en tu máquina.

```bash
psql -h localhost -p 5435 -U postgres -d universidad -W
```

---