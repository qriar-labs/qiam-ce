import express from 'express'
import { Vonage } from '@vonage/server-sdk'
import {} from 'dotenv/config'


const app = express();
app.use(express.json());

const vonageServer = new Vonage({
    apiKey: process.env.VONAGE_API_KEY,
    apiSecret: process.env.VONAGE_API_SECRET
});

app.post('/send-sms', async (req, res) => {
    const { from, to, text } = req.body;


    const { messages } = await vonageServer.sms.send({
        to,
        from,
        text,
    });

    if (messages) {
        console.log('Message sent successfully');
        console.log({ message: 'SMS sent successfully' });
        res.json({ response: messages });
    } else {
        res.status(500).json({ error: 'Failed to send SMS' });
    }

});

const port = 3924;

app.listen(port, () => {
    console.log(`SMS Server running on port ${port}`);
});