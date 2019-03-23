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
