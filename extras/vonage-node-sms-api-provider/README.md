## QIAM - SMS Additional Extension

  

This is an extesion which uses the SMS Service provided by Vonage: https://www.vonage.com/ :


![Vonange](https://yt3.googleusercontent.com/4qxxLUY99wNCYsiyftjsLTmUU5GJr0HZv47WW5OQalJJFkoCMbW4AKr-7e9jveGpxj0r2hNalwc=s176-c-k-c0x00ffffff-no-rj)

  
The first step is to execute the following comand in this folder: 

    npm install

Configure the `.env` file with providing your keys that can be obtained in Vonage portal (*They offer a Trial and a 2 Euros for testing your SMS apps*).

  

    VONAGE_API_KEY=<< YOUR KEY >>
    
    VONAGE_API_SECRET=<< YOUR SECRET >>

  

To execute the API/App execute the following command:

  

    npm start

  

The result will be:

  

    > sms-sender@1.0.0 start
    
    > node index.js

    SMS Server running on port 3924
    
  

  

For execute the API, use the following curl command:

    curl --location --request POST 'http://localhost:3924/send-sms' \
    
    --header 'Content-Type: application/json' \
    
    --data-raw '{
    
    "to": "5511966191717",
    
    "from": "QIAM",
    
    "text": "Here is a SMS Sample using Vonage API"
    
    }


