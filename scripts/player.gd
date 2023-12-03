extends CharacterBody2D

@export var speed: int = 1

var animated_sprite: AnimatedSprite2D
var input_direction = Vector2.ZERO

const SPEED_MULTIPLIER = 100

func _ready():
	for child in get_children():
		if child is AnimatedSprite2D:
			animated_sprite = child

func _process(delta):
	input_direction = Vector2.ZERO
	if Input.is_action_pressed("move_down"):
		input_direction.y = 1
		animated_sprite.play("walk_down")
	elif Input.is_action_pressed("move_up"):
		input_direction.y = -1
		animated_sprite.play("walk_up")
	elif Input.is_action_pressed("move_left"):
		input_direction.x = -1
		animated_sprite.play("walk_left")
	elif Input.is_action_pressed("move_right"):
		input_direction.x = 1
		animated_sprite.play("walk_right")
	
	if input_direction.length() == 0:
		animated_sprite.frame = 0
		animated_sprite.stop()
		
	velocity = input_direction.normalized() * speed * SPEED_MULTIPLIER

	move_and_collide(velocity * delta)
