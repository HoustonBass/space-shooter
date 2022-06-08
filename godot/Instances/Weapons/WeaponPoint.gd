extends Node2D

@export var weapon: PackedScene

@onready var timer = $WeaponCooldownTimer
@onready var root = get_tree().get_root()
@onready var range_finder_r = $RangeFinderR
@onready var range_finder_l = $RangeFinderL

var can_fire = true
var automatic = false

func set_range(_range: float) -> void:
	range_finder_r.set_target_position(Vector2(_range, range_finder_r.position.y))
	range_finder_l.set_target_position(Vector2(_range, range_finder_l.position.y))

func set_fire_rate(_rate):
	timer.set_wait_time(_rate)

func set_fire_mode(_automatic: bool) -> void:
	automatic = _automatic

func _process(_delta):
	if automatic and can_fire and is_range_clear():
		fire_weapon()

func fire_weapon():
	if can_fire:
		fire_bullet()

func _on_weapon_cooldown_timer_timeout():
	can_fire = true
	timer.stop()

func is_range_clear() -> bool:
	if range_finder_r.is_colliding() or range_finder_l.is_colliding():
		var e = range_finder_r.get_collider()
		var e2 = range_finder_l.get_collider()
		if check(e, 'enemies') or check(e2, 'enemies'):
			print('found an enemy, hold fire!')
			return false
		if check(e, 'players') or check(e2, 'players'):
			print('the whites of the eyes, fire!!')
			return true
	return false

func check(node, group: String) -> bool:
	return node and node.is_in_group(group)

func fire_bullet():
	var bullet = weapon.instantiate()
	bullet.parent = get_parent()
	bullet.rotation = get_parent().rotation
	bullet.position = global_position
	root.add_child(bullet)
	can_fire = false
	timer.start()

Vector2.INF
