extends Sprite

var pos = Vector2()

func _ready():
	pass

func _physics_process(delta):
	#pos.x -= 0.7   Needs proper implementation to not fuck up the bullets
	#position = pos
	pass
	
func _on_shoot(bullet, _position, _direction):
	var b = bullet.instance()
	add_child(b)
	b.start(_position, _direction)