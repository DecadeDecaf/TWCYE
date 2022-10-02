x = 1920
y = 1080

camera = camera_create()
zw = 1920
zh = 1080

camera_set_view_size(camera, zw, zh)

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0)
var pm = matrix_build_projection_ortho(1920, 1080, -10000, 10000)

camera_set_view_mat(camera, vm)
camera_set_proj_mat(camera, pm)

view_camera[0] = camera