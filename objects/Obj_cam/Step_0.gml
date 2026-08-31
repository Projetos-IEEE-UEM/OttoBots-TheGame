// Obj_player

// Coloca a camera em tela cheia
if keyboard_check_pressed(vk_f11) {
    window_set_fullscreen(!window_get_fullscreen()); 
    // window_get_fullscreen() retorna se está em tela cheia ou não
    // Se estiver em tela cheia, tira da tela cheia, e caso não estiver muda pra tela cheia
}


// Para de funcionar se não existir um player na room
if !instance_exists(Obj_PlayerTeste) exit;
    
// Pega o tamanho da câmera
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

// Pega as coordenadas do alvo
var _camX = Obj_PlayerTeste.x - _camWidth / 2;
var _camY = Obj_PlayerTeste.y - _camHeight / 2;

// Restringe a camera para o tamanho do mapa
_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

finalCamX += (_camX - finalCamX) * velCamera;
finalCamY += (_camY - finalCamY) * velCamera;

// Coloca a camera nas coordenadas camX e camY
camera_set_view_pos(view_camera[0], finalCamX, finalCamY);
