import { Router } from 'express'
import { prisma } from '../prisma.js'

const router = Router()

router.get('/', async (_req, res) => {
  const alumnos = await prisma.alumno.findMany({ orderBy: { id: 'asc' } })
  res.json(alumnos)
})

router.post('/', async (req, res) => {
  const { rut, nombre, apellido, email, telefono } = req.body
  const alumno = await prisma.alumno.create({
    data: { rut, nombre, apellido, email, telefono },
  })
  res.status(201).json(alumno)
})

export default router
