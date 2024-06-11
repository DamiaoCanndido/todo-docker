import express from 'express'
import * as dotenv from 'dotenv';

dotenv.config()

const app = express()

app.get('/', (req, res) => {
    return res.send({ok: true})
})

app.listen(process.env.PORT || 3333, () => {
    console.log('running on 3333');
});