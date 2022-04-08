

library(shiny)
library(CodeClanData)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(
    # Application title
    titlePanel("Height and Arm Span vs Age"),
    fluidRow(
      column(4,
             plotOutput("arm_span_plot")
      ),
      
      column(4,
             plotOutput("height_plot")
      ),
      
      column(4,
    radioButtons("age_input",
                 "Age",
                 choices = unique(students_big$ageyears), inline = TRUE)
    
      )
    
),
)
# Define server logic
server <- function(input, output) {

filtered_data <- reactive({
   students_big %>% 
    filter(ageyears == input$age_input)
})

  output$table_data <- renderDataTable(filtered_data())
  
  output$arm_span_plot <- renderPlot({
    ggplot(filtered_data()) +
      aes(x = arm_span) +
      geom_bar()
  }) 
    
  output$height_plot <- renderPlot({
      ggplot(filtered_data()) +
        aes(x = height) +
        geom_bar()
  })
}


# Run the application 
shinyApp(ui = ui, server = server)
