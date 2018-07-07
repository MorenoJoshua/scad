module aro(r, th) {
    difference(){
        circle(r);
        circle(r-(th));
    }
}
module rc(a) {
    rotate(a) children();
    children();
}
module c(color)color(color)children();
th = 4;
r = 20;
union(){
    c("gray")translate([r*0.4,r*1.32]) linear_extrude(2) aro(6, 2);
    c("salmon") linear_extrude(3) aro(r, th);
    c("red") linear_extrude(5) union(){
        square([r, th], true);
        rc([0, 0, 180])
            translate([r*0.4, 0])
                rotate([0, 0, 90]) translate([r* 0.3, 0]) square([r * 1.7, th], true);
    }
}
