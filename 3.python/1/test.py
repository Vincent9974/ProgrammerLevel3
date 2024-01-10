import re

# 用户输入的城市名
city = input("请输入城市名：")

# 构建正则表达式模式
pattern = re.compile('\d+=' + city)

# 包含城市代码的文本
text = "42=NewYork, 36=LosAngeles, 18=Chicago"

# 在文本中查找匹配项
matches = pattern.findall(text)

# 输出匹配结果
if matches:
    print("找到匹配项：", matches)
else:
    print("未找到匹配项")
