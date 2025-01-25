extends CharacterBody2D

@export var moveLength : int = 100
@export var movementSpeed : int = 50

@onready var CountdownLabel = $CountdownLabel

@onready var AnimatedSprite = $AnimatedSprite2D
var colorRandom = 0

var movementFactor = 1
var movementRange = 100
var startPoint
var distTravelled = 0
var goingForward = true
var rng = RandomNumberGenerator.new()
var currentRangeVal = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	startPoint = global_position.y # Replace with function body.
	movementFactor = rng.randf_range(1, 6)
	currentRangeVal = movementFactor
	movementRange = 100 * movementFactor
	movementSpeed = 50 * movementFactor
	
	colorRandom = rng.randi_range(0, 36)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var travel = delta*movementSpeed
	
	if(goingForward == true):
		global_position.y -= travel
		distTravelled+= travel
		if roundf((movementRange - distTravelled)/100) == 0:
			CountdownLabel.text = "!"
		else:
			CountdownLabel.text = str(roundf((movementRange - distTravelled)/100))
		if(distTravelled > movementRange):
			queue_free()

func _setSprite(seed):
	match seed:
		0:
			 
