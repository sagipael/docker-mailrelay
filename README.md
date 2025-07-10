# Docker Mail relay
Mail Relay server to allow send mails from internal network without authentication. 

Hint: for Gmail as smtp server - [follow the instructions](https://support.google.com/mail/answer/185833?hl=en)
## Parameters

| Parameter | Function |
| :----: | --- |
| `SMTP_SERVER` | SMTP server hostname/IP |
| `SMTP_PORT` | SMTP port |
| `SMTP_TLS` | use TLS, yes/no |
| `SMTP_USER` | SMTP auth username |
| `SMTP_PASSWORD` | SMTP auth password |
| `ALLOWED_NETWORKS` | allowed networks for relay service |


