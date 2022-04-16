library(shiny)#Load shiny
library(tidyverse) #Load tidyverse

ui <- fluidPage(
  sliderInput(inputId = "num", #ID name for the input
              label = "Choose a number", #Label above the input
              value = 50, min = 1, max = 100 #value for the slider
              ),
  # Add elements to your app using fluidPage()
  # Inputs functions,
  # Outputs functions
  textInput(inputId = "title",#new ID is title
            label = "Write a title", #Labeling title
            value = "Histogram of Random Normal Values"), #Starting title
  plotOutput("hist"), #creates space for a plot called hist
  verbatimTextOutput("stats") #creates a space for stats
)
server <- function(input, output){
  
  data <- reactive({ #reactive object
    tibble(x = rnorm(input$num))#100 random normal points
  })
  output$hist <- renderPlot({ {} # allows us to put all our R code in one nice chunk
    ggplot(data(), aes(x = x)) + #make a histogram
      geom_histogram() +
      labs(title = input$title)#Add a new title
  
    # R code to make the hist output goes here  
  })
  output$stats <- renderPrint({
    summary(data()) #calculate summary stats based on the numbers
  })
}
shinyApp(ui = ui, server = server) 
