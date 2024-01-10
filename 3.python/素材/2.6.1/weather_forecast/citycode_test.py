import requests
from bs4 import BeautifulSoup

url = "http://localhost:8080/weather/city_code.html"
# 保存文件名
file_name = "city_test.txt"

response = requests.get(url)
soup = BeautifulSoup(response.content.decode(), "lxml")

city = soup.find("td", id="artContent")
print(city)

with open(file_name, 'w', encoding="utf-8") as f:
    for i in city.children:
        if i is not city.p and i.string is not None:
            f.write(i.string + "\n")




