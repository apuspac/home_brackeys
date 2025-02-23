extends Area2D



func _ready():
    self.body_entered.connect(self.next_text)

func next_text(_body):
    SceneManager.return_to_current_scene()