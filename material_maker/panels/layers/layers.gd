extends VBoxContainer

export(NodePath) var painter = null

# The layer object
var layers

onready var tree = $Tree

func _ready():
	pass

func set_layers(l) -> void:
	layers = l
	tree.layers = l
	tree.update_from_layers(layers.layers, layers.selected_layer)

func _on_Tree_selection_changed(old_selected : TreeItem, new_selected : TreeItem) -> void:
	layers.select_layer(new_selected.get_meta("layer"))

func _on_Add_pressed():
	layers.add_layer()

func _on_Remove_pressed():
	var current = tree.get_selected()
	if current != null:
		layers.remove_layer(current.get_meta("layer"))

func _on_Up_pressed():
	var current = tree.get_selected()
	if current != null:
		layers.move_layer_up(current.get_meta("layer"))

func _on_Down_pressed():
	var current = tree.get_selected()
	if current != null:
		layers.move_layer_down(current.get_meta("layer"))
