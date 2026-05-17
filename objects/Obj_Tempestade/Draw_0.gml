if (tempestade_ativa) {
    draw_set_alpha(forca_tempestade * 0.2); 
    draw_set_colour(c_navy);
    draw_rectangle(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 
                   camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), 
                   camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), 
                   false);
    draw_set_alpha(1.0);
}