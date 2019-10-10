
// Housing for 

module sensor(){
cube([13,10.4,1.6]);
}

module sensor_rail(){
difference(){
    translate([0.5,-1,-1]) cube([11,12.4,3.6]);
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

union(){
translate([0.5,-5.25,2]) rotate([0,-90,0]) sensor_rail();
pipe_holder();
}