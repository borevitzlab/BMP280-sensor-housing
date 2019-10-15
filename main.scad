
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
    ring(13,12,4);
}

module pipe_holder(){
    ring(18,16.5,4);
}

module circle_line(){
    translate([4,0,0]) difference(){
        ring(10,9,4);
        rotate([0,0,35]) translate([-5,-4,-fudge]) cube([15,15,5]);
    }
}

module circle_lines(num){
    function angle(i,num)=i*(360/num); // evenly spread arms in a circle
    for(i=[1:num]){
        // add an arm each rotation
        rotate([0,0,angle(i,num)])
        circle_line();
    }
}

union(){
    translate([0,3.5,29]) rotate([0,90,0]) sensor_ring();
    translate([-1,6,0]) cube([2,1,30]);
}

union(){
    translate([0,0,0]) circle_lines(7);
    pipe_holder();
    difference(){
        cable_holder();
        //translate([-7,-13,-1]) cube([15,15,6]);
    }
}
