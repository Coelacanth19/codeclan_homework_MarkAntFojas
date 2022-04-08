library(tidyverse)
library(shiny)
library(dplyr)
library(CodeClanData)
library(shinythemes)

ui <- fluidPage(
  theme = shinytheme("Superhero"),
  # Application title
  titlePanel("A Customisable Scatter Plot"),
  fluidRow(
    column(4,
           selectInput("color_input", 
                       "colour", 
                       choices = c(Blue = "#3891A6",
                                   Yellow = "#FDE74C", 
                                   Red = "#E3655B") 
             
                      )
           ),
    column(4,
           selectInput("shape_input", 
                       "shapes", 
                       choices = c(Square = 15, 
                                  Circle = 16, 
                                  Triangle = 17)
                       )
           )
    
    
)
)


server <- function(input,output {

filtered_data <- reactive(input$color_input,
                          input$shape_input)
})


# Run the application 
shinyApp(ui = ui, server = server)