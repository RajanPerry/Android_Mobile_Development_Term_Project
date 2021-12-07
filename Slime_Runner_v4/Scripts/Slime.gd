extends KinematicBody2D

const UP = Vector2(0, -1)
const ACCELERATION = 50

var gravity = 175
var maxGravity = 250
var jumpForce = 1500
var motion = Vector2()

func _physics_process(_delta):
	motion.y += gravity
	motion.y = min(motion.y, maxGravity)
#	if motion.y > maxGravity:
#		motion.y = maxGravity
		
	if is_on_floor():
		$AnimatedSprite.animation = "Walking"
		if Input.is_action_just_pressed("UP"):
			motion = jumpForce * UP
			$AnimatedSprite.animation = "Jumping"
	else:
		if motion.y != 0:
			$AnimatedSprite.animation = "Jumping"
		#else:
			#$AnimatedSprite.animation = "Landing"
			
		
	motion = move_and_slide(motion , UP)

func _on_SlimeArea_area_entered(area):
	print(area.name)
	if area.name == "EnemyArea":
		#print("slime")
		get_tree().paused = true
		#$AnimatedSprite.animation = "Death"
		$AnimatedSprite.animation = "Landing"
		get_parent().get_node("GameOver").show()
