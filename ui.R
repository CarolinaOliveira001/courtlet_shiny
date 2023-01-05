ui <- function(request){
  fluidPage(
    
    titlePanel(" "),
    
    sidebarLayout(
      
      sidebarPanel(
        selectizeInput("case_name_selected", "Select the name of the court case:",
                       choices=NULL
        ),
        uiOutput("my_thing"),
        actionButton(inputId = "run_aggregation",
                     label = "Click here to run aggregation"),
        hr(),
        helpText("Original data from Kaggle")
      ),
      
      mainPanel(
        h1("Supreme court cases in USA", align = "center"),
        h4("Parties involved"), 
        textOutput("party_text")%>% 
          withLoader(loader = "loader10"),
        hr(),
        h4("Lawyers involved"), 
        textOutput("lawyers_text") %>% 
          withLoader(loader = "loader10"),
        hr(),
        h4("Judges involved"), 
        textOutput("judges_text") %>% 
          withLoader(loader = "loader10"),
        hr(),
        h4("Question"), 
        textOutput("question_text") %>% 
          withLoader(loader = "loader10"),
        hr(),
        h4("Facts"), 
        textOutput("facts_text") %>% 
          withLoader(loader = "loader10"),
        hr(),
        h4("Conclusion"), 
        textOutput("conclusion_text") %>% 
          withLoader(loader = "loader10"),
        textOutput("winner_text") %>% 
          withLoader(loader = "loader10"),
        hr(),
        plotOutput("vote_plot") %>% 
          withLoader(loader = "loader10")
      )
    )
  )
  
}