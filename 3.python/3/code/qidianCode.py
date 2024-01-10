# python3.7
# -*- coding: utf-8 -*-
# @Time     : 2023/2/25
# @Author   :
# @File     : qidianCode.py
# @function : 爬取起点中文网排行榜
# @Software : PyCharm Community Edition
# @Knowledge: requests、BeautifulSoup、写文件
from bs4 import BeautifulSoup
import requests
import xlwt

datas = []

#将数据写入文件
def save_file(fileName):
    # 补全代码
    global datas
    wb = xlwt.Workbook(encoding='utf-8', style_compression=0)
    sheet = wb.add_sheet('起点信息', cell_overwrite_ok=True)
    col = ('序号', '小说名', '小说类型', '简介', '更新情况')
    for i in range(5):
        sheet.write(0, i, col[i])

    for row in range(1, len(datas) + 1):  # 行
        for col in range(5):  # 列
            sheet.write(row, col, str(datas[row - 1][col]))
    wb.save(fileName)
    pass

#获得数据存入datas列表
def gain_data(url):
    # 补全代码
    global datas
    title = []  # 小说名、、
    booktype = []  # 类型
    intro = []  # 简介
    news= []  # 更新情况
    numb=[]

    response = requests.get(url)
    soup = BeautifulSoup(response.content.decode(), 'lxml')

        # 分析得出
        # body = soup.find("div", id='7d', class_="c7d")
    div = soup.find("div", {"class": "rank-view-list"})
    divs = div.find_all("div", {"class": "book-mid-info"})
    i = 1
    for div_pl2 in divs:

            title.append(div_pl2.select('a')[0].text)
            booktype.append(div_pl2.find("p", {"class": "author"}).select('a')[1].text)
            intro.append(div_pl2.find("p", {"class": "intro"}).text)
            news.append(div_pl2.find("p", {"class": "update"}).select('a')[0].text)
            numb.append(str(i))
            i+=1
    datas= list(zip(numb,title, booktype, intro, news))

    pass

#在控制台输出数据
def show_data():
    #补全代码
    for i in datas:
        print(list(i))

    pass

#主程序
if __name__ == "__main__":
    #网址列表
    urllist = ['http://localhost:8080/qidian/yuepiao.html',
             'http://localhost:8080/qidian/hotsales.html',
             'http://localhost:8080/qidian/readindex.html',
             'http://localhost:8080/qidian/newfans.html',
             'http://localhost:8080/qidian/recom.html',
             'http://localhost:8080/qidian/collect.html',
             'http://localhost:8080/qidian/vipup.html',
             'http://localhost:8080/qidian/vipcollect.html']

    choicesList = ["1.月票榜"," 2.畅销榜","3.阅读指数榜","4.书友榜","5.推荐榜","6.收藏榜","7.更新榜","8.VIP收藏榜"]
    print(choicesList)
    choice = int(input('请选择你想查看的榜单:'))
    url = urllist[choice-1]
    gain_data(url)
    show_data()
    save_file(choicesList[choice-1]+".xls")