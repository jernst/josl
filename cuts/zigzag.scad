use <leftright.scad>

module ZigZag( apart=5, step=10, insert=20, height=5, ratio=0.4, play=0.5, max=100 ) {
    translate( [ apart, 0, 0 ] )
    Right( step=step, insert=insert, height=height, play=play, max=max ) {
        linear_extrude( height=height ) {
            polygon( points=[
                    [ 0, 0 ],
                    [ insert+play, (step+2*play)*ratio ],
                    [ insert+play, (step+2*play)*(1-ratio) ],
                    [ 0, step+2*play ]
            ] );
        }
        linear_extrude( height=height ) {
            polygon( points=[
                    [ insert-play, 0 ],
                    [ 0, (step-2*play)*ratio ],
                    [ 0, (step-2*play)*(1-ratio) ],
                    [ insert-play, step-2*play ]
            ] );
        }
        children();
    };

    translate( [ -apart, 0, 0 ] )
    Left( step=step, insert=insert, height=height, play=play, max=max ) {
        linear_extrude( height=height ) {
            polygon( points=[
                    [ insert+play, 0 ],
                    [ 0, (step+2*play)*ratio ],
                    [ 0, (step+2*play)*(1-ratio) ],
                    [ insert+play, step+2*play ]
            ] );
        }
        linear_extrude( height=height ) {
            polygon( points=[
                    [ 0, 0 ],
                    [ insert-play, (step-2*play)*ratio ],
                    [ insert-play, (step-2*play)*(1-ratio) ],
                    [ 0, step-2*play ]
            ] );
        }
        children();
    }
};
