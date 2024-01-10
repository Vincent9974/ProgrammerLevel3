# @File     : baidu_news_info.py
# @function : 提取百度新闻的标题、网址、日期和来源-并保存到excel文件
# @Software : PyCharm Community Edition，谷歌Chrome浏览器
# @Knowledge: requests、正则表达式、pandas

import requests
import re
from bs4 import BeautifulSoup
import pandas as pd

url='http://localhost:8080/baidu/百度资讯搜索_阿里巴巴.html'

title=[] #标题
href=[] #网址
date=[] #日期
source=[] #来源

#补全代码：使用 BeautifulSoup或requests获取网站返回的源码
res = requests.get(url)
#soup = BeautifulSoup(res.content.decode(), "lxml")
#print(soup.prettify())
res.encoding='utf-8'
#print(res.text)
#正则表达式提取内容:标题，网址，日期，来源
def get_news_title():
    #正则表达式提取内容:标题
    #补全代码
    global  title
    p_title = '标题：(.*?)"'
    title = re.findall(p_title, res.text, re.S)


    pass

def get_news_href():
    #正则表达式提取内容:网址
    #补全代码
    pattern_herf = '<h3 class="news-title_1YtI1 "><a href="(.*?)"'
    global href
    #pattern_herf='mu="(.*?)"'
    #pattern_herf = '<h3 class="news-title_1YtI1">.*?href="(.*?)"'

    href= re.findall(pattern_herf, res.text, re.S)

    pass
    
def get_news_date():
    #正则表达式提取内容:日期   
    #补全代码
    global date
    p_date = '发布于：(.*?)"'
    date = re.findall(p_date, res.text, re.S)

    pass

def get_news_source():
    #正则表达式提取内容:来源
    global source
    p_source = '新闻来源：(.*?)"'  # 用（.*?）来提取内容
    source = re.findall(p_source, res.text, re.S)  # 由于（.*?）无法匹配换行，所以要给出re.S参数，在查找时才自动考虑换行，否则提取不到内容

    #补全代码
    pass

if __name__ == "__main__":   
    #补全代码：打印输出新闻列表，包括的字段为：序号，“.”分隔符，标题，日期，来源，网址
    get_news_title()
    get_news_source()
    get_news_date()
    get_news_href()

    for i in range(len(title)):
        print(str(i + 1) + '.' + title[i] + '(' + date[i] + '-' + source[i] + ')')
        #print(href[i+4])
        print(href[i])
    pass 
    
    #补全代码：将新闻列表信息保存到excel文件，excel文件的表头为“标题，日期，来源，网址”，文件名自拟
    dict1 = {
        '标题': title,
        '网址': href,
        '来源': source,
        '日期': date
    }
    file = pd.DataFrame(dict1)
    # 写入文件
    file.to_excel('news_list.xlsx', index=False)
    pass    