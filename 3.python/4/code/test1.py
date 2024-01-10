import re

text = """This is
a multiline
string with
some pattern."""

# 使用正则表达式匹配以"This"开头，以"pattern"结尾的内容
pattern = re.compile(r'This.*pattern', re.S)

result = pattern.search(text)
print(result.group())