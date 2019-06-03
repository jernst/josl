//
// Cut a simply cube.
//

use <josl/cuts/comb.scad>
use <josl/cuts/puzzle.scad>
use <josl/cuts/zigzag.scad>

module MyPart() {
    translate( [ -50, 0, 0 ] ) {
        cube( [ 100, 100, 5 ] );
    }
}

// Uncomment this for a comb cut
// Cut at the default locations
// Comb() {
//     MyPart();
// }

// Uncomment this for a comb cut
// Cut at the specified locations
// Comb( y=[ 20, 40, 80 ] ) {
//     MyPart();
// }

// Uncomment this for a zig-zag cut
// ZigZag( y = [ 10, 30 ] ) {
//     MyPart();
// }

// Uncomment this for a puzzle cut
Puzzle( y = [ 10, 50, 80 ] ) {
    MyPart();
}
