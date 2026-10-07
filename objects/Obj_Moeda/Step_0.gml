// Calculando a flutuação;
var flutuacao = altura_flutuacao *sin(velocidade_flutuacao * current_time/100);

// Aplicando a flutuação à posição Y;
y = posicao_inicial_y + flutuacao;

// Se Otto morrer, perde todas as moedas
if Obj_Player.vidas == 0 {
		Obj_Player.moedas = 0;
}