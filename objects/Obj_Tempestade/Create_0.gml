_player = instance_find(Obj_player, 0);

tempestade_ativa = false;   // Diz se a tempestade está ativa
forca_tempestade = 0;    // Força que a tempestade vai fazer (vai de 0 a 1)

duracao_tempestade = 600;    // Tempo que dura a tempestade (6s)
intervalo_tempestade = 420;    // Tempo de intervalo entre as tempestades (15s)

alarm[0] = intervalo_tempestade;

particula_chuva = part_system_create();