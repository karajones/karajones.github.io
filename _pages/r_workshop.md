---
permalink: /r_workshop/
title: "R Workshop"
markdown: kramdown
kramdown:
  parse_block_html: true
layout: single
toc: true
toc_label: "Contents"
toc_icon: "list"
toc_sticky: true
---

**Creating publication-ready figures using ggplot2 and extensions**

+ Presenter: Kara Jones
+ Date: Thursday, November 12, 2026
+ Time: 9:30-11:30 am
+ Location: Stocking Hall, Room 202, Cornell University

*Please note that this workshop will take place in person only.*

## What you'll need

At minimum, a laptop with R installed and the following packages:
+ [ggplot2](https://ggplot2.tidyverse.org/) version 4.0.0 or above
+ [dplyr](https://dplyr.tidyverse.org/)
+ [scales](https://scales.r-lib.org/)
+ Or you install all of the above and additional useful packages by installing the full [tidyverse suite](https://tidyverse.org/packages/)

The following packages will also be used to create the final example plots:
+ [patchwork](https://patchwork.data-imaginist.com/) (combining multiple plots into a single figure)
+ [ggtext](https://wilkelab.org/ggtext/) (using html/markdown to style text)
+ [showtext](https://github.com/yixuan/showtext) (displaying special fonts)
+ [icons](https://pkg.mitchelloharawild.com/icons/) (downloading Font Awesome icons)
+ [ggicons](https://pkg.mitchelloharawild.com/ggicons/) (adding icons to plot)
+ [ggh4x](https://teunbrand.github.io/ggh4x/index.html) (pronounced "gg hacks"; adding nested facet labels)

If you have trouble installing any of the packages, you can still make plots - they just might not have all the fancy features.

## Agenda (draft)

The workshop will be split, wit the first half dedicated to instruction and the second half to hands-on time. During the first half of the workshop, I'll walk you through the topics below.   

**1. ggplot2 basics**

*Since there will be a variety of experience levels at the workshop, this section is meant to get us all on the same page.*
 +  Plot layers: plot, panel, axis, geom, legend, annotate
 +  Modifying layers: scales, facets, and guides
 +  Theming: default themes, modifying theme elements, inheritance

**2. Best practices in data visualization**
  + Presenting data honestly
  + Choosing the format
  + Improving accessibility
  + Removing anything not helpful for telling the story

**3. Worked example**

*We'll spend most of the instruction time on a deep-dive into one plot.*
  + Intro to the data
  + Layering geoms
  + Mapping aesthetics
  + Controlling shapes and colors with scales (custom palette)
  + Nested facets
  + Scaling axes
  + Annotating with icons
  + Modifying text with markdown and html
  + Saving theme elements for reuse as a custom theme
  + Combining multiple plots into one figure

Since the workshop is only two hours, the goal is to give you enough of an introduction into the topic that you'll have a solid starting point for further exploration.

## Data

We'll be making plots with the [Golem Grad Tortoise Data](https://github.com/rfordatascience/tidytuesday/blob/main/data/2026/2026-03-03/readme.md#golem-grad-tortoise-data) available from TidyTuesday. You do not need to download the data set in advance. It's a small data set and I'll provide code to download and clean the data. The data also doesn't matter that much since what you'll be learning about can be applied to any data set - I just think the tortoises are cute!

## Code

Stay tuned - example code will be up soon. I will walk you through all the code during the workshop.

## Slide decks

I'll post the slide decks here after the workshop.

## Other resources

Below are links for other resources that you might find useful. Note: I have not used all of the packages listed below. (Though I have used many of them!)

+ [ggplot2 styling tutorial](https://tidyverse.org/blog/2025/10/ggplot2-styling/): an official tutorial on theming, from the makers of gglot2
+ [data visualization cheat sheets](https://rstudio.github.io/cheatsheets/html/data-visualization.html): downloadable PDF of ggplot2 functions
+ [ggplot2 4.0.0 updates](https://tidyverse.org/blog/2025/09/ggplot2-4-0-0/): blog post on new features in ggplot2 4.0.0+

### Palettes and themes

+ [paletteer](https://emilhvitfeldt.github.io/paletteer/): comprehensive collection of color palettes in R using a common interface; installing this package installs most of the palettes available from other packages
+ [ggthemes](https://jrnold.github.io/ggthemes/): additional themes to use
+ [microshades](https://karstenslab.github.io/microshades/): a color-blind friendly palette
+ [monochromeR](https://github.com/cararthompson/monochromeR): create monochrome colour palettes and easily convert rgba values to hex codes

### Geoms, stats, and facets

+ [ggdist](https://mjskay.github.io/ggdist/): ggplot2 geoms and stats designed especially for visualizing distributions and uncertainty
+ [donutsk](https://dkibalnikov.github.io/donutsk/): donut charts for ggplot
+ [ggforce](https://ggforce.data-imaginist.com/): extending geoms, facets, and scales
+ [ggsvg](https://coolbutuseless.github.io/package/ggsvg/): use SVG images for points
+ [ggpattern](https://coolbutuseless.github.io/package/ggpattern/): pattern fills for ggplots
+ [ggh4x](https://teunbrand.github.io/ggh4x/index.html): hacks to extend ggplots, incl. nested facets
+ [ggalluvial](https://corybrunson.github.io/ggalluvial/articles/ggalluvial.html): alluvial plots
+ [ggalt](https://github.com/hrbrmstr/ggalt): splines, 1d and 2d densities, univariate average shifted histograms
+ [ggrepel](https://ggrepel.slowkow.com/): geoms to repel overlapping text labels
+ [ggpp](https://docs.r4photobiology.info/ggpp/): additional geoms, positions, and stats
+ [ggflowchart](https://nrennie.rbind.io/ggflowchart/): create flowcharts
+ [ggnewscale](https://eliocamp.github.io/ggnewscale/): add multiple scales to one plot
+ [ggicons](https://pkg.mitchelloharawild.com/ggicons/): geoms for using icons instead of points
+ [ggstats](https://larmarange.github.io/ggstats/): additional geoms for showing statistics results

### Text and number styling

+ [scales](https://scales.r-lib.org/): part of the tidyverse suite; extremely useful for beautifying numbers on axes
+ [strex](https://rorynolan.github.io/strex/index.html): extensions for stringr like alphaordering numbers
+ [ggtext](https://wilkelab.org/ggtext/): simple Markdown and HTML rendering for ggplot2
+ [fontawesome](https://github.com/rstudio/fontawesome): icon font
+ [verbaliseR](https://github.com/cararthompson/verbaliseR): functions that make it easier to turn R analysis outputs into sentences
+ [showtext](https://github.com/yixuan/showtext): helper function to display fonts
+ [icons](https://pkg.mitchelloharawild.com/icons/): install icon fonts

### Annotation

+ [ggiraph](https://davidgohel.github.io/ggiraph/index.html): add tooltips, hover effects and JavaScript actions to ggplots
+ [gghighlight](https://yutannihilation.github.io/gghighlight/): highlight and label specific point and lines
+ [ggpmisc](https://docs.r4photobiology.info/ggpmisc/): annotations and plotting related to fitted models
+ [ggExtra](https://github.com/daattali/ggExtra): add marginal histograms/boxplots/density plots to ggplot2 scatterplots
+ [ggstatsplot](https://www.indrapatil.com/ggstatsplot/): add details from statistical tests
+ [patchwork](https://patchwork.data-imaginist.com/): combine separate ggplots into the same graphic
+ [ggscribe](https://davidhodge931.github.io/ggscribe/): add annotations to the margins of plots

### Fun stuff

+ [gganimate](https://gganimate.com/): animate your ggplots!
+ [ggrgl](https://coolbutuseless.github.io/package/ggrgl/index.html): render plots in 3D
+ [ggfx](https://ggfx.data-imaginist.com/index.html): add blur to ggplot2 layers

### Specialized packages

+ [ggcoverage](https://showteeth.github.io/ggcoverage/index.html): visualize and annotate omics coverage with ggplot2
+ [ggpal2](https://github.com/frankiethull/ggpal2): LLM assistant specifically for ggplot2
+ [ggmsa](https://www.bioconductor.org/packages/release/bioc/vignettes/ggmsa/inst/doc/ggmsa.html): plot multiple sequence alignments



