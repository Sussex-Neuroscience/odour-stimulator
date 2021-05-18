/////////////////////////////////////
//  Y connectors for tubing system //
//      of odour stimulator        //
//         CC BY SA 4.0            //
//    BY AM CHAGAS 20210507        //
/////////////////////////////////////

tubeInnerDia = 1.2;
tubeOuterDia = 2.9;
tubeLen = 15;
tol = 0.1;
$fn=30;

module y(innerDia=tubeInnerDia,length=tubeLen){
    translate([0,0,-length]){
        cylinder(d=innerDia,h=length+1);
    }//end translate
    rotate([0,45,0]){
        cylinder(d=innerDia,h=length);
    }//end rotate

    rotate([0,-45,0]){
    cylinder(d=innerDia,h=length);
    }//end rotate
    
}//end module




difference(){
y(innerDia=tubeOuterDia,length=tubeLen);
y(length=tubeLen+2);


}//end differece