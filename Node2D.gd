extends KinematicBody2D

export var speed = 300
var velocity = Vector2.ZERO

func _ready():
	$".".position = Global.char_position
	OS.center_window()
	
onready var _animated_sprite = $AnimatedSprite

func _physics_process(delta):
	velocity = Vector2.ZERO
	

	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		_animated_sprite.flip_h = false
	elif Input.is_action_pressed("move_left"):
		velocity.x -= 1
		_animated_sprite.flip_h = true
		
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	elif Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)
	
	if velocity.length() > 0:
		_animated_sprite.play("walk")
	else:
		_animated_sprite.play("idle")


func _on_House1_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	Global.char_position = Vector2(3,254)
	get_tree().change_scene("res://scene/House1-Interior.tscn")

func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	Global.char_position = Vector2(563,475)
	get_tree().change_scene("res://World Map.tscn")

func _on_Cave1_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	Global.char_position = Vector2(4,-67)
	get_tree().change_scene("res://scene/Cave_Interior.tscn")

func _on_caveArea2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	Global.char_position = Vector2(-586,440)
	get_tree().change_scene("res://World Map.tscn")
