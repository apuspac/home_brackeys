extends Control


func _unhandled_input(event):
    if (event.is_action_pressed("ui_accept")):
        SceneManager.go_to_title_scene()
