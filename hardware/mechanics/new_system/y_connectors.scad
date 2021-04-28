tubeInnerDia = 2;
tubeLen = 15;

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
y(innerDia=tubeInnerDia+1,length=tubeLen);
y(length=tubeLen+2);


}//end differece