class_name OrganismsUI
extends Control


var total_organisms : int = 0
# var total_autotrophs : int = 0
# var total_saprotrophs : int = 0
# var total_heterotrophs : int = 0

## Autotrophs - Consumes Sunlight, Carbon & Nitrogen; makes Food & Oxygen.
var algae : int = 0
var algae_cost : int = 1
@export var algae_count_label : Label
signal algae_button_pressed

## Saprotrophs - Consumes Detritus & Oxygen; makes Nitrogen & Carbon.
var mold : int = 0
var mold_cost : int = 1
@export var mold_count_label : Label
signal mold_button_pressed

## Heterotrophs - Consumes Food & Oxygen; makes Detritus & Carbon.
var critters : int = 0
var critters_cost : int = 1
@export var critters_count_label : Label
signal critters_button_pressed


signal update_counts


func _on_ready() -> void:
	calculate_total_organisms()
	
	
func calculate_total_organisms() -> void:
	total_organisms = 0
	total_organisms += algae
	total_organisms += mold
	total_organisms += critters
	

func send_counts_update() -> void:
	update_counts.emit(total_organisms, algae, mold, critters)
	
	
func update_labels() -> void:
	algae_count_label.text = "%s" %algae
	mold_count_label.text = "%s" %mold
	critters_count_label.text = "%s" %critters
	

func update_pond() -> void:
	update_labels()
	calculate_total_organisms()
	send_counts_update()
	

func starve_autotrophs(_subtrahend:int) -> void:
	@warning_ignore("narrowing_conversion")
	algae *= 0.9
	update_pond()
	

func starve_saprotrophs(_subtrahend:int) -> void:
	@warning_ignore("narrowing_conversion")
	mold *= 0.9
	update_pond()
	

func starve_heterotrophs(_subtrahend:int) -> void:
	@warning_ignore("narrowing_conversion")
	critters *= 0.9
	update_pond()


func _on_algae_button_pressed() -> void:
	algae_button_pressed.emit(algae_cost)

func _on_resources_ui_spawned_organisms_algae() -> void:
	algae += 1
	update_pond()


func _on_mold_button_pressed() -> void:
	mold_button_pressed.emit(mold_cost)

func _on_resources_ui_spawned_organisms_mold() -> void:
	mold += 1
	update_pond()


func _on_critters_button_pressed() -> void:
	critters_button_pressed.emit(critters_cost)

func _on_resources_ui_spawned_organisms_critters() -> void:
	critters += 1
	update_pond()


func _on_resources_ui_depleted_sunlight(subtrahend:int) -> void:
	starve_autotrophs(subtrahend)


func _on_resources_ui_depleted_oxygen(subtrahend:int) -> void:
	starve_saprotrophs(subtrahend)
	starve_heterotrophs(subtrahend)


func _on_resources_ui_depleted_nitrogen(subtrahend:int) -> void:
	starve_autotrophs(subtrahend)


func _on_resources_ui_depleted_food(subtrahend:int) -> void:
	starve_heterotrophs(subtrahend)


func _on_resources_ui_depleted_detritus(subtrahend:int) -> void:
	starve_saprotrophs(subtrahend)


func _on_resources_ui_depleted_carbon(subtrahend:int) -> void:
	starve_autotrophs(subtrahend)


func _on_resources_ui_depleted_arcana() -> void:
	print("Arcana depleted!")
