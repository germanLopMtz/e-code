# Indicamos que este script hereda de un nodo Area2D
extends Area2D

# Distancia que recorrerá el personaje por cada paso (opcional, no usada para movimiento continuo)
const MOVE_DISTANCE = 32
# Velocidad en píxeles por segundo durante el desplazamiento hacia el objetivo
const MOVE_SPEED = 200.0

# Bandera que indica si el personaje está actualmente moviéndose
var is_moving = false
# Vector de dirección actual
var move_dir = Vector2.ZERO
# Posición objetivo (solo usada si quieres movimiento tipo paso a paso)
var target_pos = Vector2.ZERO

# Función que se ejecuta cuando el nodo entra al árbol de escenas
func _ready():
	# Por ahora no necesitamos inicialización adicional
	pass

# Función de física que corre cada frame
func _physics_process(delta):
	# Reiniciamos la dirección a cero al inicio de cada frame
	move_dir = Vector2.ZERO

	# Revisamos si la flecha arriba está presionada
	if Input.is_action_pressed("ui_up"):
		move_dir.y -= 1
	# Revisamos si la flecha abajo está presionada
	if Input.is_action_pressed("ui_down"):
		move_dir.y += 1
	# Revisamos si la flecha izquierda está presionada
	if Input.is_action_pressed("ui_left"):
		move_dir.x -= 1
	# Revisamos si la flecha derecha está presionada
	if Input.is_action_pressed("ui_right"):
		move_dir.x += 1

	# Si la dirección no es cero, significa que hay alguna flecha presionada
	if move_dir != Vector2.ZERO:
		# Normalizamos la dirección para que diagonal no sea más rápido
		move_dir = move_dir.normalized()
		# Marcamos que estamos moviéndonos
		is_moving = true
		# Movemos el personaje según la velocidad y delta
		position += move_dir * MOVE_SPEED * delta
	else:
		# Si no hay flechas presionadas, el personaje deja de moverse
		is_moving = false
