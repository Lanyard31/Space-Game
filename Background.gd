extends Sprite

var pos = Vector2()

func _ready():
	pass

func _process(delta):
	pos.x -= 0.08
	position = pos