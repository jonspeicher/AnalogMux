AnalogMux
=========

AnalogMux is an Arduino-based interface to a SparkFun 16-Channel Analog Multiplexer breakout board.

Description
===========

[HackPittsburgh](http://www.hackpittsburgh.org) has launched two high-altitude balloon projects.  
One was successful, one was not.  Our third launch is pending, and the payload is anticipated to 
include a number of sensors not previously flown.  This will challenge the Arduino-based flight
computer, given its limited number of analog inputs.

To address this limitation, a SparkFun 16-Channel Analog Multiplexer breakout board was selected.
This board will allow up to 16 analog inputs to feed into one Arduino analog input pin.  This
requires four digital outputs from the Arduino used to select which analog input is connected to the
Arduino.

This software library provides an interface to the multiplexer.

Previous balloon launch photos are available at the 
[HackPittsburgh Flickr Pool](http://www.flickr.com/groups/hackpgh).  My favorites, plus my ground
photos, are in [My Flickr set](http://www.flickr.com/photos/jonspeicher/sets/72157624683638916/).

Minimum Requirements
====================

* An Arduino (http://arduino.cc)
* Arduino 0021 (http://arduino.cc)
* SparkFun Analog Mux Breakout (http://www.sparkfun.com/commerce/product_info.php?products_id=9056)

Usage
=====

To use AnalogMux in your project, you must ensure that a few preprocessor definitions are accurate,
and you must of course wire up the proper circuit.  The best place to see what is required is in the
code itself.  If you have any questions, email me.

Initialize the analog multiplexer by calling the `initAnalogMux` function.  This function requires
that the Arduino pins to which the multiplexer's S0, S1, S2, and S3 inputs be specified as 
parameters.

Initially, channel 0 is selected.  To select a different channel, call `selectAnalogMuxChannel` with
the number of the channel, 0 - 15, to select.  The analog voltage can then be read from the analog
input pin using the built-in `analogRead` function.

Tests
=====

AnalogMux is completely and utterly untested and unreviewed.  The code compiles, and that's all.  I 
tried to be careful with the coding and design, and I read the datasheet.  Nevertheless, I haven't 
actually *run* this thing yet.

Improvements
============

The chip on the SparkFun Analog Mux Breakout, the TI CD74HC4067, supports an enable line that will 
turn off all of the analog inputs.  This is currently unsupported in the library.

It would also be nice to package this up better some day.

History
=======

0.1
---

* Initial release (totally untested)

License
=======

    The MIT License

    Copyright (c) 2010 Jonathan Speicher

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.