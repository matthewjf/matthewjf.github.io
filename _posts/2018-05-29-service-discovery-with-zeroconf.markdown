---
layout: post
title:  "Service Discovery with Zeroconf"
date:   2018-5-29 18:33:11 -0700
categories: Mobile
tags: [mobile, networking, make]
image: "/images/satellite.jpg"
---

My TV system has a TV (of course), an audio receiver, and a home theater PC. It's cumbersome to deal with all of that using a universal remote. So I decided to build a mobile app to control all of these components in a simple way, and to teach myself a little about mobile app development.

**First question**: How do I deal with some relatively old equipment that can only be controlled by infrared signals?

After a bit of searching, I discovered LIRC which is an open source package to send and receive IR signals. <a target="_blank_" href="https://github.com/alexbain/lirc_node">lirc_node</a> is a javascript interface for LIRC. Given these tools, I came up with a plan to run a node server on a raspberry pi, which could receive http requests and transmit IR signals to the various devices.

**Second question**: How do I manage sending commands to the home theater PC?

I initially thought of adding a IR receiver via usb, but it seemed that the more things that could communicate over the network, the better. The raspberry pi would serve as the smart home hub, which receives requests from clients and sends commands out to all the connected devices.

[ ![raspberry pi](/images/raspberry_pi.jpg "raspberry pi") ](/public/images/raspberry_pi.jpg)

So, I got the raspberry pi setup, able to send and receive IR signals. I get a basic web server running on the home theater PC. Time to hook everything up. ***Wait***. How do I know the status of each of the services? How do I deal with dynamic IPs on a local network? I didn't want devices to be on all the time, but I first needed a way to identify the status of each of the devices and wake them if necessary.

## Zeroconf

> Zero-configuration networking (zeroconf) is a set of technologies that automatically creates a usable computer network based on the Internet Protocol Suite (TCP/IP) when computers or network peripherals are interconnected. It does not require manual operator intervention or special configuration servers. (<cite><a href="https://en.wikipedia.org/wiki/Zero-configuration_networking" target="_blank_">source</a></cite>)

It allows devices on the network to be discoverable.

### MacOS/iOS

Apple products come with this enabled out of the box. It doesn't require any additional work, and it works great!

### Linux

<a href="https://linux.die.net/man/8/avahi-daemon" target="_blank_">Avahi Daemon</a> is easy to install on the raspberry pi and works without much configuration.

### Windows

This is where things get a bit challenging. Windows doesn't support this out of the box. The best 3rd party software that I could find was Apple's Bonjour Print Services for Windows. With the latest version of windows, the service kept dying on sleep. There's some windows configuration to restart such services, but the issue kept occurring. The solution was to write a bash script that would attempt to kill the process and restart it whenever the computer wakes up. This seems to work in ***most*** cases.

### Android

I had a small 7" android tablet that I was intending to use as a dedicated remote. I tried using some existing implementations of zeroconf to see if I could discover the other devices on the network. At the time, there were only a few options. <a href="https://melloware.com/zeroconf/" target="_blank_">Zeroconf browser</a> was the best match, but I couldn't get it to discover any other services on the network, no matter how hard I tried. The battery life on the cheap tablet was pretty bad as well, so I ended up ditching it altogether.

## Takeaways

I initially liked the idea of running everything locally because of fewer security concerns and faster response times. If the only devices you need to connect are Apple and Linux devices, no problem. When you start mixing in Windows and Android, things can get a bit messier. Unfortunately, I couldn't find a silver bullet to this problem before moving to a different setup.

### Additional Info

<a href="https://github.com/matthewjf/bandit_mobile/" target="_blank_">React Native mobile client</a><br/>
<a href="https://github.com/matthewjf/bandit/" target="_blank_">Node web application</a>
