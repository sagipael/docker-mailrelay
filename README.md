# Docker Mail relay
Mail Relay server to allow send mails from internal network without authentication. 

Hint: for Gmail as smtp server - [follow the instructions](https://support.google.com/mail/answer/185833?hl=en)
## Parameters

| Parameter | Function | Example |
| :----: | --- | --- |
| `SMTP_SERVER` | SMTP server hostname/IP | smtp.gmail.com |
| `SMTP_PORT` | SMTP port | 587 |
| `SMTP_TLS` | use TLS, yes/no | yes |
| `SMTP_USER` | SMTP auth username | user@gmail.com |
| `SMTP_PASSWORD` | SMTP auth password | mypass |
| `ALLOWED_NETWORKS` | allowed networks for relay service | 192.168.0.0/24 |


