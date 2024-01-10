# python3.7
# -*- coding: utf-8 -*-
# @File     : doubanMusic.py
# @function : 爬取豆瓣音乐Top250前4页数据，并将数据存储到Excel文件中
# @Software : PyCharm Community Edition
# 爬取的信息有： 歌曲名、表演者、发行时间、流派、评分等

import requests
from bs4 import BeautifulSoup
from lxml import etree
import xlwt

musicList = []
#将数据写入文件
def save_file():
    # 补全代码
    global musicList
    wb = xlwt.Workbook(encoding='utf-8', style_compression=0)
    sheet = wb.add_sheet('豆瓣信息', cell_overwrite_ok=True)
    col = ('歌曲名', '表演者', '发行时间', '流派', '评分')
    for i in range(5):
        sheet.write(0, i, col[i])

    for row in range(1,len(musicList)+1):  # 行
        for col in range(0, 5):  # 列
            sheet.write(row, col, str(musicList[row-1][col]))
    wb.save('musicList.xls')

#获取数据存入musicList列表
def gain_data(urllist):
    # 补全代码
    global musicList
    title = []  # 歌曲名
    singer = []  # 表演者
    music_time = []  # 发行时间
    music_type = []  # 流派
    score = []  # 评分
    for i in range(len(urllist)):
        response = requests.get(urllist[i])
        soup = BeautifulSoup(response.content.decode(), 'lxml')

    # 分析得出==
    # body = soup.find("div", id='7d', class_="c7d")
        div = soup.find("div", {"class": "indent"})
        divs = div.find_all("div", {"class": "pl2"})
        for div_pl2 in divs:
            title.append(div_pl2.select('a')[0].text)
            content = div_pl2.find("p", {"class": "pl"}).get_text().split('/')  # 将找到的内容以/为分隔符进行分隔返回分割后的字符串列表
            singer.append(content[0])
            music_time.append(content[1])
            music_type.append(content[-1])
            score.append(div_pl2.find("span", {"class": "rating_nums"}).get_text())
        musicList = list(zip(title, singer, music_time, music_type, score))

    pass

#在控制台输出数据
def show_data():
    # 补全代码
    for i in musicList:
        print(list(i))
    pass

#主程序
if __name__ == "__main__":
    #网址列表
    urllist = ['http://localhost:8080/douban/douban1.html',
               'http://localhost:8080/douban/douban2.html',
               'http://localhost:8080/douban/douban3.html',
               'http://localhost:8080/douban/douban4.html']
    gain_data(urllist)
    show_data()
    save_file()
