use <../cuts2/comb.scad>

module MyPart() {
    translate( [ -50, 0, 0 ] ) {
        cube( [ 100, 100, 5 ] );
    }
}

Comb() { //  y=[ 20, 60, 90, 120 ] ) {
    MyPart();
}
