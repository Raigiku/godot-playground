extends CharacterBody2D

@export var speed: int = 1
@export var animated_sprite: AnimatedSprite2D
@export var move_decision_timer: Timer

var input_direction = Vector2.ZERO

const SPEED_MULTIPLIER = 20

func _process(delta):
	if input_direction.x < 0:
		animated_sprite.flip_h = true
	elif input_direction.x > 0:
		animated_sprite.flip_h = false
	
	velocity = input_direction.normalized() * speed * SPEED_MULTIPLIER
	if velocity.length() == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run")
	
	move_and_collide(velocity * delta)

func _on_move_decision_timer_timeout():
	var rand_x = randi_range(-1, 1)
	var rand_y = randi_range(-1, 1)
	input_direction.x = rand_x
	input_direction.y = rand_y
