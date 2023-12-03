extends Node

@export var character_body: CharacterBody2D
@export var animated_sprite: AnimatedSprite2D

func _process(delta):
	if character_body.velocity.x > 0:
		animated_sprite.play("walk_right")
	elif character_body.velocity.x < 0:
		animated_sprite.play("walk_left")
	elif character_body.velocity.y > 0:
		animated_sprite.play("walk_down")
	elif character_body.velocity.y < 0:
		animated_sprite.play("walk_up")
	else:
		animated_sprite.frame = 0
		animated_sprite.stop()
