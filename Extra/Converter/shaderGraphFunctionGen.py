#
# Shader functions to ShaderGraph converter
#
#
# How to use
#   1. Create the file "./functions.hlsl"
#   2. Execute `python shaderGraphFunctionGen.py`
#   3. Write the input file path "#inlude ./<functions>.hlsl" on "./output_functions.hlsl"
#
# INPUT (functions.hlsl):
#
# float3 RGBToHSL(float3 color)
#
#
# OUTPUT (output_functions.hlsl):
# 
# void RGBToHSLShaderGraph_float(float3 color, out float3 res)
# {
#	res = RGBToHSL(color);
# }
#

import os
import re
import sys

input_file_path = "./functions.hlsl"
output_file_path = "./output_functions.hlsl"

if not os.path.isfile(input_file_path):
	print("Error: create the file, '%s'." % input_file_path)
	sys.exit(1)

r_func_name = re.compile(r"(\w+) (\w+)\((.*)\)")
r_func_params = re.compile(r"(\w+) (\w+)")

rf = open(input_file_path, "r")
wf = open(output_file_path, "w")

for line in rf:
	line = line.rstrip()

	m = r_func_name.search(line)
	#print(m.group(0))
	func_res_type = m.group(1)
	func_name = m.group(2)
	func_params_type = m.group(3)
	# print("func res, func name: %s, %s" % (func_res_type, func_name))


	res = r_func_params.finditer(func_params_type)
	variables = []
	for m in res:
		# param_type = m.group(1)
		param_name = m.group(2)
		# print("%s, %s" % (param_type, param_name))
		variables.append(param_name)
	func_params = ', '.join(variables)


	output_str = f"""void {func_name}ShaderGraph_float({func_params_type}, out {func_res_type} res)
{{
	res = {func_name}({func_params});
}}"""
	#print(output_str)

	wf.write(output_str + "\n\n")

rf.close()
wf.close()