extends KinematicBody2D

signal shoot
signal dead

const MAX_SPEED = 400

export (int) var max_health

var gravity = 0
var velocity = Vector2()
var pos = Vector2()
var can_shoot = true
var can_move = true
var alive = true
var health

func _ready():
	health = max_health
	pass
	
func get_input():
	# Detect up/down/left/right keystate and only move when pressed
	velocity = Vector2()
	if Input.is_action_pressed('rightkey'):
		velocity.x += 1
	if Input.is_action_pressed('leftkey'):
		velocity.x -= 1
	if Input.is_action_pressed('downkey'):
		velocity.y += 1
	if Input.is_action_pressed('upkey'):
		velocity.y -= 1
	velocity = velocity.normalized() * MAX_SPEED

func _physics_process(delta):
	if can_move == true:
		get_input()
		move_and_collide(velocity * delta)
	else:
		return

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
