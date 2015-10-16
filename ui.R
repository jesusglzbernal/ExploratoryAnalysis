library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Exploratory Data Analysis"),
    sidebarPanel(
	selectInput("dataset", "Choose the dataset to perform your Exploratory Data Analysis:",
		choices = c("BreastCancer", "Soybean",
		 	    "DNA", "Vehicle", "Prostate")),
        textInput("attTable", "Write the Attribute Number for the table TAB:", "11"),
	textInput("attHist", "Write the Attribute Number for the histogram TAB (better for nominal attributes):", "1"),
        textInput("attLin1", "Write Attribute One for the Plot TAB (better for numerical attributes):", "1"),
	textInput("attLin2", "Write Attribute two for the Plot TAB (better for numerical attributes):", "2")
    ),
    mainPanel(
	tabsetPanel(
	    tabPanel("Summary", verbatimTextOutput("summary")),
	    tabPanel("Features", verbatimTextOutput("features")),
	    tabPanel("Number of Samples", verbatimTextOutput("samples")),
	    tabPanel("Attribute Table", verbatimTextOutput("attTable")),
	    tabPanel("Histogram", plotOutput("attHist")),
	    tabPanel("Scatter Plot", plotOutput("attReg")),
	    tabPanel("Documentation", htmlOutput("doc")))
    )
))
