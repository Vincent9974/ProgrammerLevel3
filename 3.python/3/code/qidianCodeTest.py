from bs4 import BeautifulSoup
import requests

import xlwt

datas = []


def gain_data(url):
    global datas
    title = []
    book_type = []
    intro = []
    news = []
    numbs = []

    response = requests.get(url)
    soup = BeautifulSoup(response.content.decode(),"lxml")
    div = soup.find("div", {"class": "rank-view-list"})
    divs = div.find_all("div", {"class": "book-mid-info"})
    i = 1
    for div_pl2 in divs:
        title.append(div_pl2.select('a')[0].text)
        book_type.append(div_pl2.find("p", {"class":"author"}).select('a')[1].text)
        intro.append(div_pl2.find("p", {"class":"intro"}).text)
        news.append(div_pl2.find("p", {"class":"update"}).text)
        numbs.append(i)
        i =i+1

    datas = list(zip(numbs, title, book_type, intro, news))


def show_data():
    global datas
    for i in datas:
        print(i)


def save_file(filename):
    global datas
    wb = xlwt.Workbook(encoding='utf-8',style_compression=0)
    sheet = wb.add_sheet('起点信息', cell_overwrite_ok=True)
    cols = ['序号', '小说名', '类型', '简介', '更新情况']

    for i in range(5):
        sheet.write(0,i,cols[i])

    for row in range(1, len(datas) + 1):
        for col in range(5):
            sheet.write(row, col, datas[row-1][col])

    wb.save(filename)




if __name__ == '__main__':
    urllist = ['http://localhost:8080/qidian/yuepiao.html',
             'http://localhost:8080/qidian/hotsales.html',
             'http://localhost:8080/qidian/readindex.html',
             'http://localhost:8080/qidian/newfans.html',
             'http://localhost:8080/qidian/recom.html',
             'http://localhost:8080/qidian/collect.html',
             'http://localhost:8080/qidian/vipup.html',
             'http://localhost:8080/qidian/vipcollect.html']

    choiceList = ['1.月票榜',
                  '2.畅销榜',
                  '3.阅读指数榜',
                  '4.书友榜',
                  '5.推荐榜',
                  '6.收藏榜',
                  '7.更新榜',
                  '8.VIP收藏榜',
                  ]
    print(choiceList)
    choice = int(input("请选择你想要看的榜单\n"))
    url = urllist[choice-1]
    gain_data(url)
    show_data()
    save_file(choiceList[choice-1]+'.xls')

