// Calculando a flutuação
var flutuacao = altura_flutuacao *sin(velocidade_flutuacao * current_time/100);

// Aplicando a flutuação à posição Y
y = posicao_inicial_y + flutuacao;

