
tubeD = 2;
tubeH = 10;

valveFitDia = 2;//2.03;
interValveDis = 4.19;

blockDia = 80;
blockLen = 40;

shortChanLen = 8;//valve protusions are 6.33mm
centralChanLen = blockDia/2+1;
exitLen=20;



tol = 0.1;




$fn =20;


module valve_fit(){
   
    for (i=[0:1:2]){
        if (i==0){
            cylinder(d=valveFitDia+2*tol,h=centralChanLen);
            translate([0,0,centralChanLen-valveFitDia/2]){
        rotate([90,0,0]){
        cylinder(d=valveFitDia+2*tol,h=centralChanLen);
        }//end rotate
         }//end translate   
            }//end if
        else{
            translate([interValveDis*i,0,0]){
                cylinder(d=valveFitDia+2*tol,h=shortChanLen);
                }//end translate
                translate([interValveDis*i,0,shortChanLen-valveFitDia/2]){
        rotate([45,180,0]){
        cylinder(d=valveFitDia+2*tol,h=exitLen);
        }//end rotate
    }//end transalte
            }//end else
        }//end for
        
    
}// end module
/*

cylinder(d=tubeD+5,h=tubeH);



for (i = [0:36:360]){
    translate([0,0,tubeH-1]){
    rotate([0,45,i]){
    cylinder(d=tubeD,h=tubeH*3);
    }//end rotate
}//end translate

}//end for

*/


module main_body(){
    cylinder(d=10,h=100);
    for (i = [5:10:100]){
        translate([0,0,i]){
    rotate([0,90,0]){
    cylinder(d=tubeD,h=tubeH*3);
    }
}
        }
    
    }//end module
    
//difference(){
translate([0,-25,0]){
rotate([90,-10,0]){
    cylinder(d1=65,d2=55,h=5,$fn=10);
}
}
    

   for (i = [0:36:360]){ 
    rotate([-45,i,0]){
        translate([0,-0,-centralChanLen+valveFitDia/2]){

         valve_fit();
        }
    }
}
//}//end difference

//valve_fit();
