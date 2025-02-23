extends Area2D

func _ready():
    self.body_entered.connect(self.next_text)

func next_text(_body):
    SceneManager.go_to_gameover()