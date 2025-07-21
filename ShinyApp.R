library(shiny)
library(shinydashboard)
library(tidyverse)
library(plotly)
library(DT)

# Load dataset (adjust the file path as needed)
data <- read.csv("disease-burden-from-ncds.csv", stringsAsFactors = FALSE)

# Reshape the data: Pivot all columns except Country, Code, and Year
long_data <- data %>%
  pivot_longer(
    cols = -c(Country, Code, Year),
    names_to = "Disease",
    values_to = "Burden"
  )

# Define the UI
ui <- dashboardPage(
  dashboardHeader(title = "NCD Burden in Africa"),
  dashboardSidebar(
    selectInput("country", "Select Country:", 
                choices = sort(unique(long_data$Country)),
                selected = "Kenya"),
    selectInput("disease", "Select Disease:", 
                choices = sort(unique(long_data$Disease)),
                selected = "Diabetes and kidney diseases")
  ),
  dashboardBody(
    fluidRow(
      box(plotlyOutput("trend_plot"), width = 6),
      box(dataTableOutput("summary_table"), width = 6)
    )
  )
)

# Define the server logic
server <- function(input, output) {
  
  # Filter the data based on the selected country and disease
  filtered_data <- reactive({
    long_data %>%
      filter(Country == input$country, Disease == input$disease)
  })
  
  # Create the trend plot using ggplot2 and convert it to Plotly
  output$trend_plot <- renderPlotly({
    p <- ggplot(filtered_data(), aes(x = Year, y = Burden)) +
      geom_line(color = "steelblue") +
      geom_point(color = "steelblue") +
      labs(title = paste("Trend in", input$disease, "Burden for", input$country),
           x = "Year", y = "DALYs") +
      theme_minimal()
    ggplotly(p)
  })
  
  # Render the filtered data as a DataTable
  output$summary_table <- renderDataTable({
    datatable(filtered_data())
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
