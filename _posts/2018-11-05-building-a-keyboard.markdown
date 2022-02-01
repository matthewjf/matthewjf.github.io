---
layout: post
title:  "Building a Keyboard"
date:   2018-11-05
categories: Keyboards
tags: [keyboards, make]
image: "/images/keyboard_wires.jpg"
---

I use a lot tools to optimize my life, but spent 20+ years using keyboards without questioning them. The majority of keyboards you can buy use the same format, a format which was originally designed for typewriters.

> A feature much less commented-on than the order of the keys is that the keys do not form a rectangular grid, but rather each column slants diagonally. This is because of the mechanical linkages – each key is attached to a lever, and hence the offset prevents the levers from running into each other – and has been retained in most electronic keyboards. (<cite><a href="https://en.wikipedia.org/wiki/QWERTY#Properties" target="_blank_">source</a></cite>)

***

## Motivation

I wanted to rethink keyboards with a number of improvements:

**Ortholinear**: The keys of an ortholinear keyboard are vertically aligned and not offset. How often do you look down at the keyboard to find numbers? Vertically aligned keys reduce the likelihood of mistakes since it eliminates a lot of lateral movement.

**Non-QWERTY Layout**: QWERTY was originally designed for typewriters. Typewriters require much more finger force, so switching hands between keys was an advantage. Modern keyboards don't have the same constraints. I wanted a layout that minimizes overall effort. It turns out this is very specific to the tasks I do but I'll revisit that later.

**Thumb Usage Rate**: Thumbs have the greatest lateral movement of all the fingers on the hand and share 2 keys: <kbd>cmd</kbd>+<kbd>space</kbd>. Meanwhile, one index finger is responsible for 8 keys. I wanted a keyboard that utilized my thumbs much more.

**Ergonomics**: Keys on a keyboard are horizontally aligned. When bringing your hands together, they naturally bend inward at an angle. The horizontal alignment of keys doesn't match the angle of your hands, which can create strain.


Finally, I hoped to understand how keyboards work at the end of this process, which is why I built one from scratch.

***

## The Build
This will be a short section. Much of the process was taken directly from this <a href="https://gizmodo.com/i-built-a-keyboard-from-scratch-1649325860" target="_blank">article</a>.

For the physical layout of the keyboard, I used CAD files from the <a href="https://www.ergodox.io/" target="_target">ergodox</a> as a starting point and modified them to my own design. The case is made from laser cut acrylic.

![keyboard](/images/keyboard_open.jpg "keyboard")

The keyboard uses a teensy 2.0 microcontroller, and a <a href="https://en.wikipedia.org/wiki/Keyboard_matrix_circuit" target="_blank">matrix circuit</a> to connect all the keys. Once everything was assembled, I loaded the <a href="https://github.com/tmk/tmk_keyboard" target="_blank">TMK firmware</a> onto the microcontroller and had a working keyboard!

![keyboard](/images/keyboard_finished.jpg "keyboard")

Designing, sourcing parts, and assembling the keyboard took several months. Turns out it's also expensive to build your own keyboard. Here's the cost breakdown (excluding tools):

| Item                  |  Price  |
| :-------------------- | -------:|
| diodes                |   $6.93 |
| teensy and wires      |  $34.13 |
| case                  |  $68.45 |
| switches              |  $75.56 |
| modifiers and orings  |  $36.25 |
| nuts and spacers      |  $17.98 |
| keycaps and leds      |  $43.48 |
| **total**             | **$282.78** |


***

## Conclusions

There's so many details to how I finally settled on a keyboard layout that it deserves it's own post, so I won't dig into those changes here. However, having <kbd>enter</kbd>, <kbd>backspace</kbd>, <kbd>space</kbd> and <kbd>delete</kbd> accessible to my thumbs is enough of a win on its own to make the change worthwhile. No more pulling my fingers off the home row to hit backspace or enter.

Another advantage is that touch typing numbers is trivial with an ortholinear layout. I've always had trouble with the number `6` on a standard keyboard.

On the downside, acrylic isn't very durable. Keys are held in place by a couple tabs on each of the switches. A few of these became loose or broke over time, which makes the switches feel unstable. Either a metal mounting plate or using PCB would likely resolve the problem.

Ultimately, thumb usage and being able to customize the keyboard layout are the greatest benefits to the keyboard. I spend so much of my day on keyboards and have never regretted the investment. In fact, I built 3 more keyboards after that, improving on the initial design.

***
