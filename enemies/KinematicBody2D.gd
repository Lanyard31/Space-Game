extends KinematicBody2D

signal shoot
export (PackedScene) var Bullet
var can_shoot = true
export (int) var max_health

var nums = [5,15,30,45,60,75,90,110,115,130,145,160,175] #list to choose from
#return nums[randi() % nums.size()]

func _ready():
	randomize()

#func rotator
#	$Sprite/Muzzle.global_rotation

func shoot():
	if can_shoot:
		can_shoot = false
		$GunTimer.start()
		var dir = (Vector2(1, 0).rotated($Sprite/Muzzle.global_rotation) * nums[randi() % nums.size()])
		emit_signal('shoot', Bullet, $Sprite/Muzzle.global_position, dir)

func _on_GunTimer_timeout():
	can_shoot = true