class_name NaturesUI
extends Control


var total_natures : int = 0

var twigs : int = 0
var twigs_cost : int = 1
@export var twigs_count_label : Label
signal twigs_button_pressed

var pebbles : int = 0
var pebbles_cost : int = 1
@export var pebbles_count_label : Label
signal pebbles_button_pressed

var lights : int = 0
var lights_cost : int = 1
@export var lights_count_label : Label
signal lights_button_pressed


signal update_counts


func _on_ready() -> void:
	pass
	
	
func send_counts_update() -> void:
	update_counts.emit(total_natures, twigs, pebbles, lights)


func _on_twigs_button_pressed() -> void:
	twigs_button_pressed.emit(twigs_cost)

func _on_resources_ui_spawned_natures_twigs() -> void:
	twigs += 1
	twigs_count_label.text = "%s" %twigs
	send_counts_update()


func _on_pebbles_button_pressed() -> void:
	pebbles_button_pressed.emit(pebbles_cost)

func _on_resources_ui_spawned_natures_pebbles() -> void:
	pebbles += 1
	pebbles_count_label.text = "%s" %pebbles
	update_counts.emit(twigs, pebbles, lights)
	send_counts_update()


func _on_lights_button_pressed() -> void:
	lights_button_pressed.emit(lights_cost)

func _on_resources_ui_spawned_natures_lights() -> void:
	lights += 1
	lights_count_label.text = "%s" %lights
	send_counts_update()
