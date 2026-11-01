class_name AudioNodesHelper
extends Object

static var nodestr_root: Node


static func connect_custom(callable: Callable, connecting_signal: Signal, one_shot := false, ...custom_args: Array) -> void:
	await connecting_signal
	callable.callv(custom_args)
	if not one_shot:
		connect_custom.callv([callable, connecting_signal, one_shot] + custom_args)


static func node_error(error: String, ...injections: Array) -> void:
	for i in len(injections):
		var element: Variant = injections[i]
		if not is_instance_valid(element) or not element is Node:
			continue
		injections[i] = nodestr(element)
	push_error(error % injections)


static func get_tree() -> SceneTree:
	var main_loop := Engine.get_main_loop()
	if main_loop == null:
		push_error("Cannot get tree root without main loop")
		return null
	return main_loop as SceneTree


static func nodestr(node: Node) -> String:
	if not is_instance_valid(node) or not is_instance_valid(node.get_tree().root):
		return "Invalid Node (%s)" % node

	var root: Node
	if not is_instance_valid(nodestr_root):
		if not is_instance_valid(node.get_tree().root):
			node_error("Cannot find root for %s", node)
			return "Invalid Node (%s)" % node
		root = node.get_tree().root
	elif nodestr_root.get_path_to(node).is_empty():
		node_error("Cannot find root for %s", node)
		return "Invalid Node (%s)" % node
	else:
		root = nodestr_root

	return "%s (%s)" % [node.name, root.get_path_to(node)]


static func get_position3d(of: Variant) -> Vector3:
	var position := Vector3.ZERO

	if of is Vector3:
		position = of

	elif of is Node3D:
		if is_instance_valid(of):
			position = of.global_position

	return position
