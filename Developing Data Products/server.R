data <- read.DIF("data/dataset.dif", stringsAsFactors = FALSE, header = TRUE, transpose = TRUE)
require(fmsb)
shinyServer(function(input, output) {

  output$countriesSelect <- renderUI({
    countries <- data$Country
    selectInput("select", label = h3("Chose Countries"),
                choices = countries, selected = NULL,
                multiple = TRUE, selectize = TRUE)
  })
  
  output$plot1 <- renderPlot({
    if(length(input$select)>0)
    {
      radarchart(rbind(rep(7,6), rep(1,6),
                       subset(data, data$Country %in% input$select)[,-1]),
                 )
      legend("topright", legend = input$select[order(input$select)],
             col = 1:8, lty = 1:6)
    }
  })
  
  output$text_out <- renderPrint({
    
  })
})