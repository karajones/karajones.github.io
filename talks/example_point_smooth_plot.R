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
  geom_point(size = 4) +
  geom_smooth(method = "lm", formula = 'y ~ x', linetype = 2, linewidth = 0.5, alpha = 0.3) + # geom_smooth can be a pain to annotate using automated functions, so we'll do it by hand with `annotate`
  # FACET
  #facet_grid(.~locality, space = "free") +
  # SCALES
  # shapes and colors
  scale_shape_manual(values = c(0,1,2)) +
  scale_color_manual(values = tortoise_palette) +
  scale_fill_manual(values = tortoise_palette) +
  # axes
  scale_x_continuous(limits = c(0, max(clutch_size_cleaned$eggs)+1), breaks = scales::breaks_pretty(2), expand = c(0.02,0.02)) +
  scale_y_continuous(limits = c(0, max(clutch_size_cleaned$body_condition_index)+2), breaks = scales::breaks_pretty(3), expand = c(0.02,0.02)) +
  # THEME
  theme_minimal() + # a nice clean theme to start with
  theme(
    # PLOT
    # the "family" name must match the family set with `font_add`
    text = element_text(family = "fira-light", color = "black", size = 12), # other text values inherit from `text`
    plot.margin = unit(c(10,10,30,10), "pt"), # remember "trouble" (trbl - top, right, bottom, left)
    plot.title = ggtext::element_textbox_simple(face = "bold", margin = margin(t = 5, b = 10, unit = "pt")),
    plot.subtitle = ggtext::element_textbox_simple(margin = margin(t = 5, b = 20, unit = "pt"), lineheight = 1.3),
    plot.caption = element_text(margin = margin(t = 20, b = -20, unit = "pt")),
    # PANEL
    panel.grid.minor = element_line(color = "grey90", linetype = 3),
    panel.grid.major = element_line(color = "grey95"),
    # AXIS
    axis.text = element_text(size = rel(1.1)), # inherits from `text`; theme_minimal() default is rel(0.8)
    axis.title = element_text(size = rel(1)), # set shared values for x and y; default is rel(1)
    axis.title.x = element_text(margin = margin(t = rel(10), unit = "pt")), # increase the distance between top (t) of axis title and axis text
    axis.title.y = ggtext::element_markdown(margin = margin(r = rel(10), unit = "pt")), # MUST set .x or .y (not just axis.title) for element_markdown to work in axis titles!
    # LEGEND
    legend.position = "none" # remove the legend
  ) +
  # LABELS
  labs(
    x = "Number of eggs per clutch",
    # note that we can't use `rel` within the html below so the font has to be
    # set manually
    y = "Body condition index<br><span style='font-size:12px;'>*body mass (g) / straight carapace length (mm)*</span>",
    title = "Relationship between clutch size and body condition in Hermann’s tortoise (*Testudo hermanni*) populations",
    subtitle = "Females in both island subpopulations tend to have lower body condition indices and fewer eggs per clutch indices than females from the mainland",
    caption = "Data source: https://doi.org/10.1111/ele.70296 via TidyTuesday"
  ) +
  # ANNOTATIONS
  # Direct labeling: rather than having a legend (or to supplement
  # one) you can add labels directly to the plot label manually. To avoid
  # overlapping with other elements in the plot hjust = 0 sets the x/y
  # coordinates to start on the left edge of the label
  annotate("label", label = "Konjsko", hjust = 0, x = 9, y = 9, size = 5, color = tortoise_palette["Konjsko"]) +
  annotate("label", label = "Plateau", hjust = 0, x = 5.5, y = 6.25, size = 5, color = tortoise_palette["Plateau"]) +
  annotate("label", label = "Beach", hjust = 0, x = 3.5, y = 4, size = 5, color = tortoise_palette["Beach"])

# save an individual plot
# ggsave automatically detect plot type based on extension
# .svg is a vector format; you may be prompted to install svglite
ggsave("plot_tortoise_clutch_size.png", height = 5.5, width = 6.5, units = "in")
