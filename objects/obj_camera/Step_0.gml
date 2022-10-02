var up = (keyboard_check(ord("W")) || keyboard_check(vk_up))
var down = (keyboard_check(ord("S")) || keyboard_check(vk_down))
var left = (keyboard_check(ord("A")) || keyboard_check(vk_left))
var right = (keyboard_check(ord("D")) || keyboard_check(vk_right))

var w = camera_get_view_width(camera)
var h = camera_get_view_height(camera)

var sw = 720
var sh = 405

if (abs(x - mouse_x) > sw) {
	if (x - mouse_x > 0) { 
		x -= (abs(x - mouse_x) - sw) / 32
	} else {
		x += (abs(x - mouse_x) - sw) / 32
	}
}

if (abs(y - mouse_y) > sh) {
	if (y - mouse_y > 0) { 
		y -= (abs(y - mouse_y) - sh) / 18
	} else {
		y += (abs(y - mouse_y) - sh) / 18
	}
}

var pan = 10

if (up) {
	y -= pan
}

if (down) {
	y += pan
}

if (left) {
	x -= pan
}

if (right) {
	x += pan
}

var midw = (w / 2)
var midh = (h / 2)

var camX = median(midw, x, room_width - midw)
var camY = median(midh, y, room_height - midh)

x = camX
y = camY

var vm = matrix_build_lookat(camX, camY, -10, camX, camY, 0, 0, 1, 0)
camera_set_view_mat(camera, vm)