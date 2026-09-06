---
title: "Ubuntu Server Setup Tool"
date: 2020-11-07T10:36:16
draft: true
---

![Ubuntu Server Setup Tool install demo](/images/install.gif)

### Faster Server setup

No need to google for install instructions for software like webmin, nginx with an SSL certificate from Letsencrypt or docker. Just select and let the tool install it for you.

### Add Docker Containers

Automatically install certain Docker containers like Portainer, Nextcloud, Watchtower and more.

### Add Reverse Proxy

Want to get to your portainer instance via docker.domain.com? No problem! Just let the tool do it!

The Ubuntu Server Setup Tool (USST) is a Bash-script you can use to automatically install software and docker containers with a simple GUI. It also acts as a tool to easily create reverse proxies with Nginx.

This is a tool fitting my personal setup procedure on a new ubuntu machine and therefore using the configuration I normally use to setup my servers.

It can automatically install software like Webmin, Docker, ZSH and Nginx. Given that the domain of the webserver is managed with Cloudflare it is also possible to automatically get and install an SSL certificate from Letsencrypt.

You can also easily install some Containers like Portainer, Statping, Teamspeak, Sinusbot, Heimdall, Nextcloud, Duplicati and Watchtower.

If you have NGINX installed you can also directly setup reverse proxies for your webservices to reach them from the outside without the need to open up other ports than 80 and 443.

You can download and learn more about the tool on Github:

https://github.com/nicojeske/UbuntuServerSetupTool
