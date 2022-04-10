library(tidyverse)
library(shiny)
library(dplyr)
library(CodeClanData)
library(shinythemes)

ui <- fluidPage(
 # theme = shinytheme("superhero"),
  # Application title
  titlePanel("A Customisable Scatter Plot"),
  fluidRow(
    column(3,
           selectInput("color_input", 
                       "Colour of Points", 
                       choices = c(Blue = "#3891A6",
                                   Yellow = "#FDE74C", 
                                   Red = "#E3655B") 
             
                      )
           ),
    column(2,
           selectInput("shape_input", 
                       "Shape of points", 
                       choices = c(Square = 15, 
                                  Circle = 16, 
                                  Triangle = 17)
                       )
          ),
    column(2,
           sliderInput("alpha_input", 
                       "Transparency of points", 
                       min = 0, max = 1, value = 0.5, step = 0.1, ticks = TRUE)
          )
  ), 
  fluidRow(
    column(12,
           plotOutput("scatter_plot"),
   column(2,
                  textInput("title_input", "Title of Graph", value = "Reaction Time vs. Memory Games"),
           ),
  )
       
    ),


)

server <- function(input, output, session) {

output$scatter_plot <- renderPlot({
  ggplot(students_big) +
  aes(x = reaction_time, 
      y = score_in_memory_game) +
  geom_point(color = input$color_input, 
             alpha = input$alpha_input,
             shape = as.numeric(input$shape_input) 
            ) +
  ggtitle(input$title_input)

})

}

# Run the application 
shinyApp(ui = ui, server = server)
