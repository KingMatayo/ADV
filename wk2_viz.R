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

#Visualizing duke forest dataset: housing prices vs area 
ggplot(duke_forest, aes(x = area, y = price)) +
  geom_point(alpha = 0.7, size = 2) +
  geom_smooth(method = "lm", se = FALSE, linewidth = 0.7) +
  labs(
    x = "Area (square feet)",
    y = "Sale price (USD)",
    title = "Price and area of houses in Duke Forest"
  )

#Mutate the duke_forest dataset to add additional columns
duke_forest <- duke_forest

duke_forest <- duke_forest %>%
  mutate(decade_built = (year_built %/% 10) * 10)

duke_forest <- duke_forest |> 
  mutate(
    decade_built_cat = case_when(
      decade_built <= 1940 ~ "1940 or before",
      decade_built >= 1990 ~ "1990 or after",
      TRUE ~ as.character(decade_built)
    )
  )

#Slightly more complex visualization
ggplot(
  duke_forest,
  aes(x = area, y = price, color = decade_built_cat)
) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  geom_smooth(method = "lm", se = FALSE, linewidth = 0.5, show.legend = FALSE) +
  facet_wrap(~decade_built_cat) +
  labs(
    x = "Area (square feet)",
    y = "Sale price (USD)",
    color = "Decade built",
    title = "Price and area of houses in Duke Forest"
  )

# Trying out some Summary statistics using group_by() and summarize() function
mean_area_decade <- duke_forest |>
  group_by(decade_built_cat) |>
  summarize(mean_area = mean(area))

mean_area_decade

#Visualization a bar plot of the mean_area by decade - is the ink > data?
ggplot(
  mean_area_decade,
  aes(y = decade_built_cat, x = mean_area)
) +
  geom_col() +
  labs(
    x = "Mean area (square feet)", y = "Decade built",
    title = "Mean area of houses in Duke Forest, by decade built"
  )

#Now visualization a scatter plot instead - whats the balance now? between data to ink

ggplot(
  mean_area_decade,
  aes(y = decade_built_cat, x = mean_area)
) +
  geom_point(size = 4) +
  labs(
    x = "Mean area (square feet)", y = "Decade built",
    title = "Mean area of houses in Duke Forest, by decade built"
  )

#How about a lolipop chart? Is this a happy medium?

ggplot(
  mean_area_decade,
  aes(y = decade_built_cat, x = mean_area)
) +
  geom_point(size = 4) +
  geom_segment(
    aes(xend = 0, 
        yend = decade_built_cat)
  ) +
  labs(
    x = "Mean area (square feet)", y = "Decade built",
    title = "Mean area of houses in Duke Forest, by decade built"
  )
