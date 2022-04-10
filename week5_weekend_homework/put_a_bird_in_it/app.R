library(tidyverse)
library(shiny)
library(shinythemes)
library(dplyr)
library(CodeClanData)
library(shinythemes)
library(here)
library(leaflet)
# Data clean up process is in "week5_weekend_scratch.rmd"
# loading data
birds_df <- read_csv(here("clean_data/bird_join.csv"))

ui <- fluidPage(
    shinytheme("superhero"),
    (tabsetPanel(
      tabPanel("Our Data", "contents"),
      tabPanel("Bird Observation Maps", leafletOutput() ),
      tabPanel("Observer Map", )
    ))
   
    
    
)    
# Run the application 
shinyApp(ui, server)



