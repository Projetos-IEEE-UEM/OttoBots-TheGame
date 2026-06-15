// Força da tempestade que queremos chegar
// Se tempestade_ativa, o alvo é 1, caso contrario, 0
var _intensidade_alvo = tempestade_ativa ? 1 : 0;
forca_tempestade = lerp(forca_tempestade, _intensidade_alvo, 0.05); // 0.05 é o valor de variação

// Coordenadas da Câmera
var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

part_system_position(particula_chuva, _cam_x, _cam_y);

if (forca_tempestade < 0.005) {
    // Se a tempestade sumiu, zeramos a transparência das partículas
    part_system_colour(particula_chuva, c_white, 0);
    
    // Para de emitir a partícula 
    part_system_automatic_update(particula_chuva, false);
} else {
    // Se a tempestade está ativa ou em fade, as partículas voltam a ser emitidas
    part_system_automatic_update(particula_chuva, true);
    
    // A força da tempestade é diretamente relacionada a transparência das partículas
    part_system_colour(particula_chuva, c_white, forca_tempestade);
}
