extends ProgressBar

@export var player_data: Resource = PlayerData

func _ready():
	if player_data:
		player_data.connect("health_changed", self._on_player_health_changed)
		value = player_data.health

func _on_player_health_changed(_value):
	var tween = get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_CIRC)
	tween.tween_property(self, "value", _value, 0.2)
