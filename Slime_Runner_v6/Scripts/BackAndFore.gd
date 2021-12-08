extends ParallaxBackground

const SPEED: float = -0.3

func _process(_delta):
	$ParallaxLayer.motion_offset.x += SPEED
