library(tidyverse) # adds ggplot2, dplyr, and other useful packages
library(showtext) # display special fonts
library(ggtext) # use html/markdown in plots

# FONTS AND PALETTES ----

## add font from Google Fonts ----
sysfonts::font_add_google(name = "Fira Sans", family = "fira-light", regular = "300")

## use fonts ----
# the new fonts usually won't work without this note that fonts
#show up weird in the RStudio preview when using `showtext` but they'll export
#correctly
showtext::showtext_auto()

## color palette ----
# using named vector allows us to assign which values get which color
# if you just set the colors as `tortoise_palette <- c("#906272","#668b63","#b8834d")`
# then ggplot may assign the colors in a different order
tortoise_palette <- c("Konjsko" = "#906272", "Plateau" = "#668b63", "Beach" = "#b8834d")

# DATA ----
# See the Tidy Tuesday data page for an explanation of each variable in the
# data set and additional information:
# https://github.com/rfordatascience/tidytuesday/blob/main/data/2026/2026-03-03/readme.md

## import and clean data ----
clutch_size_cleaned <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2026/2026-03-03/clutch_size_cleaned.csv') |>
  # calculate body_condition_index
  dplyr::mutate(body_condition_index = body_mass_grams / straight_carapace_length_mm) |>
  # name population from subpopulations (locality)
  dplyr::mutate(
    population = "Golem Grad Island",
    population = if_else(locality == "Konjsko", "Mainland", population)
  ) |>
  # keep only one of each female to avoid data biases
  dplyr::distinct(individual, .keep_all = TRUE)

## START PLOT ----

# YOU'LL NEED TO FILL SOME THINGS IN BEFORE IT WORKS!

#plot_tortoise_clutch_size <-
clutch_size_cleaned |>
  ggplot() +
  # AESTHETICS
  aes(
    x = eggs,
    y = body_condition_index,
    color = locality,
    fill = locality,
    shape = locality
  ) +
  # GEOMS
  geom_point() +
  geom_smooth() + # geom_smooth can be a pain to annotate using automated functions, so we'll do it by hand with `annotate`
  # SCALES
  # shapes and colors
  scale_shape_manual() +
  scale_color_manual() +
  scale_fill_manual() +
  # axes
  scale_x_continuous() +
  scale_y_continuous() +
  # THEME
  theme_minimal() + # a nice clean theme to start with
  theme() +
  # LABELS
  labs() +
  # ANNOTATIONS
  # Direct labeling: rather than having a legend (or to supplement
  # one) you can add labels directly to the plot label manually. To avoid
  # overlapping with other elements in the plot hjust = 0 sets the x/y
  # coordinates to start on the left edge of the label
  annotate("label", label = "Konjsko", hjust = 0, x = 9, y = 9, size = 5, color = tortoise_palette["Konjsko"])

# save an individual plot
# ggsave automatically detect plot type based on extension
# .svg is a vector format; you may be prompted to install svglite
ggsave("plot_tortoise_clutch_size.png", height = 5.5, width = 6.5, units = "in")
