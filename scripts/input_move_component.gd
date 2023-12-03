extends Node

@export var character_body: CharacterBody2D
@export var speed: int = 1

const SPEED_MULTIPLIER = 100

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed * SPEED_MULTIPLIER
		
	character_body.velocity = velocity
	character_body.move_and_slide()
