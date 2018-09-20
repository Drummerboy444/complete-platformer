// Get player input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

// Calculate movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

// Jumping
if (place_meeting(x, y + 1, oWall)) && key_jump {
	vsp = -7;
}

// Horizontal collision
if (place_meeting(x + hsp, y, oWall)) {
	while (!place_meeting(x + sign(hsp), y, oWall)) {
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

// Verticle collision
if (place_meeting(x, y + vsp, oWall)) {
	while (!place_meeting(x, y + sign(vsp), oWall)) {
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;


// Animation
if (!place_meeting(x, y + 1, oWall)) {
	image_speed = 0;
	sprite_index = sPlayerA;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
} else {
	image_speed = 0.6;
	if (hsp == 0) {
		sprite_index = sPlayer;
	} else {
		sprite_index = sPlayerR;
	}
}
if (hsp !=0) image_xscale = sign(hsp);
