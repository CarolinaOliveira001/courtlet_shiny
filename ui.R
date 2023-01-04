ui <- function(request){
  fluidPage(
    
    titlePanel("Supreme court cases in USA"),
    
    sidebarLayout(
      
      sidebarPanel(
        selectizeInput("case_name_selected", "Select the name of the court case:",
                       choices=unique(court_data$name),
                       multiple = FALSE,
                       selected = c("Roe v. Wade"),
                       options = list(
                         plugins = list("remove_button"),
                         create = TRUE,
                         persist = FALSE # keep created choices in dropdown
                       )
        ),
        hr(),
        helpText("Original data from Kaggle")
      ),
      
      mainPanel(
        plotOutput("vote_plot")
      )
    )
  )
  
}