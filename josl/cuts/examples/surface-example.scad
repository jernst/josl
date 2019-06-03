//
// Cut a part that has a complex surface. The z coordinates of that
// surface are contained in "surface.dat", which can be generated with
// something like:
//     python3 surface.py > surface.dat
// (depending on your operating system)
//

use <josl/cuts/comb.scad>
use <josl/cuts/puzzle.scad>
use <josl/cuts/zigzag.scad>

// Here's the part
module MyPart() {
    translate( [ -20, 0, 0 ] )
    scale( [ 1, 1, 1 ] ) {
        surface(file = "surface.dat" );
    };
};

// Uncomment this for a comb cut
// Comb( y = [ 10, 20, 30 ] ) {
//     MyPart();
// }

// Uncomment this for a zig-zag cut
// ZigZag( y = [ 10, 30 ] ) {
//     MyPart();
// }

// Uncomment this for a puzzle cut
Puzzle( y = [ 10, 30 ] ) {
    MyPart();
}
