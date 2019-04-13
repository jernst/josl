module LeftRight( apart, minX, maxX, minY, maxY, minZ, maxZ, y ) {
    yy = len(y) == 0 ? [ minY : ( maxY - minY ) / 10 : maxY ] : y;

    echo( "y=", y, "yy=", yy );

    translate( [ apart/2, 0, 0 ] )
    Right( minX=minX, maxX=maxX, minY=minY, maxY=maxY, minZ=minZ, maxZ=maxZ, y=yy ) {
        children(0);
        children(1);
    };

    translate( [ -apart/2, 0, 0 ] )
    Left( minX=minX, maxX=maxX, minY=minY, maxY=maxY, minZ=minZ, maxZ=maxZ, y=yy ) {
        children(0);
        children(1);
    };
};

module Right( minX, maxX, minY, maxY, minZ, maxZ, y ) {
    difference() {
        intersection() {
            children(0);
            translate( [ 0, minY, minZ ] ) {
                cube( [ maxX, maxY - minY, maxZ - minZ ] );
            }
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

module Left( minX, maxX, minY, maxY, minZ, maxZ, y ) {
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
