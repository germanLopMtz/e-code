extends CharacterBody2D


const velocidad = 150
@onready var player = $ ".."
@onready var animacion = $AnimatedSprite2D

func _physics_process(_delta):
	if Input.is_action_pressed("IZQUIERDA"):
		player.position.x -= velocidad * _delta
		animacion.play("Izquierda")
	elif Input.is_action_pressed("DERECHA"):
		player.position.x += velocidad * _delta
		animacion.play("Derecha")
	elif Input.is_action_pressed("ARRIBA"):
		player.position.y -= velocidad * _delta
		animacion.play("Arriba")
	elif Input.is_action_pressed("ABAJO"):
		player.position.y += velocidad * _delta
		animacion.play("Abajo")
	else:
		animacion.stop()
		

	move_and_slide()
