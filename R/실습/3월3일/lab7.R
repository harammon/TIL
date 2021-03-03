library(rvest)

url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"

text <- read_html(url)
text

nodes.h1 <- html_nodes(text, "h1")
nodes.h1
html_text(nodes.h1)

nodes.a <- html_nodes(text, "a")
nodes.a
html_attr(nodes.a, "href")

nodes.img <- html_nodes(text, "img")
nodes.img
html_attr(nodes.img, "src")

nodes.h2.first <- html_nodes(text, "h2:nth-of-type(1)")
html_text(nodes.h2.first) 

nodes.ul <- html_nodes(text, "ul>[style$=green]")
nodes.ul
a <- html_text(nodes.ul)
(a)

nodes.h2.second <- html_nodes(text, "h2:nth-of-type(2)")
html_text(nodes.h2.second)

nodes.ol <- html_nodes(text, "ol>*")
html_text(nodes.ol)

nodes.table <- html_nodes(text, "table *")
html_text(nodes.table)

nodes.tr.name <- html_nodes(text, ".name")
# nodes.tr.name <- html_nodes(text, "tr .name")   #띄어쓰기 안되는 이유는?
html_text(nodes.tr.name)

nodes.td.target <- html_nodes(text, "td#target")
nodes.td.target <- html_nodes(text, "#target")

html_text(nodes.td.target)