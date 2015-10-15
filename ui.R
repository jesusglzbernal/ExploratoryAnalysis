library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Exploratory Data Analysis"),
    sidebarPanel(
	selectInput("dataset", "Choose the dataset to perform your Exploratory Data Analysis:",
		choices = c("BreastCancer", "Soybean",
		 	    "DNA", "Vehicle", "Prostate")),
        textInput("attTable", "Attribute for table:", "11"),
	textInput("attHist", "Attribute for histogram (better for nominal attributes):", "1"),
        textInput("attLin1", "Attribute one for plot (better for numerical attributes):", "1"),
	textInput("attLin2", "Attribute two for plot (better for numerical attributes):", "2")
    ),
    mainPanel(
	tabsetPanel(
	    tabPanel("Summary", verbatimTextOutput("summary")),
	    tabPanel("Features", verbatimTextOutput("features")),
	    tabPanel("Number of Samples", verbatimTextOutput("samples")),
	    tabPanel("Attribute Table", verbatimTextOutput("attTable")),
	    tabPanel("Histogram", plotOutput("attHist")),
	    tabPanel("Scatter Plot", plotOutput("attReg")))
    )
))
