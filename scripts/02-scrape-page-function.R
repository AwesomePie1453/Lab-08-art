# load packages ----------------------------------------------------------------

library(tidyverse)
library(rvest)

# trying functions ------------------------------------------------------------

add_two <- function(x){
  x + 2
}

add_two(3)

add_two(10)

# function: scrape_page --------------------------------------------------------

scrape_page <- function(url){
page <- read_html(url)

titles <-  page %>%
  html_nodes(".iteminfo") %>%
  html_node("h3 a") %>%
  html_text() %>%
  str_squish()

links <- page %>%
  html_nodes(".iteminfo") %>%
  html_node("h3 a") %>%
  html_attr("href") %>%
  str_replace("\\.", "https://collections.ed.ac.uk/art/")

artists <- page %>%
  html_nodes(".iteminfo") %>%
  html_node(".artist") %>%
  html_text() %>%
  str_squish()

tibble(
  title = titles,
  artist = artists,
  link = links
)
}


