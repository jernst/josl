use <leftright.scad>

//
// The following does not work:
// according to http://forum.openscad.org/Operator-problem-tp25984p25989.html
// "this is currently impossible": only one child can be passed up
//
// module Combs2( apart=5, step=10, insert=20, height=5, play=0.5, max=100 ) {
//     LeftRight( step=step, insert=insert, height=height, play=play, max=max ) {
//         cube( [ insert+play, step+2*play, height ] );
//         cube( [ insert-play, step-2*play, height ] );
//         children();
//     };
// };
// 
// module LeftRight( apart=5, step=10, insert=20, height=5, play=0.5, max=100 ) {
//     translate( [ apart, 0, 0 ] )
//     Right( step=step, insert=insert, height=height, play=play, max=max )
//     children();
// 
//     translate( [ -apart, 0, 0 ] )
//     Left( step=step, insert=insert, height=height, play=play, max=max )
//     children();
// };

module Combs( apart=5, step=10, insert=20, height=5, play=0.5, max=100 ) {
    translate( [ apart, 0, 0 ] )
    Right( step=step, insert=insert, height=height, play=play, max=max ) {
        cube( [ insert+play, step+2*play, height ] );
        cube( [ insert-play, step-2*play, height ] );
        children();
    };

    translate( [ -apart, 0, 0 ] )
    Left( step=step, insert=insert, height=height, play=play, max=max ) {
        cube( [ insert+play, step+2*play, height ] );
        cube( [ insert-play, step-2*play, height ] );
        children();
    }
};
