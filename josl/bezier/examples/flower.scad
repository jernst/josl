//
// A very basic flower pattern testing out the Bezier curves.
//
// (C) 2019 Johannes Ernst.
// License: see package.
//

use <josl/bezier/bezier.scad>

r  = 30;
r2 = 80;
delta = 0;

p = [ for( alpha = [ 0 : 30 : 360 ] ) [ cos(alpha) * r, sin(alpha) * r ]];
q = [ for( alpha = [ 0 : 30 : 360 ] ) [ [ cos(alpha) * r2, sin(alpha) * r2 ], [ cos(alpha+delta) * r2, sin(alpha+delta) * r2 ] ]];

linear_extrude( 10 ) {
    polygon( bezier_curve_seq( p, q ));
};
