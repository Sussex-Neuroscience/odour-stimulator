
tubeD = 10;
sectionL = 15;
$fn=30;
tol=0.1;
difference(){
    translate([0,0,2.5]){
%cylinder(d=tubeD+10,h=4*sectionL-5);
    }
union(){
cylinder(d=tubeD,h=sectionL);

translate([0,0,sectionL]){
cylinder(d1=tubeD,d2=2,h=sectionL);
    }
    
translate([0,0,2*sectionL]){
cylinder(d1=2,d2=tubeD,h=sectionL);
    }
    
translate([0,0,3*sectionL]){
cylinder(d=tubeD,h=sectionL);
    }


translate([-0.5,0,2*sectionL]){
    rotate([0,90,0]){    
        cylinder(d=1,h=30);
    }//end rotate
    }//end translate

}//end union
}//end difference


cylinder(d=tubeD-2*tol,h=4);
