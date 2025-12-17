library(shiny)

ui <- fluidPage(
  titlePanel("Sampling-2: Cluster Sampling for Population Mean"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("K", "Total Number of Clusters", 10, min = 2),
      
      numericInput("M", "Units per Cluster", 20, min = 2),
      
      numericInput("S2c", "Between-Cluster Variance (S_c^2)", 25),
      
      numericInput("Cc", "Cost per Cluster", 500),
      
      numericInput("tc", "Time per Cluster (hours)", 4),
      
      numericInput("d", "Allowable Error (d)", 2),
      
      numericInput("b", "Allowable Bias (b)", 0.3),
      
      numericInput("z", "Z value", 1.96),
      
      actionButton("run", "Run Cluster Design")
    ),
    
    mainPanel(
      h4("Required Number of Clusters"),
      verbatimTextOutput("m"),
      
      h4("Cluster Sampling Summary"),
      tableOutput("summary"),
      
      h4("Design of Experiment (Cluster Sampling)"),
      plotOutput("designPlot", height = "350px")
    )
  )
)

server <- function(input, output) {
  
  observeEvent(input$run, {
    
    # Required number of clusters
    m <- ceiling(
      (input$z^2 * input$S2c) /
        (input$d^2 - input$b^2)
    )
    
    m <- min(m, input$K)
    
    output$m <- renderText(m)
    
    output$summary <- renderTable({
      data.frame(
        Total_Clusters = input$K,
        Selected_Clusters = m,
        Units_per_Cluster = input$M,
        Cost_per_Cluster = input$Cc,
        Time_per_Cluster = input$tc,
        Total_Cost = m * input$Cc,
        Total_Time = m * input$tc
      )
    })
    
    output$designPlot <- renderPlot({
      
      set.seed(123)
      selected_clusters <- sample(1:input$K, m)
      
      plot(1:input$K, rep(1, input$K),
           pch = 19,
           col = ifelse(1:input$K %in% selected_clusters, "red", "grey"),
           xlab = "Cluster Index",
           ylab = "",
           yaxt = "n",
           main = "Cluster Sampling Design")
      
      legend("topright",
             legend = c("Selected Clusters", "Non-selected Clusters"),
             col = c("red", "grey"),
             pch = 19)
    })
  })
}

shinyApp(ui = ui, server = server)
