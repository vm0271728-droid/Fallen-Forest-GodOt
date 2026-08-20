shader_type spatial;
render_mode cull_disabled;

uniform sampler2D albedo_texture : source_color, filter_linear_mipmap, repeat_enable;
uniform bool use_albedo_texture = false;
uniform vec4 albedo_color : source_color = vec4(1.0);
uniform sampler2D normal_texture : hint_normal, filter_linear_mipmap, repeat_enable;
uniform bool use_normal_texture = false;
uniform float roughness_value : hint_range(0.0, 1.0) = 0.9;
uniform float metallic_value : hint_range(0.0, 1.0) = 0.0;

uniform float object_height = 1.0;
uniform float wind_amplitude = 0.05;
uniform float wind_speed = 1.0;
uniform float spatial_frequency = 0.08;
uniform float gust_strength : hint_range(0.0, 1.5) = 0.55;
uniform float master_strength : hint_range(0.0, 2.0) = 1.0;
uniform vec2 wind_direction = vec2(0.78, 0.62);

void vertex() {
	vec3 world_pos = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
	float safe_height = max(object_height, 0.05);
	float height_weight = smoothstep(0.02, safe_height, max(VERTEX.y, 0.0));

	float broad = sin(TIME * wind_speed + dot(world_pos.xz, wind_direction) * spatial_frequency);
	float detail = sin(TIME * wind_speed * 1.73 + world_pos.x * 0.19 - world_pos.z * 0.14) * 0.32;
	float gust = 0.55 + 0.45 * sin(TIME * 0.21 + world_pos.x * 0.011 + world_pos.z * 0.017);
	float strength = (broad + detail) * (0.45 + gust * gust_strength) * wind_amplitude * master_strength * height_weight;

	vec2 direction = normalize(wind_direction + vec2(0.0001));
	VERTEX.xz += direction * strength;
}

void fragment() {
	vec4 sampled = use_albedo_texture ? texture(albedo_texture, UV) : vec4(1.0);
	ALBEDO = sampled.rgb * albedo_color.rgb;
	ALPHA = sampled.a * albedo_color.a;
	ALPHA_SCISSOR_THRESHOLD = 0.35;
	ROUGHNESS = roughness_value;
	METALLIC = metallic_value;
	if (use_normal_texture) {
		NORMAL_MAP = texture(normal_texture, UV).rgb;
		NORMAL_MAP_DEPTH = 1.0;
	}
}
