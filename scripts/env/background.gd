extends ParallaxBackground
class_name Background

#Notas sobre Parallax#
#Ao utilizar um efeito onde o fundo se move mais devagar do que os objetos próximos, têm-se algo como quando andamos de carro
#Ao utilizar um efeito onde o fundo se move mais rápido, há um efeito como alteração no campo de visão

#Export das variáveis de processamento e velocidade de layers
@export var can_process:bool
@export var layer_speed:Array[int]

func _ready():
	#Caso não seja possível processar o parallax, ele definirá o Physics process como falso (não permitindo atualizações de frames)
	if can_process == false:
		set_physics_process(false)
	else:
		set_physics_process(true)
	pass

#Physics process
func _physics_process(delta):
	for index in get_child_count():
		if get_child(index) is ParallaxLayer:
			#Caso haja movimentação, o Offset será decrescido, sendo movido de acordo com o Delta * Velocidade da Layer
			#layer_speed foi definido em cada layer via console
			#layer_speed[index] serve para acessar o valor definido no console em cada um dos layers
			get_child(index).motion_offset.x -= delta * layer_speed[index]

