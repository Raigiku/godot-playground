extends Camera2D

@export var node_to_follow: Node2D

func _process(delta):
	position = node_to_follow.position
