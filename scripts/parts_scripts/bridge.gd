extends Node2D

@onready var bridgeTile: TileMap = $BridgeTile
@onready var explosion: AnimatedSprite2D = $Explosion
@onready var explosion2: AnimatedSprite2D = $Explosion2
@onready var explosion3: AnimatedSprite2D = $Explosion3

func bridge_explosion():
    explosion.play("explosion")
    explosion2.play("explosion")
    explosion3.play("explosion")
    bridgeTile.visible = false