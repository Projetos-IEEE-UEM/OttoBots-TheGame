/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Configura a velocidade da poeira (ajuste conforme necessário)
speed = random_range(0.1, 1);
direction = point_direction(x, y, Obj_player.x, Obj_player.y) + 180; // Move na direção oposta ao jogador
image_alpha = 1; // Opacidade inicial
type_dust = choose(0, 1, 2)

//escala da imagem
scale = random_range(0.5, 1);

image_xscale = scale;
image_yscale = scale;