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
	movementFactor = rng.randf_range(1, 8)
	currentRangeVal = movementFactor
	movementRange = 100 * movementFactor
	movementSpeed = 50 * movementFactor
	
	colorRandom = rng.randi_range(0, 37)
	_setSprite(colorRandom)

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

func _setSprite(colorSeed):
	match colorSeed:
		0:
			AnimatedSprite.play("BabyBlueAgain")
		1:
			AnimatedSprite.play("BabyWhite")
		2:
			AnimatedSprite.play("Banana")
		3:
			AnimatedSprite.play("Beige")
		4:
			AnimatedSprite.play("Black")
		5:
			AnimatedSprite.play("BloodOrnage")
		6:
			AnimatedSprite.play("Blue")
		7:
			AnimatedSprite.play("Brown")
		8:
			AnimatedSprite.play("BrownRed")
		9:
			AnimatedSprite.play("Bubblegum")
		10:
			AnimatedSprite.play("Constipation")
		11:
			AnimatedSprite.play("DarkGrey")
		12:
			AnimatedSprite.play("DarkTeal")
		13:
			AnimatedSprite.play("Green")
		14:
			AnimatedSprite.play("Grey")
		15:
			AnimatedSprite.play("Jaffa")
		16:
			AnimatedSprite.play("Lemon")
		17:
			AnimatedSprite.play("LightBrown")
		18:
			AnimatedSprite.play("LightGrey")
		19:
			AnimatedSprite.play("LightOrange")
		20:
			AnimatedSprite.play("LightPurple")
		21:
			AnimatedSprite.play("Lime")
		22:
			AnimatedSprite.play("MountainDew")
		23:
			AnimatedSprite.play("NotFunnyPurple")
		24:
			AnimatedSprite.play("Pink")
		25:
			AnimatedSprite.play("Pinky")
		26:
			AnimatedSprite.play("PinkyAgain")
		27:
			AnimatedSprite.play("Plum")
		28:
			AnimatedSprite.play("Poop")
		29:
			AnimatedSprite.play("Red")
		30:
			AnimatedSprite.play("RedAgain")
		31:
			AnimatedSprite.play("Ribal")
		32:
			AnimatedSprite.play("Tan")
		33:
			AnimatedSprite.play("Teal")
		34:
			AnimatedSprite.play("Ultramarine")
		35:
			AnimatedSprite.play("Vanilla")
		36:
			AnimatedSprite.play("White")
		37:
			AnimatedSprite.play("Yellow")
