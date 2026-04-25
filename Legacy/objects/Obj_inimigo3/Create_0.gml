//Direção inicial que o inimigo segue
direcao = choose(1, -1);
//Velocidade horizontal do inimigo
xspd = 1;
//Iniciando a gravidade utilizada pelo inimigo:
gravidade = 2;
//Iniciando a velocidade vertical do inimigo:
vel_movimento_vertical = 0;
//Velocidade de pulo;
velocidade_pulo = -7;
//Escolhendo se eu caio de plataformas ou nao
cair = choose(1, 0);
//Contador para lançar projétil;
contador = 0;
//Direção qual seguir;
direcao = 0;
//Estado do inimigo:
perseguir = false;
//Numero de vidas do inimigo:
vidas = 5;
//Iniciar a variavel de distancia da parede
tempo_pulo = 0;
//detectar uma parede na frente
parede = false
//quantidade de pulos
pulo = 1;
//estado inicial do inimigo 3
estado = "parado";

//variavel de controle do pulo
pode_pular = false;
//Variavel do tempo de tiro
tempo_tiro = 200;
event_inherited();