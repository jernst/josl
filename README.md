= About JOSL =

Organizing what you have already is half the work, and so it's time for me to put generally-useful
OpenSCAD models into a library for easy reuse. So I proudly present: JOSL, Johannes' 
[OpenSCAD](http://www.openscad.org/) library. Here it is.

So far, it knows how to:
* [cut too-big models into half](josl/cuts/), using a variety of joints
* [create Bezier paths](josl/bezier/)

To use:
#. ``git clone https://github.com/jernst/josl.git``
#. set your ``OPENSCADPATH`` environment variable to contain the checked-out directory
#. and use the models with ``use <josl/xxx>`` in your OpenSCAD models.

