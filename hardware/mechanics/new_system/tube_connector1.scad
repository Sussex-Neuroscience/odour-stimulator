tube1InnerDia = 5;
tube1OutDia = 8;
tube1FitLen = 25;

tube2InnerDia = 1.5;
tube2OutDia = 3;
tube2FitLen = 10;

tol = 0.1;

$fn=60;

difference(){
cylinder(d2= tube1InnerDia-1,d1 =tube1InnerDia+0.5,h=tube1FitLen);

translate([0,0,-1]){
cylinder(d2 = tube1InnerDia-2,d1 =(tube1InnerDia-1)+2*tol,h=tube1FitLen+2);
}//end translate
}//end difference




translate([0,0,0.2]){
rotate([180,0,0]){

difference(){
    union(){
cylinder(d1= tube2OutDia,d2=tube2OutDia-0.5,h=tube2FitLen);
translate([-tube1OutDia/2,-tube1OutDia/2,]){
    cube([tube1OutDia,tube1OutDia,1]);
}//end translate
}//end union
translate([0,0,-0.25]){
cylinder(d2 = tube2InnerDia,d1 =tube2InnerDia,h=tube2FitLen+0.5);
}//end translate
}//end difference
}//end rotate
}