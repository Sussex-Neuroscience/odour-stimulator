basex = 33;
basey = 36;
basez = 20;



difference(){
cube([basex+10,basey+10,basez]);
translate([5,5,2]){
cube([basex,basey+10,basez+5]);
}
}
//translate([-10,-10,0]){
cube([basex+30,basey+20,5]);
}