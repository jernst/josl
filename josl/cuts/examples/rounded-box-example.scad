//
// Cut a cube with a comb that has rounded corners.
//
// (C) 2019 Johannes Ernst.
// License: see package.
//

use <josl/cuts/leftright.scad>

module MyPart() {
    translate( [ -50, 0, 0 ] ) {
        cube( [ 100, 100, 5 ] );
    }
}

LeftRight() {
    MyPart();

    translate( [ 0, -3, 0, ] )
    minkowski() {
        square( size = [ 6, 6 ] );
        circle( r=2 );
    };
}
