// system to hold rotameters and pressure controller of the odour stimulator



//printing tolerance
//should be changed depending on printer
tol = 0.1;

//thorlabs plate (25X30cm)

thorx = 250;
thory = 300;
thorz = 10;

//thorlabs plate holes (square grid of M6 tapped holes)
screwd=6;
screwh=thorz+5;
screwspace = 24.8;
screwoffset = 9.3;

//rotameter 
////base
rotx = 28.32;
roty = 31.88;
rotz = 38;
frontwall = 15;
rotwall = 4;

////screw in connector
connd = 13.6;
connh = 19.15;

//digital pressure controller
digx = 26.75;
digy = 91.42;
digz = 20;
digscrewoffset = 31.28;
digwall = 4;



module plate(){
    difference(){
    cube([thorx,thory,thorz]);
    for (j = [screwoffset+screwd/2:screwspace:thory-screwoffset]){ 
        for (i = [screwoffset+screwd/2:screwspace:thorx-screwoffset]){ 
            translate([i,j,-2]){
                cylinder(d=screwd,h=screwh);
            }//end translate
        }//end i for loop
    }//end j for loop
}//end differnce
}//end plate
    
    
//plate();    


module rotameter(){

basex = 2*screwspace+rotx+rotwall;
basey = 2*screwspace+roty+rotwall;
basez = 2;
difference(){
    union(){
cube([basex,basey,basez]);
    translate([(basex-rotx-rotwall)/2,(basey-roty-rotwall)/2,basez]){
        difference(){
            cube([rotx+rotwall,roty+rotwall,rotz+rotwall]);
            translate([2,2,1]){
                cube([rotx+2*tol,roty+2*tol,rotz+5]);
            }//end translate
            translate([-1,(roty+rotwall-connd)/2,0]){
                cube([rotwall+4,connd,connh+10]);
            }//end translate
            translate([rotx,rotwall/2,frontwall+1]){
                cube([10,roty,rotz+rotwall-frontwall]);
            }//end translate
                }//end difference
        
        
    }//end translate
}//end union
    translate([5,5,-basez]){
        cube([basex-10,screwd+2*tol,5]);
        }//end translate
    translate([5,5,-basez]){
        cube([screwd+2*tol,basey-10,5]);
    }//end translate
}// end difference
}//end rotameter



module digitalpressure(){
difference(){
cube([digx+digwall,digy+digwall,digz]);
translate([digwall/2,digwall/2,digwall/2]){
cube([digx+2*tol,digy+2*tol,digz]);

}//end translate
translate([digwall/2,-2,5]){
cube([digx+2*tol,digy+digwall+5,digz]);
}//end translate
}//end difference
difference(){
cube([digx+digwall+20,digy+digwall,digwall/2]);
translate([digx+digwall+8,5,-10]){
    cube([screwd+2*tol,digy+digwall-10,30]);
}//end translate
}//end difference
}//end digital pressure

plate();
translate([99+screwoffset/2,screwoffset/2,thorz]){
rotameter();
}//end translate
translate([15+screwoffset/2,screwoffset/2,thorz]){
digitalpressure();
}//end translate
