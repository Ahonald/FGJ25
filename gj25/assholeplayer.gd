extends AudioStreamPlayer

var rng = RandomNumberGenerator.new()

var usedUpAssholeAudioArray = []
var usedUpCheckPointArray = []

const FDVoice1 = preload("res://Audio/Voices/Falldown/FDVoice1.ogg")
const FDVoice2 = preload("res://Audio/Voices/Falldown/FDVoice2.ogg")
const FDVoice3 = preload("res://Audio/Voices/Falldown/FDVoice3.ogg")
const FDVoice4 = preload("res://Audio/Voices/Falldown/FDVoice4.ogg")
const FDVoice5 = preload("res://Audio/Voices/Falldown/FDVoice5.ogg")
const FDVoice6 = preload("res://Audio/Voices/Falldown/FDVoice6.ogg")
const FDVoice7 = preload("res://Audio/Voices/Falldown/FDVoice7.ogg")
const FDVoice8 = preload("res://Audio/Voices/Falldown/FDVoice8.ogg")
const FDVoice9 = preload("res://Audio/Voices/Falldown/FDVoice9.ogg")

const CPVoice1 = preload("res://Audio/Voices/Checkpoint/CPVoice1.ogg")
const CPVoice2 = preload("res://Audio/Voices/Checkpoint/CPVoice2.ogg")
const CPVoice3 = preload("res://Audio/Voices/Checkpoint/CPVoice3.ogg")
const CPVoice4 = preload("res://Audio/Voices/Checkpoint/CPVoice4.ogg")
const CPVoice5 = preload("res://Audio/Voices/Checkpoint/CPVoice5.ogg")
const CPVoice6 = preload("res://Audio/Voices/Checkpoint/CPVoice6.ogg")
const CPVoice7 = preload("res://Audio/Voices/Checkpoint/CPVoice7.ogg")
const CPVoice8 = preload("res://Audio/Voices/Checkpoint/CPVoice8.ogg")

const WinVoice1 = preload("res://Audio/Voices/Win/WinVoice1.ogg")
const WinVoice2 = preload("res://Audio/Voices/Win/WinVoice2.ogg")
const WinVoice3 = preload("res://Audio/Voices/Win/WinVoice3.ogg")
const WinVoice4 = preload("res://Audio/Voices/Win/WinVoice4.ogg")
const WinVoice5 = preload("res://Audio/Voices/Win/WinVoice5.ogg")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _playCheckpointNoise():
	if usedUpCheckPointArray.size() >= 9:
		usedUpCheckPointArray = []
		
	var cSoundSeed = rng.randi_range(1, 8)
	
	while (usedUpCheckPointArray.has(cSoundSeed)):
		cSoundSeed = rng.randi_range(1, 8)
	pass
	match cSoundSeed:
		1:
			self.stream = CPVoice1
			play()
		2:
			self.stream = CPVoice2
			play()
		3:
			self.stream = CPVoice3
			play()
		4:
			self.stream = CPVoice4
			play()
		5:
			self.stream = CPVoice5
			play()
		6:
			self.stream = CPVoice6
			play()
		7:
			self.stream = CPVoice7
			play()
		8:
			self.stream = CPVoice8
			play()
			
func _playAssholeSound():
	
	if usedUpAssholeAudioArray.size() >= 9:
		usedUpAssholeAudioArray = []
		
	var aSoundSeed = rng.randi_range(1, 9)
	
	while (usedUpAssholeAudioArray.has(aSoundSeed)):
		aSoundSeed = rng.randi_range(1, 9)
		
	match aSoundSeed:
		1:
			self.stream = FDVoice1
			play()
		2:
			self.stream = FDVoice2
			play()
		3:
			self.stream = FDVoice3
			play()
		4:
			self.stream = FDVoice4
			play()
		5:
			self.stream = FDVoice5
			play()
		6:
			self.stream = FDVoice6
			play()
		7:
			self.stream = FDVoice7
			play()
		8:
			self.stream = FDVoice8
			play()
		9:
			self.stream = FDVoice9
			play()
	pass

func _playWinSound():
	var wSoundSeed = rng.randi_range(1, 5)
	match wSoundSeed:
		1:
			self.stream = WinVoice1
			play()
		2:
			self.stream = WinVoice2
			play()
		3:
			self.stream = WinVoice3
			play()
		4:
			self.stream = WinVoice4
			play()
		5:
			self.stream = WinVoice5
			play()

	pass
