//
// Cuts a zigzag line (a bunch of equilateral triangles in a line).
//
// parameters:
// zig: the height of the triangle (x direction)
// zag: the length of the base of the triangle (y direction)
//

use <leftright.scad>

module ZigZag( zig=10, zag=10, apart=10, minX=-200, maxX=200, minY=-200, maxY=200, minZ=-200, maxZ=200, play=.1, y=[] ) {
    LeftRight( apart, minX, maxX, minY, maxY, minZ, maxZ, y=y, play=play ) {
        children(0);

        polygon( points=[
                [ 0, -zag/2 ],
                [ zig, 0 ],
                [ 0, zag/2 ],
                [ 0, 0 ]
        ] );
    };
};
