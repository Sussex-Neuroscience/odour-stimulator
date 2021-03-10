
//cc = centralchamber
ccDia = 5;
ccLen = 5;
ccExitDia = 2;
ccExitLen = 2;

glass1Dia = 7;
glass1Len = 10;
glass2Dia = 10;
glass2Len = 10;

valveFitDia = 2.03;
interValveDis = 4.19;

tol = 0.1;
$fn = 60;
module central_chamber(){
//central part of the chamber
cylinder(d=ccDia,h=ccLen);

//exit bottom
translate([0,0,-ccExitLen]){
cylinder(d2=ccDia,d1=ccExitDia,h=ccExitLen);}

translate([0,0,-2*ccExitLen]){
cylinder(d1=glass2Dia,d2=ccExitDia,h=ccExitLen);}

//exit top
union(){
translate([0,0,ccLen]){
cylinder(d1=ccDia,d2=ccExitDia,h=ccExitLen);}

translate([0,0,ccLen+ccExitLen]){
cylinder(d2=glass1Dia,d1=ccExitDia,h=ccExitLen);}
}//end union
}//end module

/*
for (i=[0:90:360]){
    echo(i);
translate([0,0,ccLen/2]){
rotate([i,90,0]){
cylinder(d=valveFitDia+2*tol,h=50);}
}
}
*/

//central_chamber();
//translate([0,-0,-25]){
//%cylinder(d=40,h=50);}

module valve_fit(){
union(){
    cylinder(d=valveFitDia,h=5);
    rotate([90,0,0]){
        translate([0,valveFitDia/2,0]){
            cylinder(d=valveFitDia,h=10);
        }//end translate
    }//end translate
}// end union
translate([-interValveDis,0,0]){
union(){
    cylinder(d=valveFitDia,h=5);
    rotate([90,0,0]){
        translate([0,valveFitDia/2,0]){
            cylinder(d=valveFitDia,h=10);
        }//end translate
    }//end translate
}// end union
}//end translate

translate([interValveDis,0,0]){
union(){
    cylinder(d=valveFitDia,h=5);

}// end union
}//end translate

}//end module

translate([0,0,0]){valve_fit();}
rotate([0,0,180]){
translate([0,-10,0]){valve_fit();}
}