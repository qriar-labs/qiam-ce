---
sidebar_position: 1
---

# API Sms MFA

This extension, created by QriarLabs, invokes third party APIs to allow users to choose different messaging solutions for MFA. The goal is to allow you to choose from several SMS, WhatsApp, or Telegram APIs, including: 
* Twilio
* Vonage
* Sendpulse 
* Telegram


## How It Works

You must provide a reference API that will be a common abstraction for messaging (SMS/WhatsApp). The common payload to send to this API is simple: 

```js title="json.payload"
{
  "mobile": "+5511966191717",
  "totp": "32232"
}
```

* mobile: The user's phone number
* totp: The message that will be sent 

Here a diagram to explain this flow: 

```mermaid
sequenceDiagram
    QIAM/KC->>+API: Send the Payload to Ref API
    API-->>-Message API: API abstracts Msg APIs
    Message API-->>API: Respond with status
```

For our reference implementation, we are using our own integration platform (QIP) in order to create an abstaction on top of the messaging provider: 

![qip](./img/qip_flows.jpg)

## Adding Mobile Attribute for User

We are using a default attribute (`mobile_number`) to store and manage the QIAM user. The user phone number should use the standard: `+countrycode+phone`. For example: a number from Brazil should be formatted as +551155555555.

![Mobile Number](./img/user_phone_attribute.jpg)

## Configuring the Browser Authentication Flow

This is the configuration for Browser Flow using the API Sms MFA:

![Configuration Browser Flow](./img/sms_browser_flow.jpg)

1. Authentications Flow

2. Authenticating identity via username or email and password

3. If this authentication works, a SMS Token will be send to the user

## Configuring the API Sms MFA

We have to configure the Messaging API endpoint, as well other things such as number of characters for the token, how long the token will be valid etc:

![SMS Config](./img/sms_config.jpg)

## Testing the API Sms MFA

Follow the extension test bellow: 

[QIAM API Sms MFA](https://app.guidde.com/playbooks/gRiaTVKhR74DyodW5Gbqtt)
===========================================================================

[Click here to watch](https://app.guidde.com/share/playbooks/gRiaTVKhR74DyodW5Gbqtt)

### ![Quick guide](https://static.guidde.com/v0/qg%2FjROEQTCQdjb1TSow8xRZCKdyjlp2%2FgRiaTVKhR74DyodW5Gbqtt%2F7RC6tFE9ozS7syYxJ7gbV3_cover.png?alt=media&token=52bb0f87-afd3-466f-82b5-545d30bfbe40)

This is a demonstration how our QriarLabs Identity Access Manager can use dynamic APIs for sending MFA Tokens

### Go to [localhost:8080](http://localhost:8080)

### 1\. Click "Sign in"

![Click 'Sign in'](https://static.guidde.com/v0/qg%2FjROEQTCQdjb1TSow8xRZCKdyjlp2%2FgRiaTVKhR74DyodW5Gbqtt%2FsFPqgjFuTWQv7WNme75kkm_doc.png?alt=media&token=a92d6b08-c2a8-41d6-8e1b-8eeb02752bd9)

### 2\. Enter the username

![Entering the user name](https://static.guidde.com/v0/qg%2FjROEQTCQdjb1TSow8xRZCKdyjlp2%2FgRiaTVKhR74DyodW5Gbqtt%2FrizfdjWpy4vU1Frga8Cmyz_doc.png?alt=media&token=4cbc5140-ea55-4ddc-ad20-547f6ca6956b)

### 3\. Enter the password

![Fill '[password]'](https://static.guidde.com/v0/qg%2FjROEQTCQdjb1TSow8xRZCKdyjlp2%2FgRiaTVKhR74DyodW5Gbqtt%2FwocoKdETECDpcSwHTSctTW_doc.png?alt=media&token=4a33d5ac-d8a4-46ca-9055-f70c78cdae8b)

### 4\. Click "Sign In"

![Click 'Sign In'](https://static.guidde.com/v0/qg%2FjROEQTCQdjb1TSow8xRZCKdyjlp2%2FgRiaTVKhR74DyodW5Gbqtt%2FsJ2vqw3M72wde4eNkeaqxB_doc.png?alt=media&token=6677bd44-36df-456c-92db-ba7e5a7a7fd8)

### 5\. Enter the received token

Fill in the text box with the token you recieved in your SMS

![Enter with received token](https://static.guidde.com/v0/qg%2FjROEQTCQdjb1TSow8xRZCKdyjlp2%2FgRiaTVKhR74DyodW5Gbqtt%2FxbM7Yaa1hoStoC39skRFHs_doc.png?alt=media&token=0c32f67b-af8b-481e-b06a-eb715b093cb0)

### 6\. Click "Submit"

![Click 'Submit'](https://static.guidde.com/v0/qg%2FjROEQTCQdjb1TSow8xRZCKdyjlp2%2FgRiaTVKhR74DyodW5Gbqtt%2F5vHFdvekyFG3XFoo4aqaTe_doc.png?alt=media&token=d1f115e6-fbd4-4c84-9f52-95e35d07196d)

### 7\. Click "Personal info"

As you can see, after the token is accepted by QIAM, you will be able to access the app. You can check your user information by clicking "Personal info".

![Click 'Personal info'](https://static.guidde.com/v0/qg%2FjROEQTCQdjb1TSow8xRZCKdyjlp2%2FgRiaTVKhR74DyodW5Gbqtt%2F1AgLJjBpRpCt1TwjuzHmfz_doc.png?alt=media&token=054a7988-775a-4c1b-8a8a-93ebea826641)







