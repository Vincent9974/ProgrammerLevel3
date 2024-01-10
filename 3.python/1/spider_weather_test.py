from bs4 import BeautifulSoup
import requests
import sys
import re

def grain_city_code():
    city = input("请输入城市名:")
    pattern = re.compile("\d+=" + city)
    with open('city.txt', 'r', encoding='utf-8') as f:
        content = f.read()
        ls = pattern.findall(content)
        print(ls[0])
        if not ls:
            print("城市名不正确")
            sys.exit()
        else:
            city_code = ls[0].split("=")[0]
            return city_code

def show_weather(city_code):
    url = "http://localhost:8080/weather/" + city_code + ".html"

    response = requests.get(url)
    soup = BeautifulSoup(response.content.decode(), "lxml")

    body = soup.find("div", id="7d", class_="c7d")

    li = body.ul.findAll("li")

    date = []
    wea = []
    tmpH = []
    temL = []
    wind = []

    for i in li:
        # print(i)
        date.append(i.h1.string)
        p = i.findAll("p")
        # print(p[0].string)
        wea.append(p[0].string)
        wind.append(p[2].em.span["title"] + p[2].i.string)
        # print(p[1])
        if p[1].span is None:
            tmpH.append("none")
        else:
            tmpH.append(p[1].span.string)
        temL.append(p[1].i.string)
    result = list(zip(date, wea,tmpH,temL, wind))
    for i in result:
        print(i)




if __name__ == '__main__':
    code = grain_city_code()
    show_weather(code)