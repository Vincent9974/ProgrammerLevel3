import requests
from bs4 import BeautifulSoup
from lxml import etree
import xlwt

music_list = []


def gain_data(url_list):
    global music_list
    title = []
    singer = []
    music_time = []
    music_type = []
    score = []

    for i in range(len(url_list)):
        response = requests.get(url_list[i])
        soup = BeautifulSoup(response.content.decode(), "lxml")

        div  = soup.find("div", {"class":"indent"})
        divs = soup.find_all("div", {"class": "pl2"})
        for div_pl2 in divs:
            title.append(div_pl2.select('a')[0].text)
            content = div_pl2.find("p", {"class":"pl"}).get_text().split('/')
            # print(content)
            singer.append(content[0])
            music_time.append(content[1])
            music_type.append(content[-1])
            # print(div_pl2.find("span", {"class":"rating_nums"}).get_text())
            score.append(div_pl2.find("span", {"class":"rating_nums"}).get_text())

    music_list = list(zip(title, singer, music_time, music_type, score))


    # print(title)
    # print(singer)
    # print(music_time)
    # print(music_type)
    # print(score)


def show_data():
    for i in music_list:
        print(i)


def save_file():
    global music_list
    wb = xlwt.Workbook(encoding='utf-8',style_compression=0)
    sheet = wb.add_sheet('豆瓣信息',cell_overwrite_ok=True)
    cols = ['歌曲名', '表演者', '发行时间', '流派', '评分']
    for i in range(len(cols)):
        sheet.write(0,i,cols[i])

    for row in range(1,len(music_list)):
        for col in range(len(cols)):
            sheet.write(row,col, str(music_list[row-1][col]))
    wb.save("musicList.xls")



if __name__ == '__main__':
    url_list=[
    'http://localhost:8080/douban/douban1.html',
    'http://localhost:8080/douban/douban2.html',
    'http://localhost:8080/douban/douban3.html',
    'http://localhost:8080/douban/douban4.html',
    ]
    gain_data(url_list)
    show_data()
    save_file()
