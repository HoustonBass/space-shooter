extends ProgressBar

@export var player_data: Resource = PlayerData

var health

func _ready():
	update_health(player_data.health)

func _process(_delta):
	if update_health(player_data.health):
		update()

func update_health(_health) -> bool:
	if health != _health:
		health = _health
		value = health
		return true
	return false
