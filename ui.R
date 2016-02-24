library(shiny)
## UI code for Shiny Application (Air Quality Modelling)
## Setup fields/panels/tabs layout for the landing page
shinyUI(
    navbarPage("Shiny Application for Ozone Analysis",
        tabPanel("Compare Models",
            fluidPage(
                titlePanel("The relationship between Air Quality variables and Ozone"),
                    sidebarLayout(
                        sidebarPanel(
                            h4("Description:"),
                            p("The shinyapp lets you explore the relationship between Ozone and five
                                other variables recorded in the airquality dataset. Choose any variable to see a scatter plot
                                of the linear relationship between the two variables. Tick the 'Show all...' box to see the 
                                summary statistics for the linear relationship."),
                            selectInput("var", "Variable:",
                                        c("Solar Radiation" = "Solar.R",
                                         "Wind (mph)" = "Wind",
                                        "Temperature (degrees F)" = "Temp",
                                        "Month of Year" = "Month",
                                        "Day of Month (1-31)" = "Day"
                                        )),
                            ## setup checkbox and label
                                    checkboxInput("showstat", "Show All Statistics for this Model", FALSE)
                                ),
                                ## setup plot area to display the various plots
                                mainPanel(
                                    h3(textOutput("modelname")),
                                    tabPanel("Regression model", 
                                    plotOutput("airqualplot"),
                                    ## setup text area to display the model statistics 
                                    verbatimTextOutput("fitmod")
                                    )
                                )
                            )
                        )
               ),
               ## setup 2nd page (working of tabs) to display the airquality data details
               tabPanel("New York Air Quality Measurements",
                        hr(),
                        h3("Description"),
                        helpText("Daily air quality measurements in New York, May to September 1973."),
                        h3("Usage"),
                        p("airquality"),
                        h3("Format"),
                        p("A data frame with 154 observations on 6 variables."),
                        p("  [, 1]   Ozone	 numeric	 Ozone (ppb)"),
                        p("  [, 2]	 Solar.R	 numeric	 Solar R (lang)"),
                        p("  [, 3]	 Wind	 numeric	 Wind (mph)"),
                        p("  [, 4]	 Temp	 numeric	 Temperature (degrees F)"),
                        p("  [, 5]	 Month	 numeric	 Month (1--12)"),
                        p("  [, 6]	 Day	 numeric	 Day of month (1--31)"),
                        h3("Details"),
                        p("Daily readings of the following air quality values for May 1, 1973 (a Tuesday) to September 30, 1973"),
                        h3("Source"),
                        p("The data were obtained from the New York State Department of Conservation (ozone data) and the National Weather Service (meteorological data).")
               )
               
    )
)