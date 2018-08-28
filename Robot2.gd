extends KinematicBody2D

signal shoot
export (PackedScene) var Bullet
var can_shoot = true
export (int) var max_health

var nums = [3,4,6,10,11,12] #list to choose from
#return nums[randi() % nums.size()]

func _ready():
	$GunTimer.start()
	randomize()

func _process():
	shoot()

#func rotator
#	$Sprite/Muzzle.global_rotation

func shoot():
	print("RoboShot")
	if can_shoot:
		can_shoot = false
		$GunTimer.start()
		var dir = Vector2(1, 0).rotated(nums[randi() % nums.size()])
		emit_signal('shoot', Bullet, $Sprite/Muzzle.global_position, dir)

func _on_GunTimer_timeout():
	can_shoot = true

func _on_Shooter_timeout():
	shoot()
