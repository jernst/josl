//
// A "hello world" example for the dotletters
//
// (C) 2021 Johannes Ernst.
// License: see package.
//

include <josl/dotletter/dotfont.scad>
include <josl/dotletter/dotline.scad>

dotline( "HELLO JOSL", 3, 8, 8 );

translate( [ 10, 20, 80 ] )
dotletter( "4", 6, 16, 16 );
