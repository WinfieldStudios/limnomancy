class_name PrototypeClicker
extends Control
## A Clicker Prototype


@export var label : Label

var sunlight : int = 0


## Underscore functions are called from outside this script
func _ready() -> void:
	update_label_text()


## Makes 1 Sunlight
func create_sunlight() -> void:
	sunlight += 1
	update_label_text()


## Updates the UI to display the user's sunlight count
func update_label_text() -> void:
	label.text = "Sunlight: %s" %sunlight


## When the func name starts with an underscore, then it gets called from a signal
func _on_button_pressed() -> void:
	create_sunlight()
