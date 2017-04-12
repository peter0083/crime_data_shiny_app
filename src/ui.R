#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(colourpicker)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel(
    h1("Crime Data for the 10 Best Cities for Jobs (USA)")
    ),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "year_range", 
                  label = "Year Range:",
                  min = 1975, 
                  max = 2015, 
                  sep = "", # avoid having comma when displaying the year
                  value = c(1980,2005))
    ,
      selectInput(inputId = "crime_type", 
                label = "Select Crime Type", 
                choices = list("Violent Crimes per 100k people" = "violent_per_100k",
                               "Homicides per 100k people"= "homs_per_100k", 
                               "Rapes per 100k people"= "rape_per_100k", 
                               "Robberies per 100k people" = "rob_per_100k", 
                               "Aggravated Assault per 100k people" ="agg_ass_per_100k"), 
                selected =  "violent_per_100k")
    ,
      selectInput(inputId = "city1", 
                label = "Select City 1", 
                choices = list("1. San Jose"= "San Jose", 
                               "2. San Francisco"= "San Francisco", 
                               "3. Seattle" = "Seattle", 
                               "4. Boston" = "Boston",
                               "5. Washington, D.C." = "Washington, D.C.",
                               "6. Austin, Texas" ="Austin, Texas", 
                               "7. Salt Lake City"="Salt Lake City",
                               "8. Raleigh, N.C." = "Raleigh, N.C.",
                               "9. Minneapolis"= "Minneapolis",
                               "10. Oklahoma City" = "Oklahoma City"),
                selected =  "Seattle")
    ,
      selectInput(inputId = "city2", 
                label = "Select City 2", 
                choices = list("1. San Jose"= "San Jose", 
                               "2. San Francisco"= "San Francisco", 
                               "3. Seattle" = "Seattle", 
                               "4. Boston" = "Boston",
                               "5. Washington, D.C." = "Washington, D.C.",
                               "6. Austin, Texas" ="Austin, Texas", 
                               "7. Salt Lake City"="Salt Lake City",
                               "8. Raleigh, N.C." = "Raleigh, N.C.",
                               "9. Minneapolis"= "Minneapolis",
                               "10. Oklahoma City" = "Oklahoma City"),
                selected =  "Boston")
    ,
      numericInput(inputId = "alpha_input",
                   label = "Select Data point transparency \n (1 = least transparent; 0.1 = most transparent)", 
                   value = 1, 
                   min = 0.1, 
                   max = 1, 
                   step = 0.1,
                   width = NULL)
    ,
      checkboxInput(inputId = "viridis", 
                    label = "Colour adjustment for colour vision deficiency users", 
                    value = FALSE)
    ,
      radioButtons(inputId = "scatter_plot", 
                   label = "Scatter plot or line chart?", 
                   choices = c("Scatter Plot"= 1, "Line Chart"= 2), 
                   selected = 2, 
                   inline = FALSE,
                   width = NULL)
    , 
      a(href="https://www.themarshallproject.org/#.xTfnU9sDb", h5("Crime Data Source: The US Marshall Project Dataset")),
      a(href="https://www.glassdoor.com/List/Best-Cities-for-Jobs-LST_KQ0,20.htm", h5("City Ranking Source: Glassdoor.com 2016")
      )
      ## <html>
      ## <body>
      ## <a href="https://www.glassdoor.com/List/Best-Cities-for-Jobs-LST_KQ0,20.htm"><h5>"City Ranking Source: Glassdoor.com 2016"</h5></a>
      ## </body>
      ## </html>
    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("linePlot",
                  # add click, dbclick, hover and brush functions
                  click = "plot_click",
                  dblclick = dblclickOpts(id = "plot_dblclick")
                  ),

       fluidRow(
         column(width = 6,
                verbatimTextOutput("click_info")
         ),
         column(width = 6,
                verbatimTextOutput("dblclick_info")
         ),
      
       fluidPage(
        colourInput("col", "Select a font colour for graph title", "black"),
        plotOutput("plot")
       )
    )
  )
)))
