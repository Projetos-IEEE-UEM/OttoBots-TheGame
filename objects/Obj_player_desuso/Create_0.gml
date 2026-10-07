//Criando a camera do jogo
var camera = instance_create_layer(x, y, layer, Obj_cam)

//estou dizendo que o alvo da camera sou eu 
camera.alvo = id

//Velocidades de movimento
velocidade_movimento = 3

//Movimento Vertical
vel_movimento_vertical=0

//Velocidade do Pulo
vel_pulo=-7

//Gravidade
grav = 0.3

//Quantidade de pulos
pulos = 2

//Estado Inicial da maquina de estados
estado = "parado"

//Movimento na Horizontal
xspd = 0

//Variavel de tomar dano
dano = false;

//tempo do sprite do dano
tempo_dano = 60; //aproximadamente 1 segundo

//Contador do sprite de dano;
timer_dano = 0;

//tempo de invecibilidade
tempo_invencivel = 120; // aproximadamente 2 segundos

//Contador da invecibilidade;
timer_invencivel = 0;

//direacao que o sprite esta virado
direcao = 1;

//saber quando eu posso levar dano
posso_dano = false;

//Variavel para saber se estou abaixado ou nao
agachar = false;

//Variável que diz se o Otto pode ou não mudar de direção:
mudar_direcao = true;

//Variáveis criadas por mim para implementação do bloco de gelo ~Bruno!
aceleracao_gelo = 0.01;

teste = 0;

// Configuração do temporizador de poeira e de quanto em quanto tempo ela vai aparecer
dust_timer = 0;
dust_interval = 4; // Ajuste conforme necessário (em frames)

//Variavel de controle de debouncing
tempo_de_debouncing = 60;
contador_de_debouncing = 0;



cabeca_inimigo = false;

//Temporizador do bouncing diagonal
timer_diagonal = 30;
//Variavel que decremente do temporizador diagonal
Pulo_diagonal = 0;
//Escolhe a direção desse mesmo bouncing diagonal
escolha_diagonal = 0;
