import express from 'express'
import * as dotenv from 'dotenv';
import { prisma } from './db/prisma'

dotenv.config()

const app = express()
app.use(express.json())
app.use(express.urlencoded({extended: true}))

app.get('/', async (req, res) => {
    const task = await prisma.task.findMany()
    return res.json({ task })
})

app.post('/', async (req, res) => {
    type NameBody = {
        name: string
    }
    const { name }: NameBody = req.body
    const task = await prisma.task.create({
        data: {
            name,
        }
    })
    return res.json({ task })
})

app.listen(3333, () => {
    console.log(`running on 3333`);
});