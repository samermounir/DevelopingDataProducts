
## Loading the needed Libraries
library(shiny)
library(datasets)
library (ggplot2)
data (mtcars)
mycars<-mtcars
shinyServer (function(input, output) 
{
# Return the requested parameter
paramInput <- reactive({
      switch(input$param,
      "Number of cylinders"= mycars$cyl, 
      "Displacement (cu.in.)"= mycars$disp,
      "Gross horsepower" = mycars$hp,
      "Rear axle ratio" = mycars$drat,
      "Weight (lb/1000)" = mycars$wt,
      "1/4 mile time"    =mycars$qsec,
      "V/S"= mycars$vs,
      "Transmission" =mycars$am ,
      "Number of forward gears" = mycars$gear,
      "Number of carburetors" = mycars$carb      
             )
})

## Plotting the grpah of the chosen paramter and MPG
output$plot1 <- renderPlot(
{ 
qplot (paramInput() ,mpg , data =mycars,geom = c("point", "smooth")
       ,xlab = "Chosen Parameter")

})

## Calculating the Correlation between the chosen paramter and MPG
output$text1<- renderText( { cor (paramInput() ,mycars$mpg)
          
})

})