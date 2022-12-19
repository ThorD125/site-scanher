import re
import argparse



parser = argparse.ArgumentParser()
parser.add_argument('parameter', type=str, help='an integer parameter')


args = parser.parse_args()
parameter = args.parameter


def replace_multiple_spaces(string):
	pattern = re.compile(r"\s+")
	new_string = pattern.sub(" ", string)
	return new_string


def lazy_grep(string):
	return replace_multiple_spaces(string).split("</tr>")



input_string = open(parameter, "r").read()
#input_string = parameter
#print(input_string)

my_list = [">0</td>", "Content Security Policy Configuration", "</tbody>"]


for my_string in lazy_grep(input_string):
	if all(x not in my_string for x in my_list):
		f =open("tables", "a")
		f.write(mystring.trim())
		f.close()
