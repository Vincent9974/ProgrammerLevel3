# @File     : douban_movie_top_250.py
# @function : 爬取豆瓣电影排行榜Top 250部电影的片名、海报图片地址并下载海报图片
# @Software : PyCharm Community Edition，谷歌Chrome浏览器
# @Knowledge: requests、正则表达式、图片下载

import requests
import re


# 豆瓣音乐排行榜海报网址
url='http://localhost:8080/douban/douban_movie_top 250.html'
#补全代码：使用requests库发送请求并获取返回结果
res = requests.get(url)
res.encoding='utf-8'
#print(res.text)
title=[] #标题
href=[] #图片网址
#通过正则表达式获取片名title
def get_movie_title():
    #补全代码
    global title
    p_title = '<img src=.*?alt="(.*?)"'#<img src="./douban1_files/s2967252.jpg" alt="Jason Mraz - We Sing. We Dance. We Steal Things." style="width: 80px; max-height: 120px;">
    title = re.findall(p_title, res.text, re.S)

    pass
    

# 通过正则表达式获取电影海报图片网址
def get_movie_images():
    #补全代码
    global href
    pattern_herf = '<img src="./(.*?)"'
    href = re.findall(pattern_herf, res.text, re.S)
    for i in range(len(href)):
        href[i]='http://localhost:8080/douban/'+href[i]

    pass
    
#打印片名和海报图片网址，并通过requests库下载图片
def print_titles_download_images(titles, images):
    #下载的海报图片保存在imgs文件夹中，需要提前创建好imgs文件夹
    for i in range(len(images)):
        r=requests.get(images[i])
        with  open('./imgs/'+titles[i]+'.jpg','wb') as f:
            f.write(r.content)


    # 补全代码:打印的片名前需要有序号
    for i in range(len(titles)):
        print(str(i + 1) + '.' + titles[i] )
        print(href[i])
        print('')
        
if __name__ == "__main__":
    #补全代码
    get_movie_title()
    get_movie_images()
    print_titles_download_images(title,href)
