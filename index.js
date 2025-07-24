import express from 'express'
import funcionarioRoutes from './routes/funcionario.js'

const app = express()
app.use(express.json())

app.use('/api/funcionario', funcionarioRoutes)

app.listen(3000, () => {
  console.log('Servidor rodando em http://localhost:3000')
})