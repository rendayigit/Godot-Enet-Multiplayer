# https://youtu.be/K62jDMLPToA
# https://youtu.be/M0LJ9EsS_Ak


extends Node


@export var player_scene: PackedScene
@export var server_port = 1234


var peer = ENetMultiplayerPeer.new()


func _add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	call_deferred("add_child", player)


func _on_host_button_pressed():
	peer.create_server(server_port)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_player)
	_add_player()
	
	$HBoxContainer.queue_free()


func _on_join_button_pressed():
	peer.create_client("localhost", server_port)
	multiplayer.multiplayer_peer = peer

	$HBoxContainer.queue_free()
