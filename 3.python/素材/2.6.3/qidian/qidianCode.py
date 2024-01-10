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
    pass

#获得数据存入datas列表
def gain_data(url):
    # 补全代码
    pass

#在控制台输出数据
def show_data():
    #补全代码
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