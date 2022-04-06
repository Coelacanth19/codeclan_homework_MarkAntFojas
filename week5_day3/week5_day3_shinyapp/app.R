#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(janitor)
library(here)
library(dplyr)
library(readxl)

supplychain_order <- read_excel(here::here("data/Supply chain logisitcs problem.xlsx"))
  
# Define UI for application that draws a histogram
ui <- fluidPage(
)
# Run the application 
shinyApp(ui = ui, server = server)
