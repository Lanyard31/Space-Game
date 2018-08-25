extends Camera2D

export var scrollspeed = 0.9
var pos = Vector2()


func _ready():
	pass

func _process(delta):
	pos.x += scrollspeed  #Needs proper implementation to not fuck up the bullets
	position = pos