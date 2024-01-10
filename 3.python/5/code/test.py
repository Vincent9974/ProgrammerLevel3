import requests
import re

# 豆瓣音乐排行榜海报网址
url='http://localhost:8080/douban/douban_movie_top 250.html'

res = requests.get(url)
res.encoding = 'utf-8'

title = []
href = []


def get_movie_title():
    global title
    p_title = '<img width=".*?" alt="(.*?)"'
    title = re.findall(p_title, res.text, re.S)


def get_movie_images():
    global href
    p_href = '<img width=.*? src="./(.*?)"'
    href = re.findall(p_href, res.text, re.S)
    for i in range(len(href)):
        href[i] = 'http://localhost:8080/douban/'+href[i]



def print_titles_download_images(titles, images):
    for i in range(len(images)):
        r = requests.get(images[i])
        with open('./imgs/'+ titles[i] + '.webp', 'wb') as f:
            f.write(r.content)


    # 补全代码:打印的片名前需要有序号
    for i in range(len(titles)):
        print(str(i+1) + '.' + titles[i])
        print(href[i])
        print(' ')

if __name__ == '__main__':
    #补全代码
    get_movie_title()
    # print(title)
    get_movie_images()
    # print(href)
    print_titles_download_images(title,href)
