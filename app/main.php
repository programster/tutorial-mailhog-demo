<?php

use Programster\Emailers\SecurityProtocol;

require_once(__DIR__ . '/vendor/autoload.php');

$emailer = new Programster\Emailers\PhpMailerEmailer(
    getenv('SMTP_HOST'),
    getenv('SMTP_USER'),
    getenv('SMTP_PASSWORD'),
    SecurityProtocol::tryFrom(getenv('SMTP_PROTOCOL')),
    getenv('SMTP_FROM_EMAIL'),
    getenv('SMTP_FROM_NAME'),
    getenv('SMTP_PORT'),
);

while (true)
{
    sleep(3);
    print "Sending email..." . PHP_EOL;
    $email = getenv('MAIL_TO_EMAIL');
    $name = getenv('MAIL_TO_NAME');
    print $email . PHP_EOL;

    $emailer->send(
        $name,
        $email,
        "Test email",
        "<p>This is a test email.</p>",
        true
    );
}
