MailHog Demo
============

This is a really basic codebase to demonstrate how [Mailhog](https://github.com/mailhog/MailHog)
can be used in development to capture your emails and view them. No need to actually hook up a real 
SMTP provider.

## Usage
Build the emailer Docker image with:

```bash
docker-compose build
```

Once that has been built, run with:

```
docker-compose up
```

Once the container have been deployed mailhog will be available to view in your browser at 
[http://localhost:8025/](http://localhost:8025/#), and a test email will be sent to it every 3
seconds by the emailer container that you built.