extends RichTextLabel

func _on_visibility_changed():
	if self.visible == true:
		var typewritter_tween = create_tween()
		typewritter_tween.tween_property(self, "visible_ratio", 1, 1.8).from(0.0)
