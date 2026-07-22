// Inicia a camera no começo da room

// Para de funcionar se não existir um player na room
if !instance_exists(Obj_player) exit;
    
// Pega o tamanho da câmera
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

// Pega as coordenadas do alvo
var _camX = Obj_player.x - _camWidth / 2;
var _camY = Obj_player.y - _camHeight / 2;

// Restringe a camera para o tamanho do mapa
_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

finalCamX = _camX;
finalCamY = _camY;

