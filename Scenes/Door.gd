extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var game_manager = %GameManager

var door_opened = false
var maxCoins = 5

func _on_body_entered(CharacterBody2D):
	if door_opened == false: 
		animated_sprite_2d.play("default")
		door_opened = true
		
func _on_body_exited(CharacterBody2D):
	if door_opened == true: 
		animated_sprite_2d.play("close")
		door_opened = false

func _process(_delta):
	if Input.is_action_just_pressed("door_enter") and game_manager.get_cur_level() == 4:
			get_tree().quit()
	if  game_manager.get_coins() == 5 and door_opened and Input.is_action_just_pressed("door_enter") and animated_sprite_2d.animation_finished:
		game_manager.cur_level_to_next()
		print(game_manager.get_cur_level())
		get_tree().change_scene_to_file("res://Scenes/Level " + str(game_manager.get_cur_level()) + ".tscn")
		
