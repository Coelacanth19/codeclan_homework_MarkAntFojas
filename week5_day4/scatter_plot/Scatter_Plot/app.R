library(tidyverse)
library(shiny)
library(dplyr)
library(CodeClanData)
library(shinythemes)

ui <- fluidPage(
  theme = shinytheme("superhero"),
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
    column(3,
           selectInput("shape_input", 
                       "Shape of points", 
                       choices = c(Square = 15, 
                                  Circle = 16, 
                                  Triangle = 17)
                       )
          ),
    column(3,
           sliderInput("transparency_input", "Transparency of points", min = 0, max = 1, value = 0.5, step = 0.1, ticks = TRUE)
          ),
    
    column(3,
           textInput("title_input", "Title of Graph")
             
           ))
    #if you had programmed this portion, you would be home by now
    #if-else statements go here
    #ggtitle is a function of ggplot so should go in output this portion is 
    #UI only
    
)
)


server <- function(input,output, session) {

inputs_data <- reactive(input$color_input,
                          input$shape_input,
                          input$alpha_input,
                          input$title_input)

}

#what do we want the variables created to do?
#combine the input from all inputs: color_input, shape_input... to get 
#plotOutput
#output$color_input <- render
students_big %>%
ggplot()
aes(x = reaction_time, 
    y= score_in_memory_game, 
    color = input$color_input,
    shape = input$shape_input,
    )
geom_point(alpha = input$alpha_input) +
  ggtitle(label = input$text_input)
#output$shape_input 



# Run the application 
shinyApp(ui = ui, server = server)
