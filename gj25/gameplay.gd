extends Node2D

@onready var player = $Player
var startingPointValue = 0
@onready var currentHeightLabel = $UI/CurrentHeight
@onready var maxHeightLabel = $UI/MaximumHeight

var maxHeightValue = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startingPointValue = player.global_position.y
	_changeCurrentHeight(startingPointValue)
	_changeMaxHeight(0)
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#_changeCurrentHeightLabel(int(startingPointValue + int(-player.global_position.y if player.global_position.y < 0 else player.global_position.y)))
	_changeCurrentHeight(-player.global_position.y)
	pass

func _changeCurrentHeight(currentHeightValue):
	currentHeightValue = int(currentHeightValue + startingPointValue)
	currentHeightLabel.text = "Current height: " + str(currentHeightValue)
	if(currentHeightValue > maxHeightValue):
		_changeMaxHeight(currentHeightValue)

func _changeMaxHeight(currentHeightValue):
	maxHeightValue = currentHeightValue
	maxHeightLabel.text = "Maximum height: " + str(currentHeightValue)
