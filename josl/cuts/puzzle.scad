//
// Cuts into a puzzle-piece-like protrusion (and cavity).
//
// parameters:
// height: the height of the protrusion (x direction)
// width: the maximum width of the protrusion (y direction)
// base: the width of the stem of the protrusion (y direction)
// stem: the height of the stem of the protrusion to the center of the ellipsis (x direction)
//

use <leftright.scad>

module Puzzle( height=10, width=10, base=5, stem=6, apart=10, minX=-200, maxX=200, minY=-200, maxY=200, minZ=-200, maxZ=200, play=.1, y=[] ) {

    LeftRight( apart, minX, maxX, minY, maxY, minZ, maxZ, y=y, play=play ) {
        children(0);

        union() {
            translate( [ 0, -base/2, 0 ] )
            square( [ stem, base ] );

            translate( [ stem, 0, 0 ] )
            scale( [ ( height - stem) * 2 / width, 1, 0 ] ) {
                circle( d=width ); // looks clumsy but renders better
            }
        }
    };
};
