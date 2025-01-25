extends Node2D

var hasbeenhit = false
@onready var AssholePlayer = $"../AssholePlayer"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_area_2d_body_entered(body):
	if(body.name == "Player"):
		if hasbeenhit == false:
			if !AssholePlayer.playing:
				AssholePlayer._playCheckpointNoise()	
		pass
