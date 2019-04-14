//
// Cuts a comb (a bunch of rectangles in a line).
//
// parameters:
// height: the height of the rectangle (x direction)
// width: the length of the base of the rectangle (y direction)
//

use <leftright.scad>

module Comb( height=5, width=5, apart=10, minX=-200, maxX=200, minY=-200, maxY=200, minZ=-200, maxZ=200, play=.1, y=[] ) {
    LeftRight( apart, minX, maxX, minY, maxY, minZ, maxZ, y=y, play=play ) {
        children(0);

        translate( [ 0, -width/2, 0, ] ) {
            square( size = [ height, width ] );
        };
    };
}
