##server.r
## Server side code for Shiny Application (Air Quality Modelling)
library(shiny)
library(datasets)

shinyServer(function(input, output) {
    
    ## create the text for the linear modelling of ozone versus the chosen variable by the user 
    modelnametext <- reactive({
        paste("Scatter Plot of Ozone ~", input$var)
    })
    ## serve up the modelname field for the user 
    output$modelname <- renderText({
        modelnametext()
    })
    
    modelnameint <- reactive({
        paste("Ozone ~", "as.integer(", input$var, ")")
    })
    
    ## run the linear model of ozone versus the users chosen variable 
    fitmod <- reactive({
        lm(as.formula(modelnameint()), data=airquality)
    })
    
    ## serve up the chosen scatter plot
    output$airqualplot <- renderPlot({
        with(airquality, {
            plot(as.formula(modelnameint()))
            abline(fitmod(), col=12)
        })
        
    ## serve up the model statistics details if the user has 'ticked' the 'show all statistics...' box.
    output$fitmod <- renderPrint({
        if(input$showstat) {
                summary(fitmod())
            }
        })
        
    })
    
})