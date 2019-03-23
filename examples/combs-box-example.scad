use <../cuts/comb.scad>

module MyPart() {
    translate( [ -50, 0, 0 ] ) {
        cube( [ 100, 100, 5 ] );
    }
}

Combs() {
    MyPart();
}
