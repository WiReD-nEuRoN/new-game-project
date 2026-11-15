
extends CanvasLayer

@onready var inventory = $Control/Inventory

func _ready():
	inventory.hide()
	print("INVENTORY READY")

func _input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		print("KEY PRESSED: ", event.as_text())

	if event.is_action_pressed("toggle_inventory"):
		inventory.visible = not inventory.visible
		print("INVENTORY: ", inventory.visible)
