//
// Bezier curve implementation. 2D-only; does not generate 3D surfaces.
// This generates a vector of points, which approximates the curve.
//
// (C) 2019 Johannes Ernst.
// License: see package.
//

// There are two ways of invoking this:
// * bezier_curve(p) calculates a single Bezier curve with starting point
//   p[0] and end point p[-1], with the remaining points in between being
//   additional control points. Bezier curves of degree 2, 3 and 4 are
//   supported, meaning len(p) can be 2, 3 or 4.
// * bezier_curve_seq( p, q ) calculates a connected sequence of Bezier
//   curves, where the second curve's first point is the first curve's last
//   point. Here p is the sequence of points through which the connected
//   sequence curve must go, and q contains any (optional) additional
//   control points for the various Bezier segments.
//   Note: the generated sequence of points does not include the very last
//   point. If you want it, invoke the next form. (This makes it
//   easier to concatenate and pass into polygon() which auto-closes.)
// * bezier_curve_seq_inclusive( p, q ) is the same as bezier_curve_seq( p, q )
//   but also includes the last point.
//
// Special parameter: $bsteps: the number of points to calculate for each
// Bezier curve.
//
// Examples; Note that to display those examples in OpenScad, you have to use
// those segments as part of a closed loop with non-zero width, such as a
// polygon with at least 3 points, so you can see something!
// * bezier_curve( [ [0, 0], [10, 10] ])
//   the (degenerate) straight line between the two points
// * bezier_curve( [ [0, 0], [10, 0], [10, 10] ] )
//   A degree-3 curve that starts at [0, 0], ends at [10, 10] and uses
//   control point [10, 0].
// * bezier_curve( [ [0, 0], [10, 0], [5, 5], [10, 10] ] )
//   A degree-4 curve that starts at [0, 0], ends at [10, 10] and also
//   uses control points [10, 0] and [5, 5].

$bsteps = 20;

function bezier_curve_seq( p, q=[], bsteps=$bsteps ) = [
    for( i = [ 0 : len(p)-2 ] ) each
        ( i < len(q) && len(q[i]) > 0 )
            ? bezier_curve( concat( [ p[i] ], q[i], [ p[i+1] ] ), bsteps=bsteps )
            : [ p[i] ]
];

function bezier_curve_seq_inclusive( p, q=[], bsteps=$bsteps ) = [
    for( i = [ 0 : len(p)-2 ] ) each
        ( i < len(q) && len(q[i]) > 0 )
            ? bezier_curve( concat( [ p[i] ], q[i], [ p[i+1] ] ), bsteps=bsteps )
            : [ p[i] ],
    p[len(p)-1]
];


function bezier_curve( p, bsteps = $bsteps ) = [
    for( i = [ 0 : bsteps-1 ] ) bezier_curve_calc( i/bsteps, p )
];

function bezier_curve_calc( t, p ) =
      len(p) == 2 ? bezier_curve_calc2( t, p ) 
    : len(p) == 3 ? bezier_curve_calc3( t, p )
    : len(p) == 4 ? bezier_curve_calc4( t, p )
    : error( "Unsupported length of points array", len(p))
;

function bezier_curve_calc2(t, p) = 
          p[0] * (1-t)
    +     p[1] * t
;

function bezier_curve_calc3(t, p) = 
          p[0] * (1-t) * (1-t)
    + 2 * p[1] * t     * (1-t)
    +     p[2] * t     * t
;

function bezier_curve_calc4(t, p) = 
          p[0] * (1-t) * (1-t) * (1-t)
    + 3 * p[1] * t     * (1-t) * (1-t)
    + 3 * p[2] * t     * t     * (1-t)
    +     p[3] * t     * t     * t
;
