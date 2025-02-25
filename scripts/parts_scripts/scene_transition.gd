extends CanvasLayer

@onready var anime_play: AnimationPlayer = $AnimationPlayer

func play_fadein():
    anime_play.play("fade")
    return anime_play

func play_fadeout() -> void:
    anime_play.play_backwards("fade")