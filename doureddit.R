# library(httr)
# client_auth = authenticate("hHcsrmSp3Gr1gg", "1KSOCJmJyhg9lCCtJORkicrrJ9U")
# headers = add_headers('User-Agent' = "bleep bloop bingo")
# GET(url = "https://www.reddit.com/api/v1/trending_subreddits", client_auth, headers)
library(jsonlite)
belp <- fromJSON("https://www.reddit.com/r/rarepuppers.json")
titles <- belp$data$children$data$title
urls <- belp$data$children$data$url
#just filter for jpg and png
puppyframe <- data.frame(titles, urls)
puppyframe <- puppyframe[-1, ]
library(data.table)
puppyframe2 <- puppyframe[grepl(".jpg$", puppyframe$urls) | grepl(".png$", puppyframe$urls), ]
idealpup <- puppyframe2[sample(nrow(puppyframe2), 3), ]
img_path1 <- as.character(idealpup[1, 2])
img_path2 <- as.character(idealpup[2, 2])
img_path3 <- as.character(idealpup[3, 2])
img1 <- magick::image_read(img_path1)
img2 <- magick::image_read(img_path2)
img3 <- magick::image_read(img_path3)
par(c(0, 0, 0, 0))
plot(img1)
plot(img2)
plot(img3)