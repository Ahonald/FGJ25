extends Node2D
@onready var AssholePlayer = $"../AssholePlayer"
@onready var MusicPlayer = $"../MusicPlayer"
@onready var EndLabel = $"../UI/EndLabel"
@onready var VictoryPlayer = $"../Victory"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name)
	if(body.name == "Player"):
		EndLabel.visible = true
		body.die = true
		$"../MusicPlayer".stop()
		AssholePlayer._playCheckpointNoise()	
		VictoryPlayer.play()
	pass # Replace with function body.
