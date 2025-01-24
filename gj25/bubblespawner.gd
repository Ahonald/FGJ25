extends Node

var spawnfrequency = 0.2;
var timer = 0
var rng = RandomNumberGenerator.new()
@onready var gameplay = $".."

@onready var bubble = preload("res://movingbubble.tscn")
@onready var player = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer+=delta
	if timer > spawnfrequency:
		var newBubble = bubble.instantiate()
		gameplay.add_child(newBubble)
		newBubble.global_position.x = player.global_position.x + rng.randf_range(-50,50)
		newBubble.global_position.y = player.global_position.y + 250
		print(newBubble.global_position.x)
		print(newBubble.global_position.y)
		spawnfrequency = rng.randf_range(0.5,1)
		timer = 0
	pass
