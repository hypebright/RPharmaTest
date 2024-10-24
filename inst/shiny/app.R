library(shiny)
library(RPharmaTest)

ui <- fluidPage(
  titlePanel("Should You Take a Break?"),
  selectInput("weather", "Weather:", choices = c("sunny", "cloudy", "rainy")),
  numericInput("time", "Time of day (0-24):", value = 12, min = 0, max = 24),
  numericInput("workload", "Workload (0-10):", value = 5),
  textOutput("result")
)

server <- function(input, output) {
  output$result <- renderText({
    if (take_break(input$weather, input$time, input$workload)) {
      "Yes, take a break!"
    } else {
      "No, keep working."
    }
  })
}

shinyApp(ui = ui, server = server)

