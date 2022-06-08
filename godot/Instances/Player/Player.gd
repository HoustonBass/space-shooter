extends Entity

@export var player_data: Resource
@onready var weapon_point = $WeaponPoint

func _process(_delta):
	if Input.is_action_pressed('ui_accept'):
		fire_weapon()
	
	var input_vector = Vector2(0, 0)
	if Input.is_action_pressed('ui_up'):
		input_vector.y = -1
	if Input.is_action_pressed('ui_down'):
		input_vector.y = 1
	if Input.is_action_pressed('ui_left'):
		input_vector.x = -1
	if Input.is_action_pressed('ui_right'):
		input_vector.x = 1
	set_velocity(player_data.speed * input_vector.normalized())
	move_and_slide()
	look_at(get_global_mouse_position())

func fire_weapon():
	#Abstract this for multiple weapons?
	weapon_point.fire_weapon()

func take_hit(damage):
	player_data.health -= damage
