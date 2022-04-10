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
    # Application title
    titlePanel("Put A Bird On It!"),
    
    
)    
# Run the application 
shinyApp(ui = ui, server = server)
