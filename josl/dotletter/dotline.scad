//
// A line of dotletters, to display a character string.
// The left-bottom cylinder of the first letter is centered at the origin, extending into y direction.
//
// (C) 2021 Johannes Ernst.
// License: see package.
//

// Invoke as:
//
//     include <josl/dotletter/dotfont.scad>
//     include <josl/dotletter/dotline.scad>
//
//     dotline( text, holeR, holeDepth, holeDelta )
//
// where:
// * c:           the letter, such as "A"
// * holeR:       radius of the cylinder that forms a single dot / pixel
// * holeDepth:   height of that cylinder
// * holeDelta:   the distance between adjacent dots
// * letterDelta: the distance between adjacent letters, with 7 * holeDelta as default

include <josl/dotletter/dotletter.scad>

module dotline( text, holeR, holeDepth, holeDelta, letterDelta = -1) {
    realLetterDelta = letterDelta == -1 ? holeDelta * 7 : letterDelta;

    for( i = [ 0 : len( text )-1 ] ) {
        translate( [ i * realLetterDelta, 0, 0 ] ) {
            dotletter( text[i], holeR, holeDepth, holeDelta );
        }
    }
}
