extends Area2D


func _ready():
    self.body_entered.connect(self.next_text)

func next_text(_body):
    TextManager._enterd_next_textbox_area()
    self.queue_free()