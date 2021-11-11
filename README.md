# Home power monitoring

[Image]
Image: https://blog.hypriot.com/downloads/

[USB]
add USB: LABEL=DATA, fstype: ntfs

[slack]
https://api.slack.com/apps
To set up alerting in your Slack workspace, you’re going to need a Slack API URL. Go to Slack -> Administration -> Manage apps.
put the key in: ~/slack.webhook

[openweathermap]
Request API key https://openweathermap.org/api 
put the key in ~/openweathermap.apikey

[install/run] 
wget https://raw.githubusercontent.com/Revenberg/powercontainers/master/p1meter.sh && chmod +x p1meter.sh ;./p1meter.sh

