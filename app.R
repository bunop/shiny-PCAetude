#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggfortify)

# get my data
source("./helper.r")

# Define UI for application that draws a PCA
# <div class="container-fluid">
ui <- fluidPage(
  # <h2> and <title> in the head
  titlePanel("Example PCA on Iris Dataset", windowTitle = "IRIS Dataset PCA"),
  
  # define a standard layout, a side for control data, and main area, respectively 1/3 and 2/3
  # <div=class="row">
  sidebarLayout(
    # <div=class="col-sm-4">
    sidebarPanel(
      tags$h3("I'm sidebar panel")
    ),
    
    # <div=class="col-sm-8">
    mainPanel(
      tags$h3("I'm main panel"),
      
      # 'pca' should be defined in server function
      plotOutput("pca")
    )
  )
)

# Define server logic required to draw a PCA
server <- function(input, output) { 
  # define my output. Render a plot with ggfortify
  output$pca <- renderPlot({
    # this is a function in ggfortify which display PCA data
    # this is returned as the result in renderPlot code block
    autoplot(
      pca_res, 
      data = iris, 
      colour = 'Species', 
      loadings = T, 
      loadings.colour = 'blue', 
      loadings.label = TRUE, 
      loadings.label.size = 3
    )
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
