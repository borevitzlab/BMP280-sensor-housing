
// Housing for 

module sensor(){
cube([13,10.4,1.6]);
}

module sensor_rail(){
difference(){
    translate([-1,-1,-1]) cube([13,12.4,3.6]);
    union(){
        translate([0,1.5,-2]) cube([15,7.4,5.6]);
    sensor();
    }
}
}

module pipe_holder(){
    
}

sensor_rail();