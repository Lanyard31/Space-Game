extends KinematicBody2D

signal shoot
signal dead

const MAX_SPEED = 350

export (int) var max_health

var rotation_speed = 0.02
var rot_dir = 0
var gravity = 0
var velocity = Vector2()
var can_shoot = true
var can_move = true
var alive = true
var health
var boost = 75
var BoostReady = true

func _ready():
	health = max_health
	$AnimationPlayer.queue("idle")
	
func get_input():
	# Detect up/down/left/right keystate and only move when pressed
	velocity = Vector2()
	if Input.is_action_pressed('rightkey'):
		velocity.x += 1
	if Input.is_action_pressed('leftkey'):
		velocity.x -= 1
	if Input.is_action_pressed('downkey'):
		velocity.y += 1
		$AnimationPlayer.queue("down")
	if Input.is_action_pressed('upkey'):
		velocity.y -= 1
		$AnimationPlayer.queue("up")
	if Input.is_action_just_released('upkey') and $AnimationPlayer.is_playing():
		$AnimationPlayer.stop(false)
		$AnimationPlayer.clear_queue()
		$AnimationPlayer.queue("uprecovery")
		$AnimationPlayer.clear_queue()
		$AnimationPlayer.queue("idle")
	if Input.is_action_just_released('downkey') and $AnimationPlayer.is_playing():
		$AnimationPlayer.stop(false)
		$AnimationPlayer.clear_queue()
		$AnimationPlayer.queue("downrecovery")
		$AnimationPlayer.clear_queue()
		$AnimationPlayer.queue("idle")
	velocity = velocity.normalized() * MAX_SPEED
	
	#Boost Logic
	if BoostReady == false:
		return #later implement boostfail flash
	else:
		if Input.is_action_pressed('spacekey') and Input.is_action_pressed('upkey'):
			position.y -= boost
			$BoostTimer.start()
			BoostReady = false
		if Input.is_action_pressed('spacekey') and Input.is_action_pressed('downkey'):
			position.y += boost
			$BoostTimer.start()
			BoostReady = false
		if Input.is_action_pressed('spacekey') and Input.is_action_pressed('leftkey'):
			position.x -= boost
			$BoostTimer.start()
			BoostReady = false
		if Input.is_action_pressed('spacekey') and Input.is_action_pressed('rightkey'):
			position.x += boost
			$BoostTimer.start()
			BoostReady = false
		if Input.is_action_pressed('spacekey') and !Input.is_action_pressed('upkey') and !Input.is_action_pressed('downkey') and !Input.is_action_pressed('leftkey'):
			position.x += boost
			$BoostTimer.start()
			BoostReady = false
	

func _physics_process(delta):
	if can_move:
		move_and_collide(velocity * delta)
	else:
		return
		
func _process(delta):
	get_input()
	
func _on_BoostTimer_timeout():
	BoostReady = true
	
			#rotation += (rotation_speed * rot_dir)
		#$Rot_Timer.start()
	# Below this point lies discarded code I might need later
#	set_animation()
#func rotation_check():
#	if rotation > 1:
#		rotation == 1
#	if rotation < 1:
#		rotation == 1
#	pass
#func set_animation():
#	if upbank:
#		if readytobank:
#			$AnimationPlayer.play("up")
#	elif downbank:
#		$AnimationPlayer.play("down")
	#elif upbank == false and downbank == false:
		#$AnimationPlayer.play('idle')
		
#func _on_Rot_Timer_timeout():
#	self.global_rotation == 0
#
# Below this point lies discarded code I might need later
#func _physics_process(delta):
#	velocity.y += delta * gravity
#	if not can_move:
#		return
#	else:
#		if Input.is_action_pressed("leftkey"):
#			velocity.x = -MAX_SPEED
#		else:
#			velocity.x = 0
#		move_and_slide(velocity, Vector2(0, 0))
#		if Input.is_action_pressed("rightkey"):
#			velocity.x =  MAX_SPEED
#		else:
#			velocity.x = 0
#		move_and_slide(velocity, Vector2(0, 0))
#		if Input.is_action_pressed("upkey"):
#			velocity.y = -MAX_SPEED
#		else:
#			velocity.y = 0
#		move_and_slide(velocity, Vector2(0, 0))
#		if Input.is_action_pressed("downkey"):
#			velocity.y =  MAX_SPEED
#		else:
#			velocity.y = 0
#		move_and_slide(velocity, Vector2())
#func _physics_process(delta):
#	if not alive:
#		return
#	if not can_move:
#		return
#	elif Input.is_action_pressed("rightkey"):
#		velocity = Vector2(max_speed, 0)
#	#elif Input.is_action_pressed('leftkey'):
#	#	velocity.x =  -max_speed
#	else:
#		velocity = 0
#	pos += Vector2(velocity)
#	position == pos
	#if Input.is_action_pressed('turn_left'):
	#	rot_dir -= 1
	#rotation += rotation_speed * rot_dir * delta
	#velocity = Vector2()
	#if Input.is_action_pressed('forward'):
	#	velocity = Vector2(max_speed, 0).rotated(rotation)
	#if Input.is_action_pressed('back'):
	#	velocity = Vector2(-max_speed/2, 0).rotated(rotation)
	#if Input.is_action_just_pressed('click'):
	#	shoot()
	#position.x = clamp(position.x, $Camera2D.limit_left, $Camera2D.limit_right)
	#position.y = clamp(position.y, $Camera2D.limit_top, $Camera2D.limit_bottom)


#func _on_AnimationPlayer_animation_finished(anim_name):
	#$AnimationPlayer.play_backwards(anim_name)


#func _on_BankUpTimer_timeout():
#	$AnimationPlayer.play("up")