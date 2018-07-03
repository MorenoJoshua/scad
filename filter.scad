r = 4;
th = 0.8;

off = 0.3;
//rotate_extrude(20, 40)

module rc(a){
  children();
  rotate([0, 0, a]) children();
  
}

linear_extrude(15, twist=360, slices=360/16)

offset(off) offset(-off, $fn = 32)
rc(180)
difference(){
$fn = 32;
union(){
  intersection() {
    difference() {
      circle(r);
      circle(r - th);
    }
    translate([0, -(r*2)])square([r * 2, r * 4]);
  }
  translate([0, (r- (th/2))/2 ])
    rotate([0, 0, 180]) intersection(){
    difference() {
      circle((r+(th/2))/2);
      circle(((r+(th/2)) / 2)- th);
    }
    translate([0, -(r*2)])square([r * 2, r * 4]);
  }
}

intersection(){

offset(1)
rotate([0, 0, 180])
offset(off) offset(-off)
union(){
  intersection() {
    difference() {
      circle(r);
      circle(r - th);
    }
    translate([0, -(r*2)])square([r * 2, r * 4]);
  }
  translate([0, (r- (th/2))/2 ])
    rotate([0, 0, 180]) intersection(){
    difference() {
      circle((r+(th/2))/2);
      circle(((r+(th/2)) / 2)- th);
    }
    translate([0, -(r*2)])square([r * 2, r * 4]);
  }
}
translate([1, -3.3]) circle(2);

}
}