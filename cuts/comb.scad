module Combs( apart=5, step=10, insert=20, height=5, play=0.5, max=100 ) {
    translate( [ apart, 0, 0 ] ) {
        Comb_right( step=step, insert=insert, height=height, play=play, max=max ) {
            children(0);
        };
    };
    translate( [ -moveApart, 0, 0 ] ) {
        Comb_left( step=step, insert=insert, height=height, play=play, max=max ) {
            children(0);
        };
    };
};

module Comb_right( step=10, insert=20, height=5, play=0.5, max=100 ) {
    union() {
        difference() {
            // positive quadrant of all axes only
            intersection() {
                children(0);
                cube( [ max, max, max ] );
            };
            for( i=[step/2:2*step:max-step-step/2] ) {
                translate( [ 0, i-play, 0 ] ) {
                    cube( [ insert+play, step+2*play, height ] );
                };
            };
        };
        for( i=[step+step/2:2*step:max-step-step/2] ) {
            translate( [ -insert+play, i+play, 0 ] ) {
                cube( [ insert-play, step-2*play, height ] );
            };
        };
    };
};

module Comb_left( step=10, insert=20, height=5, play=0.5, max=100 ) {
    union() {
        difference() {
            // negative x, positive y and z quadrant only
            intersection() {
                children(0);
                translate( [ -max, 0, 0 ] ) {
                    cube( [ max, max, max ] );
                };
            };
            for( i=[step+step/2:2*step:max-step-step/2] ) {
                translate( [ -insert-play, i-play, 0 ] ) {
                    cube( [ insert+play, step+2*play, height ] );
                };
            };
        };
        for( i=[step/2:2*step:max-step-step/2] ) {
            translate( [ 0, i+play, 0 ] ) {
                cube( [ insert-play, step-2*play, height ] );
            };
        };
    };
};
