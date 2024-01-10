import  requests
import re
from bs4 import BeautifulSoup
import pandas as pd

url = "http://localhost:8080/baidu/百度资讯搜索_阿里巴巴.html"
res = requests.get(url)
res.encoding = 'utf-8'

title = []
href = []
date = []
source = []


def get_news_title():
    global title
    p_title = '标题：(.*?)"'
    title = re.findall(p_title, res.text, re.S)


def get_news_source():
    global source
    p_source = '新闻来源：(.*?)"'
    source = re.findall(p_source,res.text, re.S)


def get_news_date():
    global date
    p_date = '发布于：(.*?)"'
    date = re.findall(p_date, res.text, re.S)


def get_news_href():
    p_href = '<h3 class="news-title_1YtI1 "><a href="(.*?)"'
    global href
    href = re.findall(p_href, res.text, re.S)


if __name__ == '__main__':
    get_news_title()
    get_news_source()
    get_news_date()
    get_news_href()

    # print(date)

    for i in range(len(title)):
        print(str(i+1)+'.' + title[i] + "(" + date[i] + "-" + source[i] + ")")
        print(href[i])

    dict1 = {
        '标题': title,
        '网址': href,
        '来源': source,
        '日期': date
    }
    file = pd.DataFrame(dict1)
    file.to_excel('news_list.xlsx', index=False)