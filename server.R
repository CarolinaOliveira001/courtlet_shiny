server <- function(session, input, output) {
  
  filtered_data <- reactive(
    court_data %>%
      filter(name %in% input$case_name_selected)
  )
  
  output$my_thing <- renderUI({
    things <- filtered_data() %>% 
      pull(first_party)
    selectInput("my_thing", "Pick a thing:", things)
  })
  
  final_selected_data <- reactive(
    filtered_data() %>% 
      filter(first_party %in% input$my_thing)
  )
  
  output$party_text <- renderText({
    first_party <- toString((final_selected_data() %>% 
                               select(first_party))[1,1])
    second_party <- toString((final_selected_data() %>% 
                                select(second_party))[1,1])
    paste(first_party, second_party, sep = " vs ")
  })
  
  output$lawyers_text <- renderText({
    toString((final_selected_data() %>% 
                      select(advocate_name))[1,1])
  })
  
  output$judges_text <- renderText({
    toString((final_selected_data() %>% 
                      select(judges))[1,1])
  })
  
  output$question_text <- renderText({
    print(toString(clean_text(final_selected_data(), "question")[1,1]))
  })
  
  output$facts_text <- renderText({
    print(toString(clean_text(final_selected_data(), "facts")[1,1]))
  })
  
  output$conclusion_text <- renderText({
    print(toString(clean_text(final_selected_data(), "conclusion")[1,1]))
  })
  
  output$winner_text <- renderText({
    winner <- toString((final_selected_data() %>% 
      select("first_party_winner"))[1, 1])
    if (winner == "TRUE"){
      winner_name <- toString((final_selected_data() %>% 
        select("first_party"))[1, 1])
    } else {
      winner_name <- toString((final_selected_data() %>% 
        select("second_party"))[1, 1])
    }
    
    print(paste("Hence the party winner is:", winner_name, ""))
  })
  
  output$vote_plot <- renderPlot({
    final_selected_data() %>% 
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
