extends CanvasLayer

signal transition_finished

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer
@onready var timer = $Timer

var global_player = GlobalVariables.player

func _ready():
    color_rect.visible = false
    animation_player.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(animation_name):
    if animation_name == "fade_in":
        timer.start()
        await timer.timeout

        transition_finished.emit()
        animation_player.play("fade_out")
    elif animation_name == "fade_out":
        color_rect.visible = false

        if global_player.can_interact:
            global_player.can_move = true

func transition():
    global_player.can_move = false
    color_rect.visible = true
    animation_player.play("fade_in")
