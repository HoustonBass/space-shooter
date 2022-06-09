extends Label

@export var score_data: Resource = ScoreData

func _ready():
	if score_data:
		text = str(score_data.score)
		score_data.connect("score_changed", self._on_score_changed)

func _on_score_changed():
	text = str(score_data.score)
