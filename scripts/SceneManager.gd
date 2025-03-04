extends Node


@onready var gameover_scene: String = "res://scenes/gameover.tscn"
var current_scene: Node
var current_scene_path: String

var tutorial_count: int

signal notice_tutorial_over()

func _ready():
    current_scene = get_tree().current_scene
    current_scene_path = get_tree().current_scene.scene_file_path

    tutorial_count = 0


func go_to_gameover():
    current_scene = get_tree().current_scene
    current_scene_path = get_tree().current_scene.scene_file_path
    scene_change(gameover_scene)

func return_to_current_scene():
    scene_change(current_scene_path)


func go_to_next_scene():
    # stage名は stage1, stage2としてください。
    current_scene_path = get_tree().current_scene.scene_file_path
    var current_scene_name = current_scene_path.get_file()

    var next_stage_int: int = current_scene_name.substr(5).to_int() + 1
    var next_stage: String = "stage" + str(next_stage_int) + ".tscn"
    var next_stage_path: String = "res://scenes/" + next_stage

    # 5ステージ目だった場合 endに遷移
    if next_stage_int > 5:
        scene_change("res://scenes/end.tscn")
    else:
        scene_change(next_stage_path)
        current_scene_path = next_stage_path
        current_scene = get_tree().current_scene



func go_to_tutorial():
    scene_change("res://scenes/tutorial.tscn")
    tutorial_count += 1
    # get_tree().change_scene_to_file("res://scenes/tutorial.tscn")

func go_to_stage1():
    scene_change("res://scenes/stage1.tscn")


func go_to_title_scene() -> void:
    scene_change("res://scenes/title.tscn")


func go_to_ending() -> void:
    scene_change("res://scenes/ending.tscn")


func scene_change(scene_path: String):
    await SceneTransition.play_fadein().animation_finished
    get_tree().change_scene_to_file(scene_path)
    await SceneTransition.play_fadeout()