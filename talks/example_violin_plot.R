library(tidyverse) # adds ggplot2, dplyr, and other useful packages
library(showtext) # display special fonts
library(ggtext) # use html/markdown in plots
library(patchwork) # combine multiple plots into a single figure
library(icons) # download font awesome icons
library(ggicons) # add icons to plot
library(ggh4x) # pronounced "gg hacks"; adds nested facets

## import and clean data ----
tortoise_body_condition_cleaned <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2026/2026-03-03/tortoise_body_condition_cleaned.csv') |>
  mutate(
    # name population from subpopulations (locality)
    population = "Golem Grad Island",
    population = if_else(locality == "Konjsko", "Mainland", population),
    # set "m" and male and "f" as female
    sex = if_else(sex == "m", "male", "female")
  ) |>
  select(individual, year, locality, population, sex, body_condition_index) |>
  summarize(
    # calculate the mean body condition for each individual
    mean_bci = mean(body_condition_index),
    # include sex, locality, and population in `.by` so
    # those columns will be included in the final data frame
    # (`summarize` throws out any unused variables)
    .by = c(individual, sex, locality, population)
  )

# FONTS AND PALETTES ----

## add font from Google Fonts ----
sysfonts::font_add_google(name = "Fira Sans", family = "fira-light", regular = "300")

## load icons ----
# uses `icons` package
# some other icon options that work with the package:
# bioicons for chem and bio: https://bioicons.com/
# academicons for academic website icons: https://jpswalsh.github.io/academicons/
icons::download_fontawesome()

## use fonts ----
showtext::showtext_auto()

## color palette ----
# using named vector allows us to assign which values get which color
# if you just set the colors as `mf_palette <- c("#668B63","#8E8E9E")` then
# ggplot may assign the colors in a different order
mf_palette <- c("male" = "#668B63", "female" = "#8E8E9E")

# set a universal width for the geoms
geom_width <- 0.8

## save min values to data frame ----
# these will be used for annotating the plot with icons for male/female
icons_df <- tortoise_body_condition_cleaned |>
  # take the minimum values of mean_bci for each locality/sex
  dplyr::slice_min(mean_bci, by = c(locality, sex)) |>
  # keep only the columns needed
  select(sex, locality, population, mean_bci) |>
  # add styled labels to use in legend
  mutate(labels = if_else(
    sex == "male",
    # color these to match the color palette
    # this only works if html/markdown is enabled in the theme (see below!)
    "<span style='color:#668B63;'>male</span>",
    "<span style='color:#8E8E9E;'>female</span>"
  )
  )

# PLOT ----
#plot_tortoise_body_condition <-
tortoise_body_condition_cleaned |>
  ggplot() +
  ## AES ----
aes(
  x = locality,
  y = mean_bci,
  # note: we'll set the specific fill/color/shapes to use with `scales` below
  # setting `sex` as an aesthetic will split the data so that each locality
  # is represented by two sexes
  fill = sex,
  color = sex,
  shape = sex
) +
  ## GEOMS----
  geom_violin(
    alpha = 0.3, # set transparency to 30%
    color = NA, # remove outline
    # remember, we assigned a width above to the variable `geom_width`
    width = geom_width,
    # dodge the violins for both sexes so they don't overlap
    # usually the width above should match the position width
    position = position_dodge(width = geom_width)
  ) +
  # jitter lets you see the points (otherwise they line up on the x axis_)
  # + geom_jitter is a type of geom_point with position = "jitter" as the default
  # + adding points lets you see how many data points support the conclusions
  # but it's kind of confusing when the plots go outside the violin shape
  # + we constrain the points to the violin using ggbeeswarm::geom_quasirandom
  ggbeeswarm::geom_quasirandom(
    # must use set dodge.width so colors are split by sex
    # dodge.width must be the same as the position_dodge width so they fit together
    dodge.width = geom_width,
    alpha = 0.8
  ) +
  stat_summary(
    aes(linetype = "mean"), # trick to show mean separately on the legend
    fun = mean,
    geom = "crossbar",
    position = position_dodge(width = geom_width),
    # make the width of the line a little shorter so it stays within the violin boundaries
    width = geom_width - 0.1,
    linewidth = 0.25,
    color = "black",
    key_glyph = "path" # change legend icon from box to one line
  ) +
  ggicons::geom_icon(
    data = icons_df,
    aes(x = locality, y = mean_bci, icon = sex),
    # add extra width to push icons to the sides of the violins
    position = position_dodge(width = geom_width + 0.6)
  ) +
  ## FACETS ----
# extension to nest facet labels (i.e., Beach and Plateau both under Golem Grad Island)
# note there are *still* 3 facets (Beach, Plateau, and Konjkso), there will
# just be an extra facet strip above the facets
ggh4x::facet_nested(
  # nest locality below population along the x-axis
  . ~ population + locality,
  # allow each facet scale to vary independently
  scales = "free",
  # style the horizontal line between the facet nests
  nest_line = element_line(color = "grey20", linewidth = 0.3),
  # add a line even if there is only one locality under a population
  solo_line = TRUE,
  # set additional styling to the facet strip text
  strip = ggh4x::strip_nested(
    # allow the size of each strip layer to vary
    size = "variable",
    text_x = list(
      # make the top facet labels bold
      element_text(face = "bold"),
      # add a margin to the bottom labels to increase distance between plot and strip labels
      element_text(margin = margin(t = 5, b = 10, unit = "pt"))
    ),
    # must set by_layer to set different element_text options for each layer
    by_layer_x = TRUE
  )
) +
  ## SCALES ----
# note: `guide = "none"` turns off the legend for that item
# squares for males, circles for females
  scale_shape_manual(values = c("male" = 0, "female" = 1), guide = "none") +
  # uses the palette colors we set as a named vector
  scale_fill_manual(values = mf_palette, guide = "none") +
  scale_color_manual(values = mf_palette, guide = "none") +
  # add icons for male and female
  ggicons::scale_icon_manual(
    limits = c("male", "female"),
    # unique(icons_df$labels) is equivalent to
    # c("<span style='color:#668B63;'>male</span>","<span style='color:#8E8E9E;'>female</span>")
    labels = unique(icons_df$labels),
    # see fontawesome.com for icon options
    # "mars" and "venus" are the names of the icons
    values = c(icons::fontawesome$solid$mars, icons::fontawesome$solid$venus)
  ) +
  # warning: be careful not to set the scales so that it cuts off some of your data points!
  scale_y_continuous(
    # not used: you set specific limits to axis: min and max values +/- 1
    #limits = c(min(mean_bci$mean_bci)-1, max(mean_bci$mean_bci)+1),
    # or set padding around data - default is 0.05 or 5%
    expand = c(0.2,0.2),
    # not used: setting a name here overrides the y label set in labs below
    #name = "Body condition index",
    breaks = scales::breaks_pretty()
  ) +
  ## THEME ----
# set a nice, simple base theme
# examples of other built-in themes: https://ggplot2.tidyverse.org/reference/ggtheme.html
### base ----
theme_minimal() +
  theme(
    ### plot ----
    # set the base text for the whole plot
    # text elements below will inherit these settings
    text = element_text(family = "fira-light", color = "black", size = 16),
    # set spacing between edge of plot and other elements
    # this will also shift plot elements like title and caption, so those may need to be adjusted
    # remember "trouble" for order (trbl - top, right, bottom, left)
    plot.margin = unit(c(rel(10),rel(10),rel(30),rel(10)), "pt"),
    # use element_textbox_simple from the ggtext package allows you to use
    # html and markdown on text and nicely wraps long lines
    plot.title = ggtext::element_textbox_simple(face = "bold", margin = margin(t = rel(5), b = rel(5), unit = "pt")),
    plot.title.position = "plot",
    plot.subtitle = ggtext::element_textbox_simple(margin = margin(t = rel(5), b = rel(15), unit = "pt"), lineheight = 1.3),
    plot.caption = element_text(size = rel(0.6), margin = margin(t = rel(20), b = -rel(20), unit = "pt")),
    ### panel ----
    # turn off unnecessary lines to reduce visual clutter
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    # make the y axis lines just visible enough without distracting from the data
    # info on custom linetypes: https://ggplot2.tidyverse.org/reference/aes_linetype_size_shape.html
    panel.grid.major.y = element_line(color = "grey95", linetype = "22"),
    # note: panel.spacing only changes spacing between facets -
    # use plot.margin to change spacing between panel and edge of plot
    # set 0 pt margin between first two panels and 20 pt margin between second and third panels
    panel.spacing.x = unit(c(0,rel(20)), "pt"),
    ### axis ----
    # axis.text inherits from `text` so rel(1.2) = 12 pt x 1.2 = 14.4 pt
    # note: theme_minimal() default axis.text is rel(0.8)
    axis.text.y = element_text(size = rel(1.2)),
    # don't need this since it duplicates the strip text
    axis.text.x = element_blank(),
    axis.title.x = element_blank(),
    # like element_textbox_simple, element_markdown adds html and markdown capabilities to text
    # MUST set .x or .y (not just axis.title) for element_markdown to work in axis titles!
    axis.title.y = ggtext::element_markdown(size = rel(1), margin = margin(r = rel(20), unit = "pt")),
    ### legend ----
    legend.position = "bottom",
    legend.justification = "right",
    legend.title = element_blank(),
    legend.text = ggtext::element_markdown(size = rel(1), face = "bold"),
    legend.margin = margin(t = -rel(10), b = rel(10)),
    ### strip ----
    # increase facet text size
    # note: theme_minimal already removes background color
    strip.text = element_text(size = rel(1)),
    ### transparent plot ----
    panel.background = element_rect(fill = "transparent", colour = NA),
    plot.background = element_rect(fill = "transparent", colour = NA),
    legend.background = element_rect(fill = "transparent", colour = NA),
    legend.box.background = element_rect(fill = "transparent", colour = NA)
  ) +
  # set custom labels
  # note: the styling below uses markdown and html and will NOT work without
  # setting the appropriate theme elements above to use element_markdown or element_textbox_simple
  labs(
    y = "Body condition index<br><span style='font-size:18px;'>*body mass (g) / straight carapace length (mm)*</span>",
    title = "Body condition in Hermann’s tortoise (*Testudo hermanni*) populations",
    subtitle = "On average, mainland females have higher body condition indices compared to mainland males and island females. There is a greater difference in body condition between males and females on the mainland than on the island.",
    caption = "Data source: https://doi.org/10.1111/ele.70296 via TidyTuesday",
  ) +
  guides(
    linetype = guide_legend(order = 1, override.aes = list(color = "black", linewidth = 0.5)),
    icon = guide_legend(order = 2, override.aes = list(fill = mf_palette))
  )

ggsave("plot_tortoise_body_condition.svg", height = 7, width = 9, units = "in")



