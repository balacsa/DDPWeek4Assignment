#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("mtcars data presentation web application"),
  
  sidebarLayout(
    
    sidebarPanel(
       checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
       checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1)),
       checkboxGroupInput('gear', 'Number of gears:', c("Three"=3, "Four"=4, "Five"=5), selected = c(3,4,5)),
       radioButtons("rbCond", "Show mpg ~ disp depends on :",
                    choiceNames = list(
                      "gear",
                      "cyl",
                      "transmission"
                    ),
                    choiceValues = list(
                      "gear", "cyl", "am"
                    ))       
    ),
    
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Plot", plotOutput("plot1")),
                  tabPanel("Summary", verbatimTextOutput("summary")),
                  tabPanel("Table", dataTableOutput("table1"))
      )      
      
    )
    , position = c("left", "right"),
    fluid = TRUE
  )
  
))
