tol = 0.1;
flowConnDia = 17.65;
flowConnLen = 12;
bridgeH = 10;
tube1Dia = 3;
tube1Len = flowConnLen+8;
tube2Dia = 6;
tube2Len = flowConnLen+8;

$fn = 45; 

module connector(flowMeterDia = 20, flowMeterLen = 10,
        tubeDia = 3, tubeLen = 20){

difference(){
    union(){
    cylinder(d=flowMeterDia+3,h=flowMeterLen);
    translate([0,0,flowMeterLen]){
        cylinder(d1=flowMeterDia+3,d2=tubeDia-2,h=bridgeH,flowMeterLen);
        }//end translate
    translate([0,0,flowMeterLen]){
        cylinder(d=tubeDia,h=tubeLen);
        }//end translate
    }//end union

    translate([0,0,flowMeterLen-0.01]){
        cylinder(d1=flowMeterDia,d2=tubeDia-1,h=bridgeH);
        }//end translate
        translate([0,0,-2]){
        cylinder(d=flowMeterDia+2*tol,h=flowMeterLen+2);
        cylinder(d=tubeDia-1,h=flowMeterLen+bridgeH+tubeLen);
        }//end translate
        
    }//end difference
    
}


connector(flowMeterDia = flowConnDia, flowMeterLen = flowConnLen, tubeDia = tube1Dia, tubeLen = tube1Len);

translate([20,20,0]){
connector(flowMeterDia = flowConnDia, flowMeterLen = flowConnLen, tubeDia = tube2Dia, tubeLen = tube2Len);
    
}//end translate
