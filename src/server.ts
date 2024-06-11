import express from 'express'
import * as dotenv from 'dotenv';
const port = process.env.PORT || 10000

dotenv.config()

const app = express()

app.get('/', (req, res) => {
    return res.send({ok: true})
})

app.listen(port, () => {
    console.log(`running on ${port}`);
});