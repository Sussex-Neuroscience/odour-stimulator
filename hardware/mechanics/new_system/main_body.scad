
//cc = centralchamber
ccDia = 5;
ccLen = 5;
ccExitDia = 2;
ccExitLen = 2;

glass1Dia = 7.95;
glass1DiaRim = glass1Dia+4;
glass1Len = 20;
glass2Dia = 7;
glass2Len = 20;

blockDia = 25;
blockLen = 40;

longChanLen = 20;//15;
longChanDia = 2;//2.9+0.1;

shortChanLen = 8;//valve protusions are 6.33mm
centralChanLen = blockDia/2+1;

valveFitDia = 2;//2.03;
interValveDis = 4.19;

blockHolderx = 20;
blockHoldery = blockDia/2;
blockHolderz = 10;

tol = 0.1;
$fn = 60;

////////modules//////////////////////////

module central_chamber(){
//central part of the chamber
cylinder(d=ccDia+2*tol,h=ccLen);

//exit bottom
translate([0,0,-ccExitLen]){
cylinder(d2=ccDia+2*tol,d1=ccExitDia+2*tol,h=ccExitLen);}

translate([0,0,-2*ccExitLen]){
cylinder(d1=glass2Dia+2*tol,d2=ccExitDia+2*tol,h=ccExitLen);
    }//end translate

translate([0,0,-2*ccExitLen-glass2Len]){
cylinder(d1=glass2Dia+2*tol,d2=glass2Dia+2*tol,h=glass2Len);
    }//end translate

//exit top
union(){
translate([0,0,ccLen]){
cylinder(d1=ccDia+2*tol,d2=ccExitDia+2*tol,h=ccExitLen);}

translate([0,0,ccLen+ccExitLen]){
cylinder(d2=glass1Dia+2*tol,d1=ccExitDia+2*tol,h=ccExitLen);
    }//end translate
}//end union

translate([0,0,ccLen+2*ccExitLen]){
cylinder(d2=glass1Dia+2*tol,d1=glass1Dia+2*tol,h=glass1Len);
    }//end translate

}//end module






module valve_fit2(){

////////////// valve entries ////////////////////////////////////////
    rotate([0,0,45]){
    union(){
    for (i=[0:1:2]){
       
            if (i==0){
                cylinder(d=valveFitDia+2*tol,h=centralChanLen,center=true);
            }//end if
            else{
                translate([interValveDis*i,0,-(centralChanLen-shortChanLen)/2]){
                    cylinder(d=valveFitDia+2*tol,h=shortChanLen,center=true);
                    }//end translate
                }//end else
    
        }//end for
    }//end union
}//end rotate
/////////////////// tubing entries ///////////////////////////
    rotate([90,0,0]){
    union(){
    //for (i=[2:2]){    
    //    translate([i*interValveDis*sin(45),0,-i*interValveDis*sin(45)+(valveFitDia/2-longChanLen)/2]){
    //        cylinder(d=valveFitDia+2*tol,h=longChanLen,center=true);
    //        }//end translate

    //    }//end for
        rotate([-5,2.5,0]){
        translate([interValveDis*sin(47.5),0,(-interValveDis-longChanLen/2)*sin(47.5)-1]){
            cylinder(d1=valveFitDia+2*tol,d2=valveFitDia+2*tol,h=longChanLen-4,center=true);
            }//end translate
            
        }//rotate
        
        rotate([-5,2.5,0]){
        translate([interValveDis*sin(47.5),0,(-interValveDis-longChanLen/2)*sin(47.5)-7]){
            cylinder(d1=longChanDia+2*tol,d2=longChanDia+2*tol,h=longChanLen,center=true);
            }//end translate
            
        }//rotate

        rotate([-5,-5,0]){
        translate([2*interValveDis*sin(40),0,(-longChanLen-2*interValveDis)*sin(40)+2.5]){
            cylinder(d1=valveFitDia+2*tol,d2=valveFitDia+2*tol,h=longChanLen-11,center=true);
            }//end translate
            
        }//rotate
        
                rotate([-5,-5,0]){
        translate([2*interValveDis*sin(40),0,(-longChanLen-2*interValveDis)*sin(40)-5]){
            cylinder(d1=longChanDia+2*tol,d2=longChanDia+2*tol,h=longChanLen,center=true);
            }//end translate
            
        }//rotate
        
        
    }//end union 
}//end rotate

}// end module





////////////////////////////////////////////

difference(){ 
    union(){
    translate([-blockDia/2,-blockDia/2,-5]){
    cube([blockDia,blockDia, blockLen]);
    }//end translate
    translate([0,0,-(glass1Len)/2]){
    cylinder(d=glass1DiaRim,h=20);
    }//end translate
    
    //block holder
    translate([blockDia/2,0,blockLen-blockHolderz-5]){
    cube([blockHolderx,blockHoldery,blockHolderz]);
    }//end translate
}//end union

    translate([0,0,12]){
    central_chamber();
    }//end translate



translate([0,5,14]){
    rotate([90,0,0]){
    union(){    
    translate([0,0,-0.9]){
    valve_fit2();
    }

    translate([00,0,blockDia/2-1.7]){
        rotate([180,0,180]){
        valve_fit2();
        }//end rotate
    }//end translate

    translate([shortChanLen-2,-0,5]){
        rotate([0,-90,0]){
        valve_fit2();
        }//end rotate
    }//end translate

    translate([-shortChanLen+2.1,-0,5]){
        rotate([0,90,0]){
        valve_fit2();
        }//end rotate
    }//end translate

}//end union

}//end rotate
}//end translate


//translate([-3.8,-blockDia/2-1,-15]){
//    cube([blockDia+10,blockDia+2,blockLen+15]);
//    }//end translate



}//end difference



//valve_fit2();



//////////////// legacy /////////////////////////


/*
module valve_fit(tubes=0){

    cylinder(d=valveFitDia+2*tol,h=centralChanLen,center=true);

    translate([interValveDis,0,-(centralChanLen-shortChanLen)/2]){
        
        cylinder(d=valveFitDia+2*tol,h=shortChanLen,center=true);
        rotate([90,0,0]){
            if(tubes==1){
                translate([0,(shortChanLen-valveFitDia)/2,-blockLen-0]){
                tubing(d1 = longChanDia, d2=longChanDia-1+2*tol);
                }//end translate
                }//end if
            translate([0,(shortChanLen-valveFitDia)/2,-longChanLen/2+valveFitDia/10]){
                
                cylinder(d=longChanDia+2*tol,h=longChanLen,center=true);
            }//end translate
        }//end rotate
    }//end translate

translate([2*interValveDis,0,-(centralChanLen-shortChanLen)/2]){
    cylinder(d=valveFitDia+2*tol,h=shortChanLen,center=true);
    rotate([-90,0,0]){
        translate([0,-(shortChanLen-valveFitDia)/2,longChanLen/2-valveFitDia/10]){
            cylinder(d=longChanDia+2*tol,h=longChanLen,center=true);
        }//end translate
    }//end rotate
    
}//end translate

}// end module


module tubing(d1 = 5, d2 = 3, he= 10){
    difference(){
    cylinder(d = d1,h=he);
        translate([0,0,-0.5]){
            cylinder(d = d2, h = he +1);
        }//end translate
        }//end difference
    }//end module tubing

*/
