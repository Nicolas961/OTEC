-- CreateEnum
CREATE TYPE "EstadoInscripcion" AS ENUM ('INSCRITO', 'EN_CURSO', 'APROBADO', 'REPROBADO', 'RETIRADO');

-- CreateTable
CREATE TABLE "Alumno" (
    "id" SERIAL NOT NULL,
    "rut" TEXT NOT NULL,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "email" TEXT,
    "telefono" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Alumno_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Instructor" (
    "id" SERIAL NOT NULL,
    "rut" TEXT NOT NULL,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "especialidad" TEXT,
    "email" TEXT,

    CONSTRAINT "Instructor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Curso" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "codigoSence" TEXT,
    "horas" INTEGER NOT NULL,
    "fechaInicio" TIMESTAMP(3) NOT NULL,
    "fechaFin" TIMESTAMP(3) NOT NULL,
    "instructorId" INTEGER,

    CONSTRAINT "Curso_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Inscripcion" (
    "id" SERIAL NOT NULL,
    "alumnoId" INTEGER NOT NULL,
    "cursoId" INTEGER NOT NULL,
    "fechaInscripcion" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "estado" "EstadoInscripcion" NOT NULL DEFAULT 'INSCRITO',
    "asistenciaPorcentaje" INTEGER,

    CONSTRAINT "Inscripcion_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Alumno_rut_key" ON "Alumno"("rut");

-- CreateIndex
CREATE UNIQUE INDEX "Instructor_rut_key" ON "Instructor"("rut");

-- CreateIndex
CREATE UNIQUE INDEX "Curso_codigoSence_key" ON "Curso"("codigoSence");

-- CreateIndex
CREATE UNIQUE INDEX "Inscripcion_alumnoId_cursoId_key" ON "Inscripcion"("alumnoId", "cursoId");

-- AddForeignKey
ALTER TABLE "Curso" ADD CONSTRAINT "Curso_instructorId_fkey" FOREIGN KEY ("instructorId") REFERENCES "Instructor"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inscripcion" ADD CONSTRAINT "Inscripcion_alumnoId_fkey" FOREIGN KEY ("alumnoId") REFERENCES "Alumno"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inscripcion" ADD CONSTRAINT "Inscripcion_cursoId_fkey" FOREIGN KEY ("cursoId") REFERENCES "Curso"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
