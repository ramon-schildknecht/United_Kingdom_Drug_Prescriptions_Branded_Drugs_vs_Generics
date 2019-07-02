#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$med_list <- DT::renderDataTable({
        d %>% 
        select(input$variable_name, nic_per_item_branded, nic_per_item_generic) %>%
        filter((drug_dressing_appliances_branded %in% input$drug_name &
                      between(nic_per_item_branded, input$nic_branded_range[1],
                              input$nic_branded_range[2])) |
                       (drug_dressing_appliances_generic %in% input$generics_name) & 
                       between(nic_per_item_generic, input$nic_generics_range[1], 
                               input$nic_branded_range[2]))
      
    }, filter = "top")
  
    # output$distPlot <- renderPlot({
    # 
    #     # generate bins based on input$bins from ui.R
    #     x    <- faithful[, 2]
    #     bins <- seq(min(x), max(x), length.out = input$bins + 1)
    # 
    #     # draw the histogram with the specified number of bins
    #     hist(x, breaks = bins, col = 'darkgray', border = 'white')
    # 
    # })

})
