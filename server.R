server <- function(session, input, output) {
  
  filtered_data <- reactive(
    court_data %>%
      filter(name %in% input$case_name_selected)
  )
  
  output$vote_plot <- renderPlot({
    
    filtered_data() %>% 
      select(name, majority_vote, minority_vote) %>% 
      pivot_longer(!name, names_to = "vote", values_to = "count") %>% 
      ggplot(aes(x = as.factor(vote), y = count, fill = vote)) +
      geom_bar(stat = 'identity', position = "dodge") +
      scale_x_discrete(labels = c("majority vote", "minority vote")) +
      scale_fill_hue(c = 40) +
      labs(title = paste("Vote count for", input$case_name_selected)) +
      theme(plot.title = element_text(hjust = 0.5),
            axis.title.x = element_blank(),
            legend.position="none")
    
  })
}
