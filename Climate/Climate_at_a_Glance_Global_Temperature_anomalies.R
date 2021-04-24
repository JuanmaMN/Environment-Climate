





# Graph -------------------------------------------------------------------

plot_ly(Temperature, 
        x=~Year, 
        y=~Value, 
        mode="markers", 
        #hoverinfo = "text",
        type="bar", 
        color=~colour , 
        text = ~paste('Year: ', Year, '</br> Value(°C): ', Value)) %>% 
  layout(xaxis = list(title = ""), yaxis = list(title = "anomaly(°C)"),
         font = list(
           family = "Arial",
           size = 10)
  )%>% 
  hide_legend()%>% 
  layout(plot_bgcolor='#f4efe1', autosize = F) %>% 
  layout(paper_bgcolor='#f4efe1')  %>%
  add_annotations(xref = 'paper', yref = 'paper',
                  x = 0.05, y = 0.95,
                  text = paste('Source:Data from www.ncdc.noaa.gov\n Visualization: JuanmaMN (Twitter @Juanma_MN)'),
                  font = list(family = 'Arial', size = 8, color = 'rgb(150,150,150)'),
                  showarrow = FALSE)