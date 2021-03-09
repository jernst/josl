//
// A single letter.
// The left-bottom cylinder of the first letter is centered at the origin, extending into y direction.
//
// (C) 2021 Johannes Ernst.
// License: see package.
//

// Invoke as:
//
//     include <josl/dotletter/dotfont.scad>
//     include <josl/dotletter/dotletter.scad>
//
//     dotletter( c, holeR, holeDepth, holeDelta )
//
// where:
// * c:         the letter, such as "A"
// * holeR:     radius of the cylinder that forms a single dot / pixel
// * holeDepth: height of that cylinder
// * holeDelta: the distance between adjacent dots

module dotletter_dot( holeR, holeDepth ) {
    translate( [ 0, holeDepth, 0 ] )
    rotate( [ 90, 0, 0 ] ) {
        cylinder( r=holeR, h=holeDepth );
    }
}

module dotletter( c, holeR, holeDepth, holeDelta ) {

    isChar = ord( c ) >= ord( "A" );

    font   = isChar ? uppercaseFont : digitFont;
    offset = isChar ? ord( "A" ) : ord( "0" );

    dots = font[ ord( c ) - offset ];

    for( y = [ 0:6 ] ) {
        for( x = [ 0:4 ] ) {
            if( dots[y][x] ) {
                translate( [ x * holeDelta, 0, ( 6 - y ) * holeDelta ] ) {
                    dotletter_dot( holeR, holeDepth );
                }
            }
        }
    }
}
