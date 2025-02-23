extends Area2D

signal notice_enter_next_downedtextbox()

func _ready():
    self.body_entered.connect(self.next_text)

func next_text(_body):
    notice_enter_next_downedtextbox.emit()
    # TextManager._enterd_next_textbox_area()
    self.queue_free()
