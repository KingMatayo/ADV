# Deep dive into ggplot2 layers I

#Setup

#install packages that i dont have and load as needed
install.packages("openintro","countdown")

library(tidyverse)
library(airports)
library(cherryblossom)
library(usdata)
library(openintro)

# set theme for ggplot2
ggplot2::theme_set(ggplot2::theme_minimal(base_size = 14))

# set figure parameters for knitr
knitr::opts_chunk$set(
  fig.width = 7,        # 7" width
  fig.asp = 0.618,      # the golden ratio
  fig.retina = 3,       # dpi multiplier for displaying HTML output on retina
  fig.align = "center", # center align figures
  dpi = 300             # higher dpi, sharper image
)

#Visualizing duke forest housing prices vs areas dataset
ggplot(duke_forest, aes(x = area, y = price)) +
  geom_point(alpha = 0.7, size = 2) +
  geom_smooth(method = "lm", se = FALSE, size = 0.7) +
  labs(
    x = "Area (square feet)",
    y = "Sale price (USD)",
    title = "Price and area of houses in Duke Forest"
  )
