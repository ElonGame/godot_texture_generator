
const BlurShader = preload("./../gaussian_blur.shader")

const family = "composition"
const category = "Effects"

const inputs = [
	{"name": "in", "type": "vec4", "default": 0}
]

const params = [
	{"name": "amount", "type": "int", "default": 10.0}
]

const outputs = [
	{"name": "out", "type": "scalar"}
]

static func process_composition(ctx):
	var mat = ctx.material
	
	if ctx.iteration == 0:
		mat.shader = BlurShader
		mat.set_shader_param("u_radius", ctx.get_param("amount"))
		return false
	
	elif ctx.iteration == 1:
		return false
	
	return true

