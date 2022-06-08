extends Area2D

@onready var on_screen_notifier = $VisibleOnScreenNotifier2D

var speed = 360
var speed2 = Vector2(speed, 0)
var damage = 10.0
var health = 10.0
var pass_through = 0
var max_pass_through = 1
var parent: Node2D

func take_hit(_damage):
	health -= _damage
	if health <= 0:
		die()

func _process(delta):
	translate(delta * speed2.rotated(rotation))
	if not on_screen_notifier.is_on_screen():
		die()
	
func get_damage_value() -> float:
	return damage

func collided():
	pass_through += 1
	if pass_through >= max_pass_through:
		die()

func _on_laser_body_entered(body):
	if body != parent and body.has_method('take_hit'):
		body.take_hit(get_damage_value())
		collided()

func die():
	call_deferred('set_monitorable', false)
	call_deferred('set_monitoring', false)
	queue_free()


func _on_laser_area_entered(area):
	if area.is_in_group('weapons'):
		take_hit(area.get_damage_value())
		area.take_hit(get_damage_value())
