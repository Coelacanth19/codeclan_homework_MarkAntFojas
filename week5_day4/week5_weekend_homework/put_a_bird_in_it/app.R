library(tidyverse)
library(shiny)
library(dplyr)
library(CodeClanData)
library(shinythemes)


ui <- fluidPage(
    # Application title
    titlePanel("Put A Bird On It!"),
    
)    
# Run the application 
shinyApp(ui = ui, server = server)
