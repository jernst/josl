module LeftRight( apart=10, minX=-200, maxX=200, minY=-200, maxY=200, minZ=-200, maxZ=200, play=.1, y=[] ) {
    yy = len(y) == 0 ? [ minY : ( maxY - minY ) / 10 : maxY ] : y;

    translate( [ apart/2, 0, 0 ] )
    Right( minX=minX, maxX=maxX, minY=minY, maxY=maxY, minZ=minZ, maxZ=maxZ, y=yy, play=play ) {
        children(0);
        children(1);
    };

    translate( [ -apart/2, 0, 0 ] )
    Left( minX=minX, maxX=maxX, minY=minY, maxY=maxY, minZ=minZ, maxZ=maxZ, y=yy, play=play ) {
        children(0);
        children(1);
    };
};

module Right( minX, maxX, minY, maxY, minZ, maxZ, y, play ) {
    difference() {
        intersection() {
            children(0);
            translate( [ 0, minY, minZ ] ) {
                cube( [ maxX, maxY - minY, maxZ - minZ ] );
            }
        };

        for( yy=y ) {
            translate( [ 0, yy, minZ ] ) {
                minkowski() {
                    linear_extrude( height = maxZ - minZ ) {
                        children(1);
                    };
                    sphere( r=play );
                }
            }
        }
    }
}

module Left( minX, maxX, minY, maxY, minZ, maxZ, y, play ) {
    difference() {
        children(0);
        difference() {
            translate( [ 0, minY, minZ ] ) {
                cube( [ maxX, maxY - minY, maxZ - minZ ] );
            };

            for( yy=y ) {
                translate( [ 0, yy, minZ ] ) {
                    linear_extrude( height = maxZ - minZ ) {
                        children(1);
                    }
                }
            }
        }
    }
}
