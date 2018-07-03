bit = 5.5; // bit size (exterior)
bits = 6; // bit sides
s = 10; // desired bit indentation


// pretty-fy
 intersection(){
    // geary exterior
    color("red") difference(){
        linear_extrude(s+4)
            // pretty teeth
            minkowski(){
                // sharp teeth
                union(){
                    for(i = [0:360/s:359.99]){
                        // pointy triangle
                        rotate([0, 0, i])translate([bit,0]) scale([0.6, 0.5]) circle(bit/2, $fn=3);
                    }
                    circle(bit, $fn = s);
                }
                circle(0.5, $fn=s);
            }
        // bit part
        linear_extrude(10) circle(bit/2, $fn=6);
    }
    // low poly sphere for general shape
    translate([0, 0, bit + 0.5])
        sphere(bit + 3, $fn = s);
}