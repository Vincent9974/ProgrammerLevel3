# @File     : 爬取城市编码.py
# @function : #爬取所有城市的编码
# @Software : PyCharm Community Edition
# @Knowledge: BeautifulSoup、写文件

import requests
from bs4 import BeautifulSoup


# 使用requests库发送请求
def spider_city_code():
    # 请求的网址
    url = "http://localhost:8080/weather/city_code.html"
    # 保存的文本文件名
    file_name = "city.txt"

    response = requests.get(url)
    soup = BeautifulSoup(response.content.decode(), "lxml")

    city = soup.find("td", id="artContent")
    print(city)
    with open(file_name, 'w', encoding='utf-8') as f:
        for i in city.children:
            if i is not city.p and i.string is not None:
                f.write(i.string + "\n")


if __name__ == "__main__":
    cityode = spider_city_code()
