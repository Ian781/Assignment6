# server.R
# DataScience HW 6

library(shiny)
library(maps)
library(mapproj)
source("helpers.R")
counties <- readRDS("data/counties.rds")


shinyServer(
  function(input, output) {
    
    output$map <- renderPlot(
    {
      data <- switch(input$var, 
        "Percent White" = counties$white,
        "Percent Black" = counties$black,
        "Percent Hispanic" = counties$hispanic,
        "Percent Asian" = counties$asian)
        
      color <- switch(input$var, 
        "Percent White" = "blue",
        "Percent Black" = "darkgreen",
        "Percent Hispanic" = "brown",
        "Percent Asian" = "black")
        
      legend <- switch(input$var, 
        "Percent White" = "Percent White",
        "Percent Black" = "Percent Black",
        "Percent Hispanic" = "Percent Hispanic",
        "Percent Asian" = "Percent Asian")
        
      percent_map(var = data, color = color, legend.title = legend, max = input$range[2], min = input$range[1])
      }
      )
  }
)
    