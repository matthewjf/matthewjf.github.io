---
layout: post
title:  "An Efficient Keyboard Layout"
date:   2018-12-10 08:12:18 -0700
categories: keyboards
image: "/public/images/infinity_ergodox.jpg"
---

I thought a lot about keyboard efficiency while designing and [building a keyboard](keyboards/2019/01/05/building-a-keyboard.html). I had a friend mention that he used <a href="https://colemak.com/" target="_blank">Colemak</a>, a keyboard layout alternative to QWERTY. This got me wondering, what makes an efficient keyboard layout?

****

## Drawbacks of QWERTY

QWERTY was created in the 1870s for typewriters. Typewriters have mechanical arms that each key actuates to put a letter onto the page. This requires much more force than a computer keyboard. Because of this, QWERTY was optimized for alternating hands while typing. Similarly, typewriters need an offset layout so that the mechanical arms don't overlap. Neither of these considerations apply to computer keyboards today.

****

## Alternatives

Two well known QWERTY alternatives are **Dvorak** and **Colemak**. Both of these options have a relatively wide user base and hence support. However, I quickly realized that switching keyboard layouts isn't like buying a new car. It's hard to describe. Even typing a single word becomes an awkward and frustrating task. It would take quite an investment on my part to get accustomed to a new layout, and I wasn't willing to make this investment more than once. Beliefs that helped guide my decision:

- My left and right hand are relatively close in typing ability
- I use a matrix layout keyboard (ortholinear)
- I'm not concerned with the ease of transition from QWERTY

After some searching, I found the <a href="https://workmanlayout.org/" target="_blank">Workman layout</a>. On the workman website, there's a detailed explanation on the drawbacks of both Colmak and Dvorak. The design philosophy is that each key takes some amount of effort, and given some representative body of text, we can create a layout that minimizes typing effort.

![workman layout](/public/images/workman_layout.png "workman layout")  

*Note: I later discovered <a href="http://mkweb.bcgsc.ca/carpalx/" target="_blank">Carpalx</a>, a robust quantitative model for keyboard layout optimization. Something worth looking into.*

It took several months of using Workman before reaching a similar level of proficiency. Many common key combinations became much easier and quicker, and I felt overall less finger stress while using it. But Workman only changes the orientation of letters. As I continued to use it, I found there was a lot of opportunity for improvement in other areas.

****

## Customization

The keyboard firmware that I use allows for total control over the layout. It includes the concept of function layers. The description from the firmware wiki:

> Layers are applied one on top of another in the order you apply them.  
>  
> For example, if you were typing normally on the main layer, and you hit Lock 1 to lock the layer to layer number 1, it would apply any keys in layer 1 on top of the main layer. So hitting a key left clear in layer 1 would output the character assigned to that key on the main layer, but if you had say 'h' assigned to that key on layer 1, it would output 'h'. If you then latched layer 2 that layer would be applied on top of the current assignments replacing only the keys it has set and leaving all the rest alone.

The layout that I landed on contains 4 layers: workman, qwerty, navigation, numbers.

### Layers

[ ![workman layer](/public/images/workman_layer.png "workman layer") ](/public/images/workman_layer.png)
Workman Layer
{: style="color:gray; font-size: 80%; text-align: center; font-style: italic;"}

This is the base layer of the keyboard. Many of the harder to reach keys, such as numbers, are replaced in other layers. You'll notice `2` and `3` next to the `alt/option` keys. These toggle on layers 2 and 3 respectively while held down. Also, I moved `command` to where `caps lock`  normally is. I use `command` with arrow keys quite often, so it makes sense for it to live on the left hand. An alternative could be the thumb keys, but the location I chose also fits well on standard layout keyboards like my laptop.

[ ![qwerty layer](/public/images/qwerty_layer.png "qwerty layer") ](/public/images/qwerty_layer.png)
QWERTY Layer
{: style="color:gray; font-size: 80%; text-align: center; font-style: italic;"}

I added this layer in case others want to use the keyboard, but I never use it myself. I'm quite terrible at QWERTY.

[ ![navigation layer](/public/images/navigation_layer.png "navigation layer") ](/public/images/navigation_layer.png)
Navigation Layer
{: style="color:gray; font-size: 80%; text-align: center; font-style: italic;"}

This layer is primarily geared towards navigation.

On the right hand:
- The home row is arrow navigation.
- The top is used for windows management. On Macs I use third party software to bind these keys to things such as docking window left/right and moving them between screens.
- These can be useful in certain applications, can really depend on the builtin navigation.

On the left hand is assorted key bindings:
- `Caps`: Not reaching for caps lock is nice when coding.
- `Cmd+backtick` is a standard for switching between windows of the same application. I work on many projects and usually have 4 or 5 code editors open at a time.
- `Ctrl+0`: toggles between file editor and code editor, which I find is faster than switching back to terminal in a lot of cases.
- `Esc`: on the home row is pretty nice especially if you use Vim or Vim bindings.
- `Ctr+A`, `Ctrl+E` and `Ctrl+C` are standard key binds in Terminal.
- Also having more accessible shifted keys `:` and `"` are a plus, but I admittedly don't use these binds much.

Overall, this hand could use some improvement.

[ ![number layer](/public/images/number_layer.png "number layer") ](/public/images/number_layer.png)
Number Layer
{: style="color:gray; font-size: 80%; text-align: center; font-style: italic;"}

This is the number/symbol layer. Initially, I had a Numpad on the right hand, but couldn't get used to it. Putting all the numbers on the home row and symbols one row above it made a lot of sense. Brackets and parentheses are on the bottom row. I use these a lot when coding and they're much easier to reach in these locations.

****

## Conclusions

It took a few years to come up with a layout that I really enjoy. The result is that I do most day to day tasks only using 44 of the 76 keys on the Ergodox. Hopefully this inspires others to think about how the use their keyboards and how they can be improved.
