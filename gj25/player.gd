extends CharacterBody2D

var health = 100
var maxHealth = 100
var xp = 0
var level = 1
var nextXP = 50
var die = false

var SPEED = 150
const JUMP_VELOCITY = -350.0

var maxJumpCount = 1
var jumpCount = 1


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


var dead
var isShooting
var isPointingRight

@onready var anim = get_node("AnimationPlayer") 
#@onready var rb = $RigidBody2D
#@onready var hpLabel = $"../UI/PlayerStats/HP/HPLabel"
#@onready var hpBar = $"../UI/PlayerStats/HP/HealthBar"
#@onready var xpLabel = $"../UI/PlayerStats/XP/XPLabel"
#@onready var xpBar = $"../UI/PlayerStats/XP/XPBar"
#@onready var dmgText = $Label
#@onready var lvlLabel = $"../UI/PlayerStats/LevelLabel"
#@onready var gameplay = $".."
#@onready var PlayerHurt = get_node("PlayerHurt")
#@onready var PlayerShoot = get_node("PlayerShoot")
#@onready var PlayerJump = get_node("PlayerJump")

func _ready():
	anim.play("Idle")
	#gameplay = $".."
	#xpBar.max_value = float(nextXP)
	dead = false

func _physics_process(delta):
	#hpBar.value = health
	#hpLabel.text = str(clamp(health, 0, maxHealth)) + "/" + str(maxHealth)
	#xpBar.value = xp
	#xpLabel.text = "to next: " + str(nextXP-xp)
	#lvlLabel.text = "LVL " + str(level)
	
	#if(xp >= nextXP):
		#gameplay._levelUp()
		#xpBar.max_value = float(nextXP)
		
	#if(health<= 0 && !die):
	#	health = 0
	#	die = true
		
	if(!die):
			
		if not is_on_floor():
			velocity.y += gravity * delta
		else:
			jumpCount = maxJumpCount

		if Input.is_action_just_pressed("ui_accept") and (is_on_floor() || jumpCount > 0):
			velocity.y = JUMP_VELOCITY
			jumpCount-=1
			#if !isShooting:
				#PlayerJump.play()
			anim.play("Jump")
			$Jump.play()
				
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			if direction == -1:
				get_node("AnimatedSprite2D").flip_h = true
				isPointingRight = false
			elif direction == 1:
				get_node("AnimatedSprite2D").flip_h = false
				isPointingRight = true
			velocity.x = direction * SPEED
			if velocity.y == 0: #&& !isShooting:
				anim.play("Run")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			if velocity.y == 0: #&& !isShooting:
				anim.play("Idle")
		if velocity.y > 0:
			anim.play("Fall")
			
		#if !dead:
		#	move_and_slide()

		move_and_slide()
	else:
		#anim.play("Die")
		await get_tree().create_timer(1).timeout
		#sprite.visible = false
		#gameplay._gameOer()

func _on_damage_box_body_entered(body):
	if(body.get_name().contains("Enemy")) :
		if(isPointingRight):
			velocity.y = JUMP_VELOCITY
			velocity.x = JUMP_VELOCITY
		else:
			velocity.y = JUMP_VELOCITY
			velocity.x = -JUMP_VELOCITY
		#PlayerHurt.play()
		#_takeDmg(body.dmg) 
		#body.die = true


func _on_damage_box_area_entered(area):
	if(area.get_name().contains("Enemy") && area.get_parent().die == false) :
		#_takeDmg(area.get_parent().dmg)
		area.get_parent().die = true

#func _takeDmg(dmg = 5):
	#health-=dmg
	#dmgText.displayDmgText(dmg)

func _getExp(expValue = 5):
	xp+=expValue
