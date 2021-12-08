extends ParallaxBackground

const SPEED: float = -1.0

func _process(_delta):
	$ParallaxLayer2.motion_offset.x += SPEED
