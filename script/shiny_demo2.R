library(shiny)
library(tidyverse)

# See https://mjandrews.shinyapps.io/binomial_likelihood3/

N <- 50

ui <- fluidPage(
  tags$style(type = "text/css", ".irs-grid-pol.small {height: 0px;}"),
  titlePanel(title = 'Binomial Likelihood Function'),
  
  sidebarLayout(
    sidebarPanel = sidebarPanel(
      shiny::helpText("Choose the number of trials and the number of successes in a
                      binomial experiment. The plot shows the corresponding likelihood function."),
      sliderInput(inputId = 'N',
                  'Number of trials',
                  min = 0,
                  max = 100,
                  value = 50),
      sliderInput(inputId = 'm',
                  'Number of successes',
                  min = 0,
                  max = N,
                  value = ceiling(N/2))
    ),
    mainPanel  = mainPanel(
      tabsetPanel(
        tabPanel(title = 'Likelihood',
                 plotOutput('likelihood_plot')
        ),
        tabPanel(title = 'Sampling distribution',
                 plotOutput('sampling_plot')
        )      
      ),
    )
    
  )
  
  
  
  
)


server <- function(input, output){
  
  output$likelihood_plot <- renderPlot({
    
    data_df <- 
      tibble(theta = seq(0, 1, by = 0.001),
             p = dbinom(x = input$m, size = input$N, prob = theta)
      )
    
    ggplot(data_df, aes(x=theta, y=p)) + 
      geom_line() + 
      theme_classic() +
      labs(x = 'Probability of success', y = 'likelihood')
  })
  
  output$sampling_plot <- renderPlot({
    
    data_df <- 
      tibble(x = seq(input$N),
             p = dbinom(x = x, size = input$N, prob = 0.5)
      ) %>% mutate(
        extreme = abs(x - abs(input$N/2)) >= abs(input$m - abs(input$N/2))
      )
    
    ggplot(data_df, aes(x=x, y=p, fill = extreme)) + 
      geom_col() + 
      theme_classic() +
      labs(x = 'Number of successes', y = 'Probability') + 
      theme(legend.position = 'none')
  })
  
  observeEvent(
    input$N, {
      updateSliderInput(
        inputId = 'm',
        max = input$N,
        value = ceiling(input$N/2)
      ) 
    }
  )
}

shinyApp(ui, server)