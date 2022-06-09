extends EnemyEntity

@export var enemy_data: Resource = EnemyData

@onready var weapon_point = $WeaponPoint

var target: Node2D

var input_velocity = Vector2(1, 0)

func _ready():
	super()
	max_health = enemy_data.max_health
	health = enemy_data.health
	get_next_target()
	weapon_point.set_fire_mode(true)
	weapon_point.set_fire_rate(enemy_data.fire_cooldown)
	weapon_point.set_range(enemy_data.max_range)

func get_next_target():
	var targets = get_tree().get_nodes_in_group("players")
	var min_distance = INF
	for tar in targets:
		var distance = tar.global_position.distance_squared_to(global_position)
		if distance < min_distance:
			min_distance = distance
			target = tar

func _process(_delta):
	if target:
		look_at(target.global_position)
		set_velocity(enemy_data.speed * input_velocity.rotated(rotation))
		move_and_slide()
