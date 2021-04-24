
# Upload the packages -----------------------------------------------------

pacman::p_load(readxl, lubridate, tidyverse, ggplot2, hrbrthemes, ggfittext, patchwork, scales, ggtext, ggpubr,ggbump,wesanderson,
               grid, gridtext, biscale, cowplot,sysfonts,ggimage,extrafont,systemfonts, showtext, ggbeeswarm,countrycode,geofacet)




# Graph -------------------------------------------------------------------


graph<-data_source%>%ggplot(aes(TIME, Value, group = Region)) +
  geom_area(alpha = 0.2,fill="#e13d3d",colour="#e13d3d") +
  geom_line(aes(y = Value, x = TIME), size = .5, color = '#e13d3d') +
  facet_wrap(~ Region, ncol = 7,scales='free') +
  scale_y_continuous(limits = c(0, 100), breaks = c(25,50,75)) +
  scale_x_continuous(limits = c(2010, 2019), breaks = c(2010,2013,2016, 2019))  +
  labs(x = "",y = "",
       title = "Air pollution exposure",
       subtitle = "Countries with exposure to PM2.5 higher than 35  micrograms per cubic metre in 2019",
       caption = "")+
  guides(fill = NULL) +
  theme(
    plot.title = element_text(margin = margin(b = 20), 
                              color = "#e13d3d",face = "bold",size = 12,
                              hjust = 0,
                              family = font_labels),
    plot.subtitle = element_text(margin = margin(b = 20), 
                                 color = "#808080", size = 8,
                                 hjust = 0,
                                 family = font_labels),
    plot.caption =  element_text(margin = margin(t = 20), 
                                 color = "#22222b", size = 10,
                                 hjust = 0.95),
    legend.position = "none",
    panel.background = element_blank(), 
    axis.title.x = element_blank(), 
    axis.title.y = element_blank(), 
    axis.text.x    = element_text(size = 6, color = "#808080",family = font_labels),
    axis.text.y    = element_text(size = 6, color = "#808080",margin = margin(t = 0, r = 10, b = 0, l = 0),family = font_labels),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(), 
    panel.grid.major = element_blank(),
    panel.grid.major.y = element_blank(),
    plot.background = element_rect(fill = "#f7f7f7", color = NA),    # color removes the border
    plot.margin = unit(c(2, 2, 2, 2), "cm"),
    axis.ticks = element_blank(),
    strip.background = element_blank(),
    strip.text.x = element_blank(),
    axis.line.x=element_line(color="#e2e2e2", size = 0.01)
  ) + 
  geom_text(aes(x = 2010, y = 90, label = Region), hjust = 0, nudge_x = 0.01,family = font_labels,size = 2.5, colour = "#808080",fontface = "plain") +
  geom_text(aes(x = 2017, y = 90, label = label), hjust = 0, nudge_x = 0.01,family = font_labels,size = 2.5, colour = "#e13d3d",fontface = "plain") 

