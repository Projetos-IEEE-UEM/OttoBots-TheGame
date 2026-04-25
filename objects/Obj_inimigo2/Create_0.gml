//Velocidade do inimigo:
velocidade = 2;
//Inicializa a velocidade vertical do inimigo:
velocidade_vertical = .5
//Inicialização do contador:
contador = 0;
//Inicializa a aceleração horizontal do inimigo:
aceleracao = 0;
//Inicializa a direção vertical do inimigo:
aceleracao_vertical = 0;
//Inicializa contador de inversão de direção de voo:
contador_voo = 0;
//quando ele morre, ele deve cair do ar, e vou usar essa variavel para confirmar a queda
caiu = false;
//Variável que define se o inimigo deve seguir o Otto:
seguir = false;
//Variável que define o quão próximo Otto deve estar do inimigo para iniciar ou não a perseguição:
var_raio = 300;
/*Variável que define quão longe o Otto deve estar para que o inimigo pare de perseguir -- É interessante 
deixar esse valor maior que o var_raio, caso contrário, é muito fácil fugir do inimigo!*/
var_raio_fuga = 300;
event_inherited();