// Força da tempestade que queremos chegar
// Se tempestade_ativa, o alvo é 1, caso contrario, 0
var _intensidade_alvo = tempestade_ativa ? 1 : 0;
forca_tempestade = lerp(forca_tempestade, _intensidade_alvo, 0.05); // 0.05 é o valor de variação