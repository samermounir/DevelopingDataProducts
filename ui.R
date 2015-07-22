library(shiny)

# Define UI for application that draws a histogram

shinyUI(pageWithSidebar(
# Application title.
titlePanel (" Cars DataSet - Explore the correlation between different parameters and  miles per gallon (MPG) "),


# Sidebar with controls to select the parameter according to which the 
# correlation with the mph will be calculated and the graph displayed
sidebarPanel(

## Following are the different columns found in the Cars data set thus
## the application user choose a column from them to be measured versues MPG
selectInput("param", "Please Choose a paramater:", 
            choices = c("Displacement (cu.in.)",
      "Gross horsepower","Rear axle ratio","Weight (lb/1000)","1/4 mile time"
      ,"V/S","Transmission","Number of cylinders","Number of forward gears","Number of carburetors")),
h4 ("A Plot and the correlation value of the chosen paramter versus miles per gallon (MPG)  is calculated and rendered")

       ),
# Main Panel used to display the outputs
mainPanel ( 
## First Output 
      h3("Graph Presenting the chosen Parameter versues Miles per Galon versus "),
## Second Output Plot of the selected parameter versus MPG     
      plotOutput("plot1"),
## Third Output 
      h4 ("The Correlation between the chosen paramter and the Miles per Galon equals"),
## Fourth Output the correlation value between the chosen paramter and MPG
      h4 (textOutput("text1"))
            
            )

          ))