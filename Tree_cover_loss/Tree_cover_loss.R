# Upload the packages -----------------------------------------------------

pacman::p_load(readxl, lubridate, tidyverse, ggplot2, hrbrthemes, ggfittext, patchwork, scales, ggtext, ggpubr,ggbump,wesanderson,
               grid, gridtext, biscale, cowplot,sysfonts,ggimage,extrafont,systemfonts, showtext, ggbeeswarm,countrycode,geofacet)




# First graph -------------------------------------------------------------


plot<-ggplot(data_source, aes(fill=tsc_tree_cover_loss_drivers__type, y=umd_tree_cover_loss__ha, x=Year)) + 
  geom_bar(position="stack", stat="identity")+
  scale_y_continuous(breaks = seq(0, 32500000,by =7500000), limits=c(0, 32500000), labels = c("0","7.5Mha","15Mha","22.5Mha","30Mha"),
                     expand = c(0,0)) +
  scale_x_discrete(breaks = seq(2001, 2020,by =1), 
                   labels = c("'01","'02","'03","'04","'05",
                              "'06","'07","'08","'09","'10",
                              "'11","'12","'13","'14","'15",
                              "'16","'17","'18","'19","'20")) +
  scale_fill_manual(values = c( "Shifting agriculture" = "#f0e287",
                                "Commodity driven deforestation" = "#ec8994",    
                                "Unknown"      = "#d5d0cc",
                                "Forestry"     = "#d3d9a9",
                                "Wildfire" = "#68a4d0",
                                "Urbanization" = "#96a4b0")) +
  labs(y = "",
       x = "",
       title = "Global Annual Tree Cover Loss by Dominant Driver Hectares",
       subtitle =  "In 2010, the world had 3.92Gha of tree cover, extending over 30% of its land area. In 2020, it lost 25.8Mha of tree cover. These estimates do not take tree cover gain into account.",
       caption =  "Source: www.globalforestwatch.org\nVisualization: JuanmaMN (Twitter @Juanma_MN)")  +
  theme(
    plot.title = element_text(
      color = "#22222b",face = "bold",size = 14,
      hjust = 0,
      family = font_labels),
    plot.subtitle = element_text(margin = margin(t=5, b= 30),
                                 color = "#22222b", size = 10, family = font_labels,
                                 hjust = 0),
    plot.caption =  element_text(margin = margin(t = 20), 
                                 color = "#22222b", size = 10,
                                 hjust = 0.99,
                                 family = font_labels),
    axis.title.x = element_blank(), 
    axis.title.y = element_blank(), 
    axis.text.x    = element_text(color = "#525252", hjust = 1,family = font_labels, size = 10),
    axis.text.y    = element_text(color = "#525252",hjust = 1,family = font_labels, size = 10),
    panel.background = element_blank(), 
    panel.grid.major = element_blank(),
    panel.grid.major.y = element_line(colour = "#525252",linetype="dotted"), 
    panel.grid.minor = element_blank(), 
    plot.margin = unit(c(2, 2, 2, 2), "cm"),
    plot.background = element_rect(fill = "#f7f7f7", color = NA),    # color removes the border,
    axis.ticks = element_blank(),
    legend.position = "bottom",
    legend.text=element_text(size=8, color = "#525252"),
    legend.key.size = unit(0.2, "cm"),
    legend.title = element_blank(),
    legend.key = element_blank(),
    legend.background=element_blank(),
    legend.margin=margin(t = 1, unit='cm')) +
  guides(fill = guide_legend(
    label.position = "bottom",
    nrow = 1,
    family = font_labels, 
    color = "#525252",
    keywidth = 1.5, keyheight = 0.5))




# Second graph ------------------------------------------------------------



plot2<-ggplot(data_source, aes(fill=tsc_tree_cover_loss_drivers__type, y=prop, x=Year)) + 
  geom_bar(position="stack", stat="identity")+
  scale_y_continuous(breaks = seq(0, 1,by =0.25), limits=c(0, 1), labels = c("0","25%","50%","75%","100%"),
                     expand = c(0,0)) +
  scale_x_discrete(breaks = seq(2001, 2020,by =1), 
                   labels = c("'01","'02","'03","'04","'05",
                              "'06","'07","'08","'09","'10",
                              "'11","'12","'13","'14","'15",
                              "'16","'17","'18","'19","'20")) +
  scale_fill_manual(values = c( "Shifting agriculture" = "#f0e287",
                                "Commodity driven deforestation" = "#ec8994",    
                                "Unknown"      = "#d5d0cc",
                                "Forestry"     = "#d3d9a9",
                                "Wildfire" = "#68a4d0",
                                "Urbanization" = "#96a4b0")) +
  labs(y = "",
       x = "",
       title = "Global Annual Tree Cover Loss by Dominant Driver Hectares",
       subtitle =  "In 2010, the world had 3.92Gha of tree cover, extending over 30% of its land area. In 2020, it lost 25.8Mha of tree cover. These estimates do not take tree cover gain into account.",
       caption =  "Source: www.globalforestwatch.org\nVisualization: JuanmaMN (Twitter @Juanma_MN)")  +
  theme(
    plot.title = element_text(
      color = "#22222b",face = "bold",size = 14,
      hjust = 0,
      family = font_labels),
    plot.subtitle = element_text(margin = margin(t=5, b= 50),
                                 color = "#22222b", size = 10, family = font_labels,
                                 hjust = 0),
    plot.caption =  element_text(margin = margin(t = 20), 
                                 color = "#22222b", size = 10,
                                 hjust = 0.99,
                                 family = font_labels),
    axis.title.x = element_blank(), 
    axis.title.y = element_blank(), 
    axis.text.x    = element_text(color = "#525252", hjust = 1,family = font_labels, size = 10),
    axis.text.y    = element_text(color = "#525252",hjust = 1,family = font_labels, size = 10),
    panel.background = element_blank(), 
    panel.grid.major = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(), 
    plot.margin = unit(c(2, 2, 2, 2), "cm"),
    plot.background = element_rect(fill = "#f7f7f7", color = NA),    # color removes the border,
    axis.ticks = element_blank(),
    legend.position = "bottom",
    legend.text=element_text(size=8, color = "#525252",family = font_labels),
    legend.key.size = unit(0.2, "cm"),
    legend.title = element_blank(),
    legend.key = element_blank(),
    legend.background=element_blank(),
    legend.margin=margin(t = 1, unit='cm')) +
  guides(fill = guide_legend(
    label.position = "bottom",
    nrow = 1,
    family = font_labels, 
    color = "#525252",
    keywidth = 1.5, keyheight = 0.5))

