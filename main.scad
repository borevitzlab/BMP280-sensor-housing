
// Housing for BME/BMP280 temperature/humidity/pressure sensor
// Developed for Australian Plant Phenomics Facility, ANU node

fudge=0.2;
fudge_adj=fudge/2;
$fn=64;

pipe_diameter_inner=18;

module sensor(){
cube([13+fudge, 10.4+fudge, 1.6+fudge]);
}

module ring(od, id, height){
    difference(){
        cylinder(height,od,od);
        translate([0,0,-fudge_adj]) cylinder(height+fudge,id,id);
    }
}

module sensor_ring(){
    inner=4.0/2;
    outer=2/2;
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

module pipe_holder(){
    ring(7,6,4);
}


translate([0,3.5,29]) rotate([0,90,0]) sensor_ring();
translate([-1,6,0]) cube([2,1,30]);

difference(){
    pipe_holder();
    //translate([-7,-13,-1]) cube([15,15,6]);
}