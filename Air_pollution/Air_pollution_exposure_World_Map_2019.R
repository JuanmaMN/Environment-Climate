
# Upload the packages -----------------------------------------------------

pacman::p_load(readxl, lubridate, tidyverse, ggplot2, hrbrthemes, ggfittext, patchwork, scales, ggtext, ggpubr,ggbump,wesanderson,
               grid, gridtext, biscale, cowplot,sysfonts,ggimage,extrafont,systemfonts, showtext, ggbeeswarm,countrycode,geofacet)



# Graph -------------------------------------------------------------------


graph <- ggplot() + 
  geom_map(data = world, map = world,
           aes(long, lat, group = group,  map_id = region),
           fill = "#525252", color = "#525252") +
  geom_map(data = data_source, map = world,
           aes(fill = color, map_id = Region),
           color = "#525252", size = 0.15, alpha = .8) +
  scale_fill_manual(values = c( "Less than 10" = "#b8c375",
                                "10 to 15" = "#c6dabf",
                                "15 to 25"= "#feeaa5",
                                #"30 to 40"= "#f9cca5",
                                "25 to 35"= "#fec072",
                                "> 35" = "#e33d53")) +
  scale_x_continuous(breaks = NULL) + 
  scale_y_continuous(breaks = NULL) +
  labs(x = "",y = "",
       title = "Air pollution exposure - 2019",
       subtitle = "Exposure to PM2.5, Micrograms per cubic metre, 2019.Data refer to population exposure to more than 10 micrograms/m3 and are expressed as annual averages.",
       caption = "Source:OECD (2021), Air pollution exposure (indicator). doi: 10.1787/8d9dcc33-en (Accessed on 24 February 2021)\nVisualization: JuanmaMN (Twitter @Juanma_MN)\nGraph with RStudio") +
  theme(
    plot.title = element_text(margin = margin(b = 8), 
                              color = "#ffffff",face = "bold",size = 12,
                              hjust = 0.5,
                              family = "Arial"),
    plot.subtitle = element_text(margin = margin(t=10,b = 25), 
                                 color = "#ffffff", size = 10, family = "Arial",
                                 hjust = 0.5),
    plot.caption =  element_text(margin = margin(t = 20), 
                                 color = "#ffffff", size = 10, family = "Arial",
                                 hjust = 0.95),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.title = element_blank(),
    axis.text.x    = element_blank(),
    axis.text.y    = element_blank(),
    panel.background = element_blank(), 
    panel.grid.major = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(), 
    plot.background = element_rect(fill = "#b9cad4"),
    panel.border = element_blank(),
    plot.margin = unit(c(1, 1, 1, 1), "cm"),
    legend.position = "bottom",
    legend.text=element_text(size=8, color = "#525252"),
    legend.key.size = unit(0.2, "cm"),
    legend.key = element_blank(),
    legend.background=element_blank(),
    axis.ticks = element_blank(),
    legend.margin=margin(b = 0.1, unit='cm')
  ) +
  guides(fill = guide_legend(
    label.position = "bottom",
    nrow = 1,
    family = font_labels, 
    color = "#525252",
    keywidth = 3, keyheight = 0.5))