extends Node


@onready var gameover_scene: String = "res://scenes/gameover.tscn"

var current_scene: Node
var current_scene_path: String


func _ready():
    current_scene = get_tree().current_scene


func go_to_gameover():
    current_scene = get_tree().current_scene
    current_scene_path = get_tree().current_scene.scene_file_path
    get_tree().change_scene_to_file(gameover_scene)

func return_to_current_scene():
    get_tree().change_scene_to_file(current_scene_path)

func go_to_next_scene(path: String) -> void:
    # TextManager.change_scene()
    get_tree().change_scene_to_file(path)
    current_scene_path = path
    current_scene = get_tree().current_scene


func go_to_title_scene() -> void:
    get_tree().change_scene_to_file("res://scenes/title.tscn")
