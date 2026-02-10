install.packages("shiny")
library(shiny)

# Define UI
ui <- shiny::fluidPage(
  titlePanel("My Shiny Application"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("obs",
                  "Number of observations:",
                  min = 1,
                  max = 100,
                  value = 50)
    ),
    
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  output$distPlot <- shiny::renderPlot({
    hist(rnorm(input$obs),
         col = "steelblue",
         border = "white",
         main = "Histogram of Random Normal Values",
         xlab = "Value")
  })
}

# Run the application
shiny::shinyApp(ui = ui, server = server)
