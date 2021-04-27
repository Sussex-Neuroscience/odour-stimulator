tol = 0.1;
flowConnDia = 17.65;
flowConnLen = 12;
bridgeH = 10;
tubeDia = 3;
tubeLen = flowConnLen+8;

$fn = 45; 
difference(){
    union(){
    cylinder(d=flowConnDia+3,h=flowConnLen);
    translate([0,0,flowConnLen]){
        cylinder(d1=flowConnDia+3,d2=tubeDia-2,h=bridgeH,flowConnLen);
        }//end translate
    translate([0,0,flowConnLen]){
        cylinder(d=tubeDia,h=tubeLen);
        }//end translate
    }//end union

    translate([0,0,flowConnLen-0.01]){
        cylinder(d1=flowConnDia,d2=tubeDia-1,h=bridgeH);
        }//end translate
        translate([0,0,-2]){
        cylinder(d=flowConnDia+2*tol,h=flowConnLen+2);
        cylinder(d=tubeDia-1,h=flowConnLen+bridgeH+tubeLen);
        }//end translate
        
    }//end difference