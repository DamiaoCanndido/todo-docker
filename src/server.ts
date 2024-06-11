import express from 'express'
import * as dotenv from 'dotenv';
import { prisma } from './db/prisma'

dotenv.config()

const port = process.env.PORT || 10000

const app = express()

app.get('/', async (req, res) => {
    const task = await prisma.task.findMany()
    return res.send({ task })
})

app.post('/', async (req, res) => {
    const { name } = req.body
    const task = await prisma.task.create({
        data: {
            name,
        }
    })
    return res.send({ task })
})

app.listen(port, () => {
    console.log(`running on ${port}`);
});