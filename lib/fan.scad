/*
    This file is part of SBC Case Builder https://github.com/hominoids/SBC_Case_Builder
    Copyright 2022,2023,2024 Edward A. Kisiel hominoid@cablemi.com

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>
    Code released under GPLv3: http://www.gnu.org/licenses/gpl.html

    fan_cover(size, thick)
    fan_mask(size, thick, style)

*/

/*
           NAME: fan_cover
    DESCRIPTION: creates fan covers for fan openings
           TODO: none

          USAGE: fan_cover(size, thick)

                           size = size of fan
                          thick = thickness of cover
*/

module fan_cover(size, thick) {
    difference() {
        color("grey", 1) slab([size, size, thick], 3);
        color("grey", 1) fan_mask(size, thick, 2);
    }
}


/*
    DESCRIPTION: creates heatsink masks for openings
           TODO: 

          USAGE: heatsink_mask(size, thick, style)

                               size = size of fan
                              thick = thickness of cover
                              style = 0="fan_open", 1="fan_1", 2="fan_2", 3"fan_hex"
*/

module fan_mask(size, thick, style) {

    hole_pos = size == 30 ? 3 :
        size == 40 ? 4 :
        size == 50 || size == 60 || size == 70 ? 5 :
        size >= 80 ? 3.75 : 3.75;
    $fn = 90;
    adj = .01;

