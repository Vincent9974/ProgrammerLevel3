# @File     : spider_weather.py
# @function : 输入城市名北京，在文件中查找城市编码，通过编码获得url，爬取页面的天气预报
# @Software : PyCharm Community Edition
# @Knowledge: BeautifulSoup、正则表达式

from bs4 import BeautifulSoup
import re
import requests
import sys  # 用于sys.exit()


def gain_city_code():
    city = input("请输入城市名：")
    pattern = re.compile('\d+=' + city)
    with open("city.txt", "r", encoding='utf-8') as f:
        content = f.read()
        ls = pattern.findall(content)
        if not ls:
            print("城市名不正确")
            sys.exit()
        else:
            city_code = ls[0].split("=")[0]
            return city_code


def show_weather(city_code):
    url = "http://localhost:8080/weather/" + city_code + '.html'
    response = requests.get(url)
    soup = BeautifulSoup(response.content.decode(), 'lxml')

    # 分析得出
    body = soup.find("div", id='7d', class_="c7d")

    li = body.ul.findAll("li")

    date = []  # 日期
    wea = []  # 天气
    temH = []  # 最高温
    temL = []  # 最低温
    win = []  # 风

    for i in li:
        date.append(i.h1.string)  # 日期
        p = i.findAll("p")
        wea.append(p[0].string)  # 天气
        win.append(p[2].em.span["title"] + p[2].i.string)  # 风
        if p[1].span is None:
            temH.append("None")  # 可能没有
        else:
            temH.append(p[1].span.string)  # 最高温
        temL.append(p[1].i.string)  # 最低温

    result = list(zip(date, wea, temH, temL, win))
    for i in result:
        print(i)


if __name__ == "__main__":
    code = gain_city_code()
    show_weather(code)
