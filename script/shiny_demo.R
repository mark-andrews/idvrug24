library(shiny)
library(tidyverse)

N <- 100

ui <- fluidPage(
  
  sidebarLayout(
    
    sidebarPanel = sidebarPanel(
      
      helpText("The slider represents the number of successes in a binomial experiment.
               The plot shows the likelihood function for that binomial experiment
               "),
      
      sliderInput(inputId = 'N',
                  'Number of trials',
                  min = 0,
                  max = N,
                  value = 50),
      
      sliderInput(inputId = 'm',
                  'Number of successes',
                  min = 0,
                  max = N,
                  value = 25)
    ),
    
    mainPanel = mainPanel(
      plotOutput('likelihood_plot')
    )
  
  )
)

server <- function(input, output){
  
  output$likelihood_plot <- renderPlot({
    data_df <- tibble(
      theta = seq(0, 1, by = 0.001),
      p = dbinom(x = input$m, size = input$N, prob = theta))
    
    ggplot(data_df,
           mapping = aes(x = theta, y = p)
    ) + geom_line() + theme_classic() +
      labs(x = 'Probability of a success', y = 'likelihood')
  })
}

shinyApp(ui = ui, server = server)