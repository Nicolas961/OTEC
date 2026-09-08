# OTEC Panel — servidor (API + base de datos)

API en Node.js + Express + Prisma, conectada a PostgreSQL. Gestiona alumnos,
instructores, cursos e inscripciones.

## 1. Instalar PostgreSQL en Windows

1. Descarga el instalador oficial desde https://www.postgresql.org/download/windows/
2. Ejecútalo y durante la instalación:
   - Anota la contraseña que le pongas al usuario `postgres` (la vas a necesitar).
   - Deja el puerto por defecto: `5432`.
   - Al final puedes destildar "Stack Builder", no es necesario.
3. Verifica que quedó instalado abriendo **pgAdmin 4** (se instala junto con PostgreSQL) o,
   desde la terminal:
   ```powershell
   psql -U postgres
   ```
   Te pedirá la contraseña que definiste.

## 2. Crear la base de datos

Con `psql` abierto (o desde pgAdmin), ejecuta:

```sql
CREATE DATABASE otec_panel;
```

## 3. Configurar la conexión

Copia `.env.example` a `.env` y reemplaza `TU_PASSWORD` por la contraseña que
pusiste al instalar PostgreSQL:

```powershell
copy .env.example .env
```

```
DATABASE_URL="postgresql://postgres:TU_PASSWORD@localhost:5432/otec_panel"
PORT=3001
```

## 4. Instalar dependencias y crear las tablas

```powershell
npm install
npx prisma migrate dev --name init
```

Esto crea las tablas `Alumno`, `Instructor`, `Curso` e `Inscripcion` a partir
de `prisma/schema.prisma`.

## 5. Levantar el servidor

```powershell
npm run dev
```

Verifica que responde:

```powershell
curl http://localhost:3001/api/health
```

## Explorar los datos visualmente

Prisma trae una interfaz web para ver y editar las tablas sin escribir SQL:

```powershell
npx prisma studio
```

## Endpoints disponibles

| Método | Ruta              | Descripción              |
| ------ | ----------------- | ------------------------ |
| GET    | `/api/health`     | Estado del servidor      |
| GET    | `/api/alumnos`    | Lista todos los alumnos  |
| POST   | `/api/alumnos`    | Crea un alumno           |
| GET    | `/api/cursos`     | Lista todos los cursos   |
| POST   | `/api/cursos`     | Crea un curso            |

## Modelo de datos

- **Alumno**: rut, nombre, apellido, email, teléfono.
- **Instructor**: rut, nombre, apellido, especialidad.
- **Curso**: nombre, código SENCE, horas, fechas, instructor asociado.
- **Inscripcion**: relaciona un alumno con un curso, guarda estado
  (`INSCRITO`, `EN_CURSO`, `APROBADO`, `REPROBADO`, `RETIRADO`) y porcentaje
  de asistencia.

Este esquema es un punto de partida — agrega o ajusta campos en
`prisma/schema.prisma` y vuelve a correr `npx prisma migrate dev` cuando lo
necesites.
