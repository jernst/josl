module Right( step=10, insert=20, height=5, play=0.5, max=100 ) {
    union() {
        difference() {
            // positive quadrant of all axes only
            intersection() {
                children(2);
                cube( [ max, max, max ] );
            };
            for( i=[step/2:2*step:max-step-step/2] ) {
                translate( [ 0, i-play, 0 ] ) {
                    children(0);
                };
            };
        };
        for( i=[step+step/2:2*step:max-step-step/2] ) {
            translate( [ -insert+play, i+play, 0 ] ) {
                children(1);
            };
        };
    };
};

module Left( step=10, insert=20, height=5, play=0.5, max=100 ) {
    union() {
        difference() {
            // negative x, positive y and z quadrant only
            intersection() {
                children(2);
                translate( [ -max, 0, 0 ] ) {
                    cube( [ max, max, max ] );
                };
            };
            for( i=[step+step/2:2*step:max-step-step/2] ) {
                translate( [ -insert-play, i-play, 0 ] ) {
                    children(0);
                };
            };
        };
        for( i=[step/2:2*step:max-step-step/2] ) {
            translate( [ 0, i+play, 0 ] ) {
                children(1);
            };
        };
    };
};

module LeftRight( apart=5, step=10, insert=20, height=5, play=0.5, max=100 ) {
    translate( [ apart, 0, 0 ] )
    Right( step=step, insert=insert, height=height, play=play, max=max ) {
        // According to this thread:
        // http://forum.openscad.org/Operator-problem-tp25984p25989.html
        // this works, but only if the children are passed in separately
        children(0);
        children(1);
        children(2);
    }

    translate( [ -apart, 0, 0 ] )
    Left( step=step, insert=insert, height=height, play=play, max=max ) {
        children(0);
        children(1);
        children(2);
    }
};
