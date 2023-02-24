# READ ME

## How to run this pipeline

Step 1: Clone the repository using the following ssh key:

```
git clone git@github.com:CarolinaOliveira001/courtlet_shiny.git
```

Step 2: Open the folder which appeared from the previous step on your R programm of choice.

Step 3: Run the following command on your R-console.

```
shiny::runApp()
```

## How to solve some possible issue

There might be some packages missing to run this app smoothly. So if not yet done, I would recommend to run the following line:

```
install.packages(c("dplyr", "ggplot2", "shinycustomloader", "tidyverse"))
```

Also my R-package is needed. For further information about the package, visit <a href="url">https://github.com/CarolinaOliveira001/courtlet</a>. After running the code below to your R-console, you can run Step 3 on last time.

```
install.packages("devtools") 

devtools::install_github('CarolinaOliveira001/courtlet', ref = '1993732210393b9598d1b7f91b8390f5cca6a84e')
```

## Future plans for this app

There are some ideas I would like to implement in this interactive app and then only then I will dockerize everything.
