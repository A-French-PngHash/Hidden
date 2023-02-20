
# Hidden

## Introduction

This is a fun project I built after discovering a few techniques for hiding images (or more generally, data) into other images. Currently the app supports the **LSB** (Least Significant Bit) technique for encoding and decoding images.

## Screenshot

  

<img  src="https://user-images.githubusercontent.com/75045140/220206955-7e43f107-2e11-4031-adcb-fd6aff1b15a3.png"  width="55%">

## Algorithm

### LSB

A quick rundown on how LSB work. An image is composed of a lot of individuals pixels. In the **RGB** format each pixel has 3 different values between 0 and 255 that correspond to the amount of Red, Green and Blue for this pixel. Those values are coded on 8 bits. For example, the red value might be :

<pre>011001<b>01</b></pre>

Notice that the last few bits doesn't impact much the value for this pixel (replacing it by 00) makes the value go from **101** to **100**. The idea is therefore to store the image to hide in those last bits. Of course this reduces the number of colors available for the hidden image to n<sup>3</sup> where n is the number of bits used.
