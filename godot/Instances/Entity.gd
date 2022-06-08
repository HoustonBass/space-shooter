class_name Entity extends CharacterBody2D

var health: float
var max_health: float
var speed: float

func take_hit(damage):
	health -= damage
	if health <= 0:
		die()

func die():
	queue_free()
