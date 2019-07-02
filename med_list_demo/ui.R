# load packages
library(shiny)
library(shinyWidgets)
library(shinydashboard)
library(DT)
library(shinythemes)

# shinyWidgets::shinyWidgetsGallery()

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    # theme = shinytheme("united"),

    # Application title
    titlePanel("Drug vs. Generics Table"),

    
    sidebarLayout(
      sidebarPanel(
            width = 3,
            pickerInput(
              inputId = "variable_name", 
              label = "Select variable/s", 
              choices = variable_names_reduced,
              selected = variable_names_reduced[c(3, 10, 16)],
              options = list(
                `actions-box` = TRUE, 
                size = 10,
                `selected-text-format` = "count > 3",
                "live-search" = TRUE
              ), 
              multiple = TRUE
            ),
  
            pickerInput(
              inputId = "drug_name", 
              label = "Select drug name/s", 
              choices = drugs_unique,
              selected = drugs_unique$drug_dressing_appliances_branded,
              options = list(
                `actions-box` = TRUE, 
                size = 10,
                `selected-text-format` = "count > 3",
                "live-search" = TRUE
              ), 
              multiple = TRUE
            ),
            
            sliderInput("nic_branded_range", "Branded price range:",
                        min = min(0), 
                        max = max(nic_per_item_branded_input),
                        value = c(min(nic_per_item_branded_input),
                                  max(nic_per_item_branded_input))),
            br(),
            br(),
            
            pickerInput(
              inputId = "generics_name", 
              label = "Select generics name/s", 
              choices = generics_unique,
              selected = generics_unique$drug_dressing_appliances_generic,
              options = list(
                `actions-box` = TRUE, 
                size = 10,
                `selected-text-format` = "count > 3",
                "live-search" = TRUE
              ), 
              multiple = TRUE
            ),
            
            sliderInput("nic_generics_range", "Generics price range:",
                        min = min(0),
                        max = max(nic_per_item_generics_input),
                        value = c(min(nic_per_item_generics_input),
                                  max(nic_per_item_generics_input)))
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            # plotOutput("distPlot"),
            dataTableOutput("med_list")
        )
    )
))
