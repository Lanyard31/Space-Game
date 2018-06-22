extends Sprite

var pos = Vector2()

func _ready():
	pass

func _physics_process(delta):
	pos.x -= 0.7
	position = pos