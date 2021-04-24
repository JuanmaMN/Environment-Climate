
# Upload the packages -----------------------------------------------------

pacman::p_load(readxl, lubridate, tidyverse, ggplot2, hrbrthemes, ggfittext, patchwork, scales, ggtext, ggpubr,ggbump,wesanderson,
               grid, gridtext, biscale, cowplot,sysfonts,ggimage,extrafont,systemfonts, showtext, ggbeeswarm,countrycode,geofacet)


# Graph -------------------------------------------------------------------



graph <- ggplot(data_source) +
  geom_rect(aes(xmin = 2010, ymin = 0,
                xmax = 2019, ymax = 100),
            fill = "#f7f7f7") +
  geom_area(aes(TIME, Value, group = Region,fill = color,color = color),
            alpha = 0.5) +
  geom_line(aes(y = Value, x = TIME,color = color), size = .5) +
  geom_hline(yintercept=35, linetype='dotted', col = 'black') + 
  scale_color_manual(values = c( "Less than 10" = "#b8c375",
                                 "10 to 15" = "#c6dabf",
                                 "15 to 25"= "#feeaa5",
                                 #"30 to 40"= "#f9cca5",
                                 "25 to 35"= "#fec072",
                                 "> 35" = "#e33d53")) +
  scale_fill_manual(values = c( "Less than 10" = "#b8c375",
                                "10 to 15" = "#c6dabf",
                                "15 to 25"= "#feeaa5",
                                #"30 to 40"= "#f9cca5",
                                "25 to 35"= "#fec072",
                                "> 35" = "#e33d53")) +
facet_geo( ~ iso2,
           grid = africa_grid,
           label = "name") +
  scale_y_continuous(breaks=c(35))+
  scale_x_continuous(breaks=c(2010,2019))+
  labs(caption = "Source: OECD (2021)\nVisualization: JuanmaMN (Twitter @Juanma_MN)") +
  theme(
    plot.title = element_text(margin = margin(t=10, b = 8), 
                              color = "#22222b",face = "bold",size = 14,
                              hjust = 0.5,
                              family = font_labels),
    plot.subtitle = element_text(margin = margin(t=10,b = 25), 
                                 color = "#22222b", size = 10, family = font_labels,
                                 hjust = 0.5),
    plot.caption =  element_text(margin = margin(t = 20, b = 5), 
                                 color = "#22222b", size = 7, family = font_labels,
                                 hjust = 0.95),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    axis.text.x    = element_text(size = 6, color = "#22222b",family = font_labels),
    axis.text.y    = element_text(size = 6, color = "#22222b",family = font_labels), 
    panel.background = element_blank(), 
    panel.grid.major = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(), 
    plot.background = element_rect(fill = "#f7f7f7", color = NA),    # color removes the border
    plot.margin = unit(c(2, 2, 2, 2), "cm"),
    axis.ticks = element_blank(),
    strip.background = element_blank(),
    strip.text.x = element_text(size = 8,  color = "#22222b",family = font_labels),
    legend.position = "bottom",
    legend.text=element_text(size=6, color = "#22222b",family = font_labels),
    legend.title = element_blank(),
    legend.key.size = unit(0.2, "cm"),
    legend.key = element_blank(),
    legend.background=element_blank(),
    legend.margin=margin(t = 0.5, unit='cm')
  )  +
  guides(fill = guide_legend(
    alpha = 0.5,
    label.position = "bottom",
    override.aes = list(alpha = 2),
    nrow = 1,
    family = font_labels, 
    color = "#525252",
    keywidth = 3, keyheight = 0.5)) 
