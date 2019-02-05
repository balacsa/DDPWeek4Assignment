#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


shinyServer(function(input, output) {
  library(datasets) 
  
  output$plot1 <- renderPlot({
    mtcars2 <- mtcars
    mtcars2 <- mtcars2[mtcars2$cyl %in% input$cyl,]
    mtcars2 <- mtcars2[mtcars2$am %in% input$am,]
    mtcars2 <- mtcars2[mtcars2$gear %in% input$gear,]
    coplot(mpg ~ disp | as.factor(mtcars2[[input$rbCond]]) ,data = mtcars2, panel = panel.smooth, rows = 1, show.given = TRUE ,
           xlab = c ("disp", input$rbCond ), ylab = "mpg")
  })
  
  output$table1 <- renderDataTable(
      {
        mtcars2 <- mtcars
        mtcars2 <- mtcars2[mtcars2$cyl %in% input$cyl,]
        mtcars2 <- mtcars2[mtcars2$am %in% input$am,]
        mtcars2 <- mtcars2[mtcars2$gear %in% input$gear,]
        },options = list(searching = FALSE))

  output$summary <- renderPrint({
    mtcars2 <- mtcars
    mtcars2 <- mtcars2[mtcars2$cyl %in% input$cyl,]
    mtcars2 <- mtcars2[mtcars2$am %in% input$am,]
    mtcars2 <- mtcars2[mtcars2$gear %in% input$gear,]
    summary(mtcars2)
  })
    
})
