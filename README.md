# OTEC Panel Web

Panel web para OTEC, construido con [Vite](https://vitejs.dev/).

El proyecto tiene dos partes:

- **Este directorio** (`/`): frontend con Vite.
- **`server/`**: API en Node.js + Express + Prisma, conectada a una base de
  datos PostgreSQL. Ver [`server/README.md`](./server/README.md) para
  instalar PostgreSQL y levantar la API.

## Requisitos

- Node.js 18+
- npm

## Instalación

```bash
npm install
```

## Desarrollo

```bash
npm run dev
```

Esto levanta un servidor local con recarga en caliente.

## Build de producción

```bash
npm run build
```

Los archivos generados quedan en `dist/`.

## Vista previa del build

```bash
npm run preview
```
