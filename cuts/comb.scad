use <leftright.scad>

module Combs( apart=5, step=10, insert=20, height=5, play=0.5, max=100 ) {
    LeftRight( step=step, insert=insert, height=height, play=play, max=max ) {
        cube( [ insert+play, step+2*play, height ] );
        cube( [ insert-play, step-2*play, height ] );
        children(0);
    };
};
