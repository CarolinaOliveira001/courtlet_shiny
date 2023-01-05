ui <- function(request){
  fluidPage(
    
    titlePanel(" "),
    
    sidebarLayout(
      
      sidebarPanel(
        selectizeInput("case_name_selected", "Select the name of the court case:",
                       choices=court_data$name,
                       multiple = FALSE,
                       selected = c("Roe v. Wade"),
                       options = list(
                         plugins = list("remove_button"),
                         create = TRUE,
                         persist = FALSE # keep created choices in dropdown
                       )
        ),
        hr(),
        uiOutput("my_thing"),
        #table_subset <- tableOutput("table_subset"),
        #conditionalPanel(
          #condition = "input.case_name_selected == 'custom'",
          #sliderInput("breakCount", "Break Count", min = 1, max = 50, value = 10)
        #),
        hr(),
        helpText("Original data from Kaggle")
      ),
      
      mainPanel(
        h1("Supreme court cases in USA", align = "center"),
        h4("Parties involved"), 
        textOutput("party_text"),
        hr(),
        h4("Lawyers involved"), 
        textOutput("lawyers_text"),
        hr(),
        h4("Judges involved"), 
        textOutput("judges_text"),
        hr(),
        h4("Question"), 
        textOutput("question_text"),
        hr(),
        h4("Facts"), 
        textOutput("facts_text"),
        hr(),
        h4("Conclusion"), 
        textOutput("conclusion_text"),
        textOutput("winner_text"),
        hr(),
        
        plotOutput("vote_plot")
      )
    )
  )
  
}