extends Node2D

var score = 000000
var timer = null
var Enemy = load("res://Scenes/Enemy.tscn")

func _ready():
	timer = Timer.new()
	self.add_child(timer)
	timer.connect("timeout",self,"_Add_Enemy")
	timer.set_wait_time(rand_range(1.8, 4.5))
	timer.set_one_shot(false)
	timer.start()

func _Add_Enemy():
	var Enemy_instance = Enemy.instance()
	Enemy_instance.name = "Enemy"
	Enemy_instance.position = Vector2(650, 139)
	Enemy_instance.scale.x = rand_range(0.9, 1.2)
	Enemy_instance.scale.y = Enemy_instance.scale.x
	Enemy_instance.get_node("Sprite").frame = rand_range(0, 5)
	self.add_child(Enemy_instance)

func _physics_process(_delta):
	$GameOver.visible = false
	$CanvasLayer/Score.text = str(score)
	score = score+1


func _on_Restart_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false
	
	pass
