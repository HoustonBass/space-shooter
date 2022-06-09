extends Resource
class_name EntityData

@export var health: float = 10.0
@export var max_health: float = 10.0
@export var speed: float = 50.0

func take_damage(damage):
	health -= damage
