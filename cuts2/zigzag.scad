use <leftright.scad>

module ZigZag( apart=10, minX=-200, maxX=200, minY=-200, maxY=200, minZ=-200, maxZ=200, play=.1, y=[] ) {
    LeftRight( apart, minX, maxX, minY, maxY, minZ, maxZ, y=y, play=play ) {
        children(0);

        polygon( points=[
                [ 0, 0 ],
                [ 10, 5 ],
                [ 0, 10 ],
                [ 0, 0 ]
        ] );
    };
};