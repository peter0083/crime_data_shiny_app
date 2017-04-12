#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)
library(viridis)
library(tidyr)

# read the crime data set as reactive
crime_data <- read.csv("CopyOfucr_crime_1975_2015.csv")

# Define server logic required to draw graphs
shinyServer(function(input, output) {
   
    output$linePlot <- renderPlot({
    
    # select a city
    city_of_choice <- c(input$city1, input$city2)
    crime_data_city <- crime_data %>%
     filter(department_name == city_of_choice)
    
    # select crime type based on input$crime from ui.R
    max_year <- max(input$year_range) # define the upper limit of year range by input
    min_year <- min(input$year_range) # define the lower limit of year range by input
    plot_title <- paste(input$crime_type, "from", min_year, "to", max_year, sep = " ")

    # draw the line plot with the specified crime type and year range
    
    # scatter plot + no viridis
    if (input$scatter_plot == 1 & input$viridis == FALSE) {
      ggplot(crime_data_city, aes_string(x= "year", y= input$crime_type, colour= "department_name")) +
        geom_point(size= 3, alpha= input$alpha_input) +
        coord_cartesian(xlim=c(min_year, max_year)) +
        scale_color_discrete(name = "City") +
        ggtitle(plot_title) +
        theme(plot.title = element_text(size = 20, hjust = 0.5, colour = input$col),
              axis.title.y = element_text(size = 13, vjust=0.5, angle = 0),
              axis.title.x = element_text(size = 13, angle = 0),
              axis.text.y = element_text(size = 12),
              axis.text.x = element_text(size =12)
        )
    }
    
    # line chart + viridis
    else if (input$scatter_plot == 2 & input$viridis == TRUE) {
      ggplot(crime_data_city, aes_string(x= "year", y= input$crime_type, colour= "department_name")) +
        geom_line() +
        geom_point(size= 3, alpha= input$alpha_input) +
        coord_cartesian(xlim=c(min_year, max_year)) +
        scale_color_viridis(begin = 0, end = 0.6, option = "C", discrete = TRUE, name = "City") +
        ggtitle(plot_title) +
        theme(plot.title = element_text(size = 20, hjust = 0.5, colour = input$col),
              axis.title.y = element_text(size = 13, vjust=0.5, angle = 0),
              axis.title.x = element_text(size = 13, angle = 0),
              axis.text.y = element_text(size = 12),
              axis.text.x = element_text(size =12)
        )
    } 
    # line chart + no viridis
    else if (input$scatter_plot == 2 & input$viridis == FALSE) {
      ggplot(crime_data_city, aes_string(x= "year", y= input$crime_type, colour= "department_name")) +
        geom_line() +
        geom_point(size= 3, alpha= input$alpha_input) +
        coord_cartesian(xlim=c(min_year, max_year)) +
        scale_color_discrete(name = "City") +
        ggtitle(plot_title) +
        theme(plot.title = element_text(size = 20, hjust = 0.5, colour = input$col),
              axis.title.y = element_text(size = 13, vjust=0.5, angle = 0),
              axis.title.x = element_text(size = 13, angle = 0),
              axis.text.y = element_text(size = 12),
              axis.text.x = element_text(size =12)
        )
    }  
    # scatter plot + viridis
    else if (input$scatter_plot == 1 & input$viridis == TRUE) {
        ggplot(crime_data_city, aes_string(x= "year", y= input$crime_type, colour= "department_name")) +
          geom_point(size = 3, alpha= input$alpha_input) +
          coord_cartesian(xlim=c(min_year, max_year)) +
          scale_color_viridis(begin = 0, end = 0.6, option = "A", discrete = TRUE, name = "City") +
          ggtitle(plot_title) +
          theme(plot.title = element_text(size = 20, hjust = 0.5, colour = input$col),
                axis.title.y = element_text(size = 13, vjust=0.5, angle = 0),
                axis.title.x = element_text(size = 13, angle = 0),
                axis.text.y = element_text(size = 12),
                axis.text.x = element_text(size =12)
                )
    }

    })
    # click and dbclick interaction for comparing two data points
    output$click_info <- renderPrint({
      cat("Single-Click to select one \n point on the graph:\n")
      str(input$plot_click$x)
      str(input$plot_click$y)
    })
    output$dblclick_info <- renderPrint({
      cat("Double-Click to select another\n point on the graph:\n")
      str(input$plot_dblclick$x)
      str(input$plot_dblclick$y)
    })

  })


