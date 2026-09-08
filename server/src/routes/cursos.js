import { Router } from 'express'
import { prisma } from '../prisma.js'

const router = Router()

router.get('/', async (_req, res) => {
  const cursos = await prisma.curso.findMany({
    include: { instructor: true },
    orderBy: { id: 'asc' },
  })
  res.json(cursos)
})

router.post('/', async (req, res) => {
  const { nombre, codigoSence, horas, fechaInicio, fechaFin, instructorId } = req.body
  const curso = await prisma.curso.create({
    data: {
      nombre,
      codigoSence,
      horas,
      fechaInicio: new Date(fechaInicio),
      fechaFin: new Date(fechaFin),
      instructorId,
    },
  })
  res.status(201).json(curso)
})

export default router
