draw_self();

if (flash > 0) {
	flash--;
	draw_sprite_ext(sEnemy, image_index, x, y, 1, 1, image_angle, c_black, 0.5);
}