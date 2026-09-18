class_name SpellsUI
extends Control

@export var organisms_ui : Control
@export var natures_ui : Control


func _on_organisms_button_pressed() -> void:
	natures_ui.visible = false
	organisms_ui.visible = true


func _on_natures_button_pressed() -> void:
	organisms_ui.visible = false
	natures_ui.visible = true
