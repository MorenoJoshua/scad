module sq(m, cx = true, cy = true){
  translate([
    cx ? -m[0] / 2 : 0,
    cy ? -m[1] / 2 : 0,
  ])
  square(m);
}
module clone_around(t){
  for(i=[0:360/t:359.9999]) {
    rotate([0, 0, i]) children();
  }
}
module star_like(s, a){
      clone_around(3) sq(a, false, true);
}


module pattern(sx, sy, ax, ay){
  echo(round(ax/sx));
  for(x = [0:1:ax/sx]){
    translate([sx * x, 0])
    for(y = [0:1:ay/sy]){
      translate([0, sy * y]) children();
    }
  }
}
module join(){union()children();}
x = 10;
y = 1;



linear_extrude(0.4)
join() {
  pattern(30, 16.83, 100, 115)
  clone_around(6)
  translate([-x, 0]) star_like(3, [x, y]);
}