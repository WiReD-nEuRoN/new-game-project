extends CanvasLayer

@onready var inventory = $Control/Inventory


func _ready():
	inventory.hide()
	print("INVENTORY SCRIPT WORKING")


func _input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		print("KEY PRESSED: ", event.as_text())

		if event.keycode == KEY_I or event.keycode == KEY_SHIFT:
			inventory.visible = not inventory.visible
			print("INVENTORY TOGGLED: ", inventory.visible)
