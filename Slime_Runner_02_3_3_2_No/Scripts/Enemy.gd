extends StaticBody2D

func _process(_delta):
	position -= Vector2(4,0)
	pass


func _on_EnemyArea_area_entered(area):
	print("Enemy")
	if area.name == "Remover":
		queue_free()
		print(area.name)
	else:
		print(area.name)
	#if area.name == "SlimeArea"
		
		
	pass # Replace with function body.
