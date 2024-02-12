# AUXIN-Utilities for Generative Art

**NOTE: This code is likely to change with little or no warning. You should not
use this for anything remotely important. Make sure to clone the repo if you
need it to remain stable.**

## About

Utilities for working with with generative algorithms.

![Elastic Web](img/web.png)

## Components

Here are the main components: `TODO`

1. Random numbers, some examples:

   ```lisp
   (in-package :rnd)
   (rnd a) ; in range [0.0, a), defaults to a=1.0.
   (rnd* a) ; in range [-a, a), defaults to a=1.0.
   (rndrng a b) ; in range [a, b)
   (rndi 10) ; random fixnum
   (rndspace n a b) ; n numbers in [a, b)
   (norm :mu 0.0 :sigma 1.0) ; normal distribution
   (2in-circ a) ; in circle of radius a
   (2in-rect w h) ; in a rectangle
   (2nin-rect n w h) ; n in rectangle.
   (2on-line ax ay bx by) ; point between points a and b

   ; do something with probability 0.1, second form is optional
   (prob 0.1 (print "10% hi") (print "90% oh no"))

   ; perform either form 1 or (optionally) 2
   (either (print "form 1") (print "form 2"))
   ```

   See [rnd.lisp](src/rnd/rnd.lisp), [2rnd.lisp](src/rnd/2rnd.lisp) and
   [3rnd.lisp](src/rnd/3rnd.lisp), for all available functions.

2. A tool for drawing `svg` files: `wsvg`. See [draw.lisp](/examples/draw.lisp).

3. `TODO: more descriptions ...`

In addition the library contains a number of useful tools for dealing with
(predominantly) vector graphics.

![Sun](img/sun.png)

![Symbols](img/symbols.png)

![Boxes](img/boxes.png)


## Installation and Dependencies

To use `auxin` you have to have these three libraries available locally:

 - https://github.com/inconvergent/cl-veq
 - https://github.com/inconvergent/cl-grph
 - https://github.com/inconvergent/lqn

I recommend cloning them and installing them via Quicklisp. Here is how to use
local projects in QL:
http://blog.quicklisp.org/2018/01/the-quicklisp-local-projects-mechanism.html

