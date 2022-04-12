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
simple_bird_name <- c("petrel", "prion", "shearwater", "albatross", "gannet", 
                      "skua", "penguin", "hoddy", "gull", "albatross", 
                      "procelllaria", "shag", "tropicbird", "cormorant", 
                      "booby", "tern", "sheathbill")

ui <- fluidPage(
    shinytheme("superhero"),
    (tabsetPanel(
      tabPanel("Our Data", "contents"),
      tabPanel("Bird Observation Maps", 
               (sidebarLayout(
                 sidebarPanel(width = 3, 
                              selectInput("simple_bird_input", 
                                          "Select Bird", 
                                          choices = simple_bird_name
                                        )
               ),
                  mainPanel(
                              leafletOutput("bird_map"), width = 10
                              ),
      tabPanel("Observer Map", leafletOutput("observer_map"), width = 10 )
    )
)
)
)
),

server <- function(input, output, session) {
  
}

output$bird_map <- renderLeaflet({
  birds_df %>% 
    select()
    leaflet()
  
  
}),
  

output$observer_map <-
# Run the application 
shinyApp(ui, server)




