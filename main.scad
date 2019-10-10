
// Housing for BME/BMP280 temperature/humidity/pressure sensor
// Developed for Australian Plant Phenomics Facility, ANU node

fudge=0.2;
fudge_adj=fudge/2;
$fn=64;

module sensor(){
cube([13+fudge, 10.4+fudge, 1.6+fudge]);
}

module sensor_ring(){
    inner=4.0;
    outer=2;
    difference(){
        cylinder(1,inner+outer,inner+outer);
        translate([0,0,-fudge_adj]) cylinder(2,inner+fudge,inner+fudge);
    }
}

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
    difference(){
        cylinder(4,7,7);
        translate([0,0,-0.5]) cylinder(5,6,6);
    }
}

sensor_ring();