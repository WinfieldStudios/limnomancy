class_name PrototypeGenerator
extends Control
## A Generator Prototype


@export var label : Label
@export var button : Button
@export var timer : Timer

var sunlight : int = 0


func _ready() -> void:
	update_label_text()


## Makes 1 Sunlight
func create_sunlight() -> void:
	sunlight += 1
	update_label_text()


## Updates the UI to display the user's sunlight count
func update_label_text() -> void:
	label.text = "Sunlight: %s" %sunlight
	

## I used Search Help (top right) to learn how the timer works
func begin_generating_sunlight() -> void:
	timer.start()
	button.disabled = true


## "signal up, call down"
func _on_button_pressed() -> void:
	begin_generating_sunlight()


## triggers when timer times out; and then timer will start back up at set interval via inspector
func _on_timer_timeout() -> void:
	create_sunlight()
