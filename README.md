# Home power monitoring

[Image]
Image: https://blog.hypriot.com/downloads/
The default credentials for the image are user pirate with password hypriot.

[USB]
add USB: LABEL=DATA, fstype: ntfs

[slack]
https://api.slack.com/apps
To set up alerting in your Slack workspace, you’re going to need a Slack API URL. Go to Slack -> Administration -> Manage apps.
put the key in: /home/pi/slack.webhook

[openweathermap]
Request API key https://openweathermap.org/api 
put the key in /home/pi/openweathermap.apikey

[install/run] 1
wget https://raw.githubusercontent.com/Revenberg/powercontainers/master/p1meter.sh && chmod +x p1meter.sh ;./p1meter.sh << password>>

[install/run] 2
wget https://raw.githubusercontent.com/Revenberg/powercontainers/master/zigbee2mqtt.sh && chmod +x zigbee2mqtt.sh ;./zigbee2mqtt.sh << password>>

[prometheus]
wget https://raw.githubusercontent.com/Revenberg/powercontainers/master/prometheus.sh && chmod +x prometheus.sh ;./prometheus.sh << password>>
