# python3.7
# -*- coding: utf-8 -*-
# @File     : doubanMusic.py
# @function : 爬取豆瓣音乐Top250前4页数据，并将数据存储到Excel文件中
# @Software : PyCharm Community Edition
# 爬取的信息有： 歌曲名、表演者、发行时间、流派、评分等

import requests
from lxml import etree
import xlwt

musicList = []
#将数据写入文件
def save_file():
    # 补全代码
    pass

#获取数据存入musicList列表
def gain_data(urllist):
    # 补全代码
    pass

#在控制台输出数据
def show_data():
    # 补全代码
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