    if(style == 0) {
        
        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-1);
        // mount holes
        translate([size-hole_pos, size-hole_pos, -1]) cylinder(h=thick+2, d=3);
        translate([size-hole_pos, hole_pos, -1]) cylinder(h=thick+2, d=3);
        translate([hole_pos, size-hole_pos, -1]) cylinder(h=thick+2, d=3);
        translate([hole_pos, hole_pos, -1]) cylinder(h=thick+2, d=3);
    }
    if(style == 1 && size == 30) {
        
        union() {
            difference() {
                union () {
                    difference() {
                        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-2);
                        translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-8);
                    }
                    difference() {
                        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-11);
                        translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-17);
                    }
                    difference() {
                        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-20);
                        translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-25);
                    }
                    // mount holes
                    translate([size-hole_pos, size-hole_pos, -1]) cylinder(h=thick+2, d=3);
                    translate([size-hole_pos, hole_pos, -1]) cylinder(h=thick+2, d=3);
                    translate([hole_pos, size-hole_pos, -1]) cylinder(h=thick+2, d=3);
                    translate([hole_pos, hole_pos, -1]) cylinder(h=thick+2, d=3);
                }
                translate([5, 4, -2]) rotate([0, 0, 45]) cube([size, 1.5, thick+4]);
                translate([4, size-5, -2]) rotate([0, 0, -45]) cube([size, 1.5, thick+4]);
            }
        }
    }
    if(style == 1 && size == 40) {
        
        union() {
            difference() {
                union () {
                    difference() {
                        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-2);
                        translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-8);
                    }
                    difference() {
                        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-11);
                        translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-17);
                    }
                    difference() {
                        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-20);
                        translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-25);
                    }
                    difference() {
                        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-28);
                        translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-35);
                    }
                    // mount holes
                    translate([size-hole_pos, size-hole_pos, -1]) cylinder(h=thick+2, d=3);
                    translate([size-hole_pos, hole_pos, -1]) cylinder(h=thick+2, d=3);
                    translate([hole_pos, size-hole_pos, -1]) cylinder(h=thick+2, d=3);
                    translate([hole_pos, hole_pos, -1]) cylinder(h=thick+2, d=3);
                }
                translate([6.5, 5.5, -2]) rotate([0, 0, 45]) cube([size, 1.5, thick+4]);
                translate([5, size-6, -2]) rotate([0, 0, -45]) cube([size, 1.5, thick+4]);
            }
        }
    }
    if(style == 1 && (size == 50 || size == 60 || size == 70)) {

        union() {
            difference() {
                union () {
                    difference() {
                        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-2);
                        translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-14);
                    }
                    difference() {
                        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-18);
                        translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-30);
                    }
                    difference() {
                        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-34);
                        translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-46);
                    }
                    if(size > 50) {
                        difference() {
                            translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-50);
                            translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-59);
                        }
                    }
                    // mount holes
                    translate([size-hole_pos, size-hole_pos, -1]) cylinder(h=thick+2, d=3);
                    translate([size-hole_pos, hole_pos, -1]) cylinder(h=thick+2, d=3);
                    translate([hole_pos, size-hole_pos, -1]) cylinder(h=thick+2, d=3);
                    translate([hole_pos, hole_pos, -1]) cylinder(h=thick+2, d=3);
                }
                translate([8.5, 7, -2]) rotate([0, 0, 45]) cube([size > 60 ? size+4 : size+1, 2, thick+4]);
                translate([6.5, size-8, -2]) rotate([0, 0, -45]) cube([size > 60 ? size+4 : size+1, 2, thick+4]);
            } 
        }
    }
    if(style == 1 && size >= 80) {

        union() {
            difference() {
                union () {
                    difference() {
                        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-2);
                        translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-9);
                    }
                    difference() {
                        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-14);
                        translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-21);
                    }
                    difference() {
                        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-26);
                        translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-33);
                    }
                    difference() {
                        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-38);
                        translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-45);
                    }
                    difference() {
                        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-50);
                        translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-57);
                    }
                    difference() {
                        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-62);
                        translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-68);
                    }
                    if(size == 92) {
                    difference() {
                        translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-74);
                        translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-80);
                    }
                        difference() {
                            translate([size/2, size/2, -1]) cylinder(h=thick+2, d=size-85);
                            translate([size/2, size/2, -2]) cylinder(h=thick+4, d=size-91);
                        }
                    }
                    // mount holes
                    translate([size-hole_pos, size-hole_pos, -1]) cylinder(h=thick+2, d=3);
                    translate([size-hole_pos, hole_pos, -1]) cylinder(h=thick+2, d=3);
                    translate([hole_pos, size-hole_pos, -1]) cylinder(h=thick+2, d=3);
                    translate([hole_pos, hole_pos, -1]) cylinder(h=thick+2, d=3);
                }
                translate([6.5, 4.25, -2]) rotate([0, 0, 45]) cube([size*1.2, 3, thick+4]);
                translate([4.25, size-6.5, -2]) rotate([0, 0, -45]) cube([size*1.2, 3, thick+4]);
            }
        }
    }
    if(style == 2) {

        inner = size == 30 ? 24 :
            size == 40 ? 32 :
            size == 50 ? 40 :
                size == 60 ? 50 :
                size == 70 ? 61.9 :
                    size == 80 ? 71.5 :
                    size * 0.8; // Use 80% as default

        rings = size <= 40 ? 4 : 6;
        bar_size = size <= 40 ? 2 : 3;

        screw_offset = inner / 2;
        center_point = size * 0.5;
        base_ring_size = size * 0.95;
        rings_spacing = size / rings;

        translate([size/2, size/2, -1])
        union() {
            translate([screw_offset, screw_offset, (thick+2)/2]) cylinder(d=3, h=thick+2, center=true);
            translate([-screw_offset, screw_offset, (thick+2)/2]) cylinder(d=3, h=thick+2, center=true);
            translate([screw_offset, -screw_offset, (thick+2)/2]) cylinder(d=3, h=thick+2, center=true);
            translate([-screw_offset, -screw_offset, (thick+2)/2]) cylinder(d=3, h=thick+2, center=true);

            difference() {
            union() {
                for(i=[inner:-rings_spacing:0]) {
                    difference() {
                        cylinder(d=base_ring_size - i, h=thick+2);
                        translate([0, 0, -1]) cylinder(d=base_ring_size - i - (rings_spacing/2), h=thick+4);
                    }
                }
            }

            translate([0, 0, 2]) 
                union() {
                    cylinder(d=bar_size*2+0.1, thick+2); // Add a circle to prevent any tiny holes around cross bar
                    rotate([0, 0, 45]) cube([size, bar_size, thick+2], center=true);
                    rotate([0, 0, 45]) cube([bar_size, size, thick+2], center=true);
                }
            }
        }
    }
    if(style == 3) {
        
        hex_pos = size == 30 ? [-11.75, -4.5, 0] :
            size == 40 ? [-14, -11.25, 0] :
            size == 50 ? [-16, -6.5, 0] : 
            size == 60 ? [-11, -1.5, 0] : 
            size == 70 ? [-13, -3.5, 0] :
            size >= 80 ? [-8.25, -3.5, 0] : [-9, -4, 0];

        union() {
            difference () {
                translate([1+(size-2)/2, 1+(size-2)/2, -1]) cylinder(h=thick+2, d=size-2);
                union() {
                    difference() {
                        translate([1+(size-2)/2, 1+(size-2)/2, -1-adj]) cylinder(h=thick+3, d=size-2);
                        translate(hex_pos) vent_hex(15, 8, thick+4, 12, 2, "horizontal");
                    }
                }
            }
        }
        // mount holes
        translate([size-hole_pos, size-hole_pos, -1]) cylinder(h=thick+2, d=3);
        translate([size-hole_pos, hole_pos, -1]) cylinder(h=thick+2, d=3);
        translate([hole_pos, size-hole_pos, -1]) cylinder(h=thick+2, d=3);
        translate([hole_pos, hole_pos, -1]) cylinder(h=thick+2, d=3);
    }
}