/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Move a poeira
motion_set(direction, speed);

// Reduz a opacidade ao longo do tempo
image_alpha -= 0.05;
image_index = type_dust;


// Destroi a instância quando a opacidade atinge 0
if (image_alpha <= 0) {
    instance_destroy();
}


