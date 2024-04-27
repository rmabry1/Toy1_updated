extends Node


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://source/node.tscn")


func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://source/level_2.tscn")
