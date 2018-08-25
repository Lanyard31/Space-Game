extends Node2D

var pos = Vector2()
var screen_size = Vector2()

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	#An attempt to clamp the player onto the screen
	#$Player.position.x = clamp(position.x, 0, $Camera2D.get_viewport_rect())
	#$Player.position.y = clamp(position.y, 0, $Camera2D.get_viewport_rect())
	pass

	
func on_shoot(bullet, _position, _direction):
	var b = bullet.instance()
	add_child(b)
	b.start(_position, _direction)
