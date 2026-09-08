import 'dotenv/config'
import express from 'express'
import cors from 'cors'
import alumnosRouter from './routes/alumnos.js'
import cursosRouter from './routes/cursos.js'

const app = express()
const port = process.env.PORT || 3001

app.use(cors())
app.use(express.json())

app.get('/api/health', (_req, res) => {
  res.json({ status: 'ok' })
})

app.use('/api/alumnos', alumnosRouter)
app.use('/api/cursos', cursosRouter)

app.listen(port, () => {
  console.log(`OTEC panel API escuchando en http://localhost:${port}`)
})
