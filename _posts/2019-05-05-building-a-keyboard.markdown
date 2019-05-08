---
layout: post
title:  "Building a Keyboard"
date:   2019-05-05 14:48:18 -0700
categories: keyboards
image: "/public/images/keyboard_wires.jpg"
---

I use a lot tools to optimize my life, but spent 20+ years using keyboards without questioning them. The majority of keyboards you can buy use the same format, a format which was originally designed for typewriters.

> A feature much less commented-on than the order of the keys is that the keys do not form a rectangular grid, but rather each column slants diagonally. This is because of the mechanical linkages – each key is attached to a lever, and hence the offset prevents the levers from running into each other – and has been retained in most electronic keyboards. <cite><a href="https://en.wikipedia.org/wiki/QWERTY#Properties" target="_blank">(source)</a></cite>

****

## Motivation

I wanted to rethink keyboards with a number of improvements:

**Ortholinear**: The keys of an ortholinear keyboard are vertically aligned and not offset. How often do you look down at the keyboard to find numbers? Vertically aligned keys reduce the likelihood of mistakes since it eliminates a lot of lateral movement.

**Non-QWERTY Layout**: QWERTY was originally designed for typewriters. Typewriters require much more finger force, so switching hands between keys was an advantage. Modern keyboards don't have the same constraints. I wanted a layout that minimizes overall effort. It turns out this is very specific to the tasks I do but I'll revisit that later.

**Thumb Usage Rate**: Thumbs have the greatest lateral movement of all the fingers on the hand and share 2 keys: `cmd|alt`+`space`. Meanwhile, one index finger is responsible for 8 keys. I wanted a keyboard that utilized my thumbs much more.

**Ergonomics**: Keys on a keyboard are horizontally aligned. When bringing your hands together, they naturally bend inward at an angle. The horizontal alignment of keys doesn't match the angle of your hands, which can create strain.


Finally, I hoped to understand how keyboards work at the end of this process. I decided to build one from scratch.

****

## The Build
This will be a short section. Much of the process was taken directly from this <a href="https://gizmodo.com/i-built-a-keyboard-from-scratch-1649325860" target="_blank">article</a>.

For the physical layout of the keyboard, I used CAD files from the <a href="https://www.ergodox.io/" target="_target">ergodox</a> as a starting point and modified them to my own design. The case was made from laser cut acrylic.

![keyboard](/public/images/keyboard_open.jpg "keyboard")

The keyboard uses a teensy 2.0 microcontroller, and a <a href="https://en.wikipedia.org/wiki/Keyboard_matrix_circuit" target="_blank">matrix circuit</a> to connect all the keys. Once everything was assembled, I loaded the <a href="https://github.com/tmk/tmk_keyboard" target="_blank">TMK firmware</a> onto the microcontroller and had a working keyboard!

![keyboard](/public/images/keyboard_finished.jpg "keyboard")

Easy right? Designing, sourcing parts, and assembling the keyboard took several months.
