# QIAM MagicLink Authenticator

Demo authenticator which sends a magic link to the user with which the user can authenticate without needing to provide a password.


```
openjdk version "17.0.10" 2024-01-16 LTS
OpenJDK Runtime Environment Corretto-17.0.10.7.1 (build 17.0.10+7-LTS)
```

This moves the security from the users knowledge to its mailbox!

    notice: This passwordless approach uses the configured e-mail 
    services configured into you keycloak realm


To provide a bit more security than _just sending a link via e-mail_, the authentication has to be finished where it was started.
So this has to happen in the same browser.
It's not possible to start the authentication on your phone and click the link in the mail on your desktop (or vice versa), this won't work.
(Or, if you want this get to work, you will have to implement another way, more complex!)

### Bulding the Source

    mvn clean

Building the source:

    mvn clean install

Or: 

    mvn clean package
