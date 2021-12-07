extends ParallaxBackground

const SPEED: float = -0.5

func _process(_delta):
	$ParallaxLayer.motion_offset.x += SPEED
