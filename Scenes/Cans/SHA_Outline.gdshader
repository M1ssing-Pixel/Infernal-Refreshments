shader_type canvas_item;

uniform bool strength = false;
uniform vec4 outline_colour : source_color = vec4(1.0);
uniform float outline_depth : hint_range(0, 10) = 1.0;

const vec2 offsets[8] = {
	vec2(-1, -1), vec2(-1, 0), vec2(-1, 1), vec2(0, -1), vec2(0, 1), 
	vec2(1, -1), vec2(1, 0), vec2(1, 1)
};

void fragment() {
	if (strength == true) {
		vec2 pixel_size = TEXTURE_PIXEL_SIZE * outline_depth;
		float get_outline = 0.0;
		
		for (int i = 0; i < offsets.length(); i++) {
			get_outline += texture(TEXTURE, UV + pixel_size * offsets[i]).a;
		}
		
		get_outline = min(get_outline, 1.0);
		vec4 colour = texture(TEXTURE, UV);
		COLOR = mix(colour, outline_colour, get_outline - colour.a);
	}
}