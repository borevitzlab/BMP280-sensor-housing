
// Housing for BME/BMP280 temperature/humidity/pressure sensor
// Developed for Australian Plant Phenomics Facility, ANU node


/* [Settings:] */ 

// adjustment for rounding error
fudge=0.2; // [0.1:0.05:0.5]

// curve resolution
$fn=32; // [32, 64, 128, 256]

// Diameter of the largest bit
//pipe_diameter_inner=18;

// Number of arms connecting cable and pipe holder
//n_arms = 7; // [1:1:30]

// Adjust position of connector arms
//arm_adjustment = 10; //[0:1:180]

// Select part
//part = "all"; // [all, base ring, sensor mount]

/* [Hidden] */ 
// Derived variables and constants
fudge_adj=fudge/2;

module sensor(){
cube([13+fudge, 10.4+fudge, 1.6+fudge]);
}

module ring(od, id, height){
    difference(){
        cylinder(height,od/2,od/2);
        translate([0,0,-fudge_adj]) cylinder(height+fudge,id/2,id/2);
    }
}

module sensor_ring(){
    inner=4.0;
    outer=2;
    ring(inner+outer, inner+fudge, 1);
}

// depreciated
module sensor_rail(){
difference(){
    translate([fudge,-1+fudge_adj,-1+fudge_adj]) cube([11,12.4,3.6]);
    union(){
        translate([-2,1.5,-2]) cube([15,7.4,5.6]);
        sensor();
    }
}
}

module cable_holder(){
    //ring(13,12,4);
    thickness=1;
    id1=12;
    id2=2;
    od1=id2+thickness;
    od2=id1+thickness;
    height=12;
    difference(){
        cylinder(height,od1/2,od2/2);
        translate([0,0,-fudge_adj]) cylinder(height+fudge,id2/2,id1/2);
    }
}

module pipe_holder(){
    ring(13,11,8);
}

module circle_line(){
    translate([3.5,0,1]) difference(){
        ring(10,9,4);
        rotate([0,0,20]) translate([-5,-3.5,-fudge]) cube([15,15,5]);
    }
}

module circle_lines(num){
    function angle(i,num)=i*(360/num)+arm_adjustment; // evenly spread arms in a circle
    for(i=[1:num]){
        // add an arm each rotation
        rotate([20,0,angle(i,num)])
        circle_line();
    }
}

module sensor_mount_ring(){
    color("DeepSkyBlue") union(){
        translate([0,2.5,34]) rotate([0,90,0]) sensor_ring();
        translate([-1,5.2,4.2]) cube([2,1,30]);
    }
}

module base_bracer(){
    color("orange") union(){
        //translate([0,0,0]) circle_lines(n_arms);
        pipe_holder();
        translate([0,0,-12]) cable_holder();
    }
}

sensor_mount_ring();
base_bracer();

//if((part=="all")||(part=="base ring")){
//    difference(){
//        base_bracer();
//        union(){
//            translate([fudge,-fudge,0]) sensor_mount_ring();
//            translate([-fudge,-fudge,0]) sensor_mount_ring();
//        }
//    }
//}
//
//if((part=="all")||(part=="sensor mount")){
//    sensor_mount_ring();
//}
