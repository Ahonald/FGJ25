extends Node2D

@onready var player = $Player
var startingPointValue = 0
@onready var currentHeightLabel = $UI/CurrentHeight
@onready var maxHeightLabel = $UI/MaximumHeight

@onready var AssholePlayer = $AssholePlayer
@onready var BubblePop = $BubblePop

var playerFallMag = 0;
var playerFallMaxMag = 1.5;

var maxHeightValue = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startingPointValue = player.global_position.y
	_changeCurrentHeight(startingPointValue)
	_changeMaxHeight(0)
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not player.is_on_floor():
		playerFallMag += delta
	else:
		playerFallMag = 0
	if(playerFallMag > playerFallMaxMag):
		if !AssholePlayer.playing:
			pass
			#AssholePlayer._playAssholeSound()
		playerFallMag = 0
		
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

func _playBubblePop():
	BubblePop.play()
	
