// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações


//0 -> esquerda
//1 -> direita

function scr_textos(){
	switch npc_nome{
		case "igor":
			ds_grid_add_text("Éé... parece que funcionou. Temos uma esperança, venham ver",Spr_Rosto_Igor, 0, "Igor");
		break;
		case "rubens":
			ds_grid_add_text("Incrível, finalmente ele está pronto...",Spr_Rosto_Rubens, 0, "Rubens");
		break;
		case "lucas":
			ds_grid_add_text("Será que agora conseguiremos? De uma vez por todas?",Spr_Rosto_Lucas, 0, "Lucas");
		break;
		case "igor2":
			ds_grid_add_text("Ééé, só precisamos instruí-lo agora.",Spr_Rosto_Igor, 0, "Igor");
			ds_grid_add_text("Venha, Otto, agora que acordou precisamos de você.",Spr_Rosto_Igor, 0, "Igor");
		break;
		case "igor3":
			ds_grid_add_text("Você tem um propósito Otto, para isso, precisa aprender a aproveitar todo o seu potencial. Inclui em você a capacidade de aumentar a sua velocidade ao agachar, saiba que isso será muito útil.",Spr_Rosto_Igor, 0, "Igor");
			ds_grid_add_text("Mas tome cuidado, ao agachar você não conseguirá saltar tão alto quanto de pé, use apenas em certos momentos.",Spr_Rosto_Igor, 0, "Igor");
		break;
		case "rubens2":
			ds_grid_add_text("Existem certos limites que a sua tecnologia pode alcançar. Com o tempo que temos agora não conseguimos aprimorar totalmente o que você pode fazer… Mas criamos um mecanismo dentro de você capaz de se auto-aprimorar… uma rede neural unida com as suas partes mecânicas.",Spr_Rosto_Rubens, 0, "Rubens");
			ds_grid_add_text("Ao coletar dejetos e utensílios de energia você será capaz de se aprimorar.",Spr_Rosto_Rubens, 0, "Rubens");
		break;
		case "lucas2":
			ds_grid_add_text("Mas antes de te explicar o porquê de você estar aqui, Otto, precisamos te testar… para que finalmente entenda seu propósito.",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("Seguinte, você vai cacetar uns caras na porrada… Confia em mim, sou faixa preta e te coloquei uns códigos sinistros de Aikido... Mas não vai com muita sede ao pote não, tem uns inimigos que você tem que tomar cuidado.",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("Um deles que tá me dando dor de cabeça é o Vyper, uma espécie de Alien capaz de se movimentar horizontalmente… mas é só dar um pisão nele",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("O outro é o Robô AD4M… um problemão… ele te detecta e atira… mas, sem segredo, só dar um pisão também...",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("Mas o terceiro é problema… ele atira foguetes à distância e… rapaz… se eu te falar que também é só dar pisão nele… Só que esse é mais chato, tem que ser cinco pisões bem na cabeça.",Spr_Rosto_Lucas, 0, "Lucas");
		break;
		case "igor4":
			ds_grid_add_text("Ééé… vamos parar de enrolar e vamos pra ação. É aquilo né, tem que testar...",Spr_Rosto_Igor, 0, "Igor");
		break;
		case "lucas3":
			ds_grid_add_text("Parabéns, deu tudo certo, Otto… agora você já pegou o esquema.",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("...",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("...",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("Otto, preciso te explicar a razão pela qual você foi criado...",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("Há uma grande ameaça... esses inimigos que você derrotou... eles estão por toda parte... Eles fazem parte de uma grande ameaça… São comandados por pessoas do planeta DYN’’. ‘’Nós os apelidamos de Zakeanos.",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("Muitos anos atrás... em um teste de laboratório no O27, nós conseguimos construir uma estrutura capaz de se comunicar por regiões intergalácticas... Nosso objetivo era ver até onde nosso estudo com sinais e sistemas lineares podia nos levar... acontece que nós infelizmente...",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("Conseguimos...",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("Foi o nosso maior erro.",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("Sinalizamos nossa singular existência para os Zakeanos... os habitantes do planeta DYN… Um planeta extremamente distante... que a princípio pensamos que não teria problema...",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("...",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("Erramos.",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("Eles conseguiram nos localizar... possuem tecnologias que não imaginávamos que teriam...",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("São capazes de viajar através de distâncias intergalácticas... mas pelo jeito só conseguem enviar poucas tropas... E decidiram nos atacar aqui... na UEM.",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("São espertos, estão atacando justamente onde perceberam que podemos criar ferramentas para nos defender",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("Mas você pode pensar... se só eles conseguem se teletransportar, como faríamos para impedir isso?",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("A resposta é o que nós sempre aprendemos em toda e qualquer problemática da engenharia",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("Gambiarra",Spr_Rosto_Lucas, 0, "Lucas");
			ds_grid_add_text("A gente te enfia lá na nave deles, você desce a porrada, invade o planeta deles com o portal deles e caceta tudo.",Spr_Rosto_Lucas, 0, "Lucas");
		break;
		case "rubens3":
			ds_grid_add_text("Recebi uma mensagem da reitoria pro nosso departamento",Spr_Rosto_Rubens, 0, "Prof. Rubens");
			ds_grid_add_text("Os Zakeanos estão agora invadindo a UEM, precisamos proteger o O27, os blocos e todos os laboratórios, existem alunos que estão desaparecidos. Otto, você precisa agir. Foi pra isso que te criamos",Spr_Rosto_Rubens, 0, "Prof. Rubens");
		break;
		
		case "Igor_apresenta":
			ds_grid_add_text("Ééeé... to cansado de trabalhar, queria umas fériaszinhas...",Spr_Rosto_Igor, 0, "Igor");
		break;
		
		case "Lucas_apresenta":
			ds_grid_add_text("Eletromag é fácil, Otto, você só precisa pegar o jeito.",Spr_Rosto_Lucas, 0, "Lucas");
		break;
		
		case "Rubens_apresenta":
			ds_grid_add_text("Opa, Otto, tudo bem? Não te vi ai...Mas acabei de bolar um piadinha... haha!", Spr_Rosto_Rubens, 0, "Rubens");
			ds_grid_add_text("Mas então, diga-me, por quê o livro de matemática estava triste??",Spr_Rosto_Rubens, 0, "Rubens");
			ds_grid_add_text("Porque ele está cheio de problemas!! HA-HA, entendeu? Problemas! HAHAHAHAHA",Spr_Rosto_Rubens, 0, "Rubens");
			ds_grid_add_text("Ai ai... que engraçado...",Spr_Rosto_Rubens, 0, "Rubens");
			ds_grid_add_text("Melhor eu voltar o que estava fazendo", Spr_Rosto_Rubens, 0, "Rubens");	
		break;
	}
}

function ds_grid_add_row(){
	///@arg ds_grid
	
	var _grid = argument[0];
	ds_grid_resize(_grid, ds_grid_width(_grid), ds_grid_height(_grid) + 1);
	return (ds_grid_height(_grid) - 1);
}

function ds_grid_add_text(){
	///@arg texto
	///@arg retrato
	///@arg lado
	///@arg nome
	
	var _grid = texto_grid;
	var _y = ds_grid_add_row(_grid);
	
	_grid[# 0, _y] = argument[0];
	_grid[# 1, _y] = argument[1];
	_grid[# 2, _y] = argument[2];
	_grid[# 3, _y] = argument[3];
}