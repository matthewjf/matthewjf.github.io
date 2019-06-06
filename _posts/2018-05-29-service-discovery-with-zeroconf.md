---
layout: post
title:  "Service Discovery with Zeroconf"
date:   2018-5-29 18:33:11 -0700
categories: Mobile
tags: [mobile, networking, make]
image: "/public/images/satellite.jpg"
---

My TV system has a TV (of course), an audio receiver, and a home theater PC. It's cumbersome to deal with all of that using a universal remote. So I decided to build a mobile app to control all of these components in a simple way, and to teach myself a little about mobile app development.

**First question**: How do I deal with some relatively old equipment that can only be controlled by infrared signals?

After a bit of searching, I discovered LIRC which is an open source package to send and receive IR signals. <a target="_blank_" href="https://github.com/alexbain/lirc_node">lirc_node</a> is a javascript interface for LIRC. Given these tools, I came up with a plan to run a node server on a raspberry pi, which could receive http requests and transmit IR signals to the various devices.

**Second question**: How do I manage sending commands to the home theater PC?

I initially thought of adding a IR receiver via usb, but it seemed that the more things that could communicate over the network, the better. The raspberry pi would serve as the smart home hub, which receives requests from clients and sends commands out to all the connected devices.

[ ![raspberry pi](/public/images/raspberry_pi.jpg "raspberry pi") ](/public/images/raspberry_pi.jpg)

So, I got the raspberry pi setup, able to send and receive IR signals. I get a basic web server running on the home theater PC. Time to hook everything up. ***Wait***. How do I know the status of each of the services? How do I deal with dynamic IPs on a local network? I didn't want devices to be on all the time, but I first needed a way to identify the status of each of the devices and wake them if necessary.

## Zeroconf

> Zero-configuration networking (zeroconf) is a set of technologies that automatically creates a usable computer network based on the Internet Protocol Suite (TCP/IP) when computers or network peripherals are interconnected. It does not require manual operator intervention or special configuration servers. (<cite><a href="https://en.wikipedia.org/wiki/Zero-configuration_networking" target="_blank_">source</a></cite>)

It allows devices on the network to be discoverable.

### MacOS/iOS

Apple products come with this enabled out of the box and it doesn't require any work. 

### Linux

### Windows

### Android
