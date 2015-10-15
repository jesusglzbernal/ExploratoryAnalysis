library(shiny)

library(mlbench)
library(lasso2)
data(BreastCancer)
data(Soybean)
data(DNA)
data(Vehicle)
data(Prostate)
shinyServer(
    function(input, output)  
    {
        datasetInput <- reactive({
		switch(input$dataset,
		    "BreastCancer" = BreastCancer,
		    "Soybean" = Soybean,
		    "DNA" = DNA,
		    "Vehicle" = Vehicle,
		    "Prostate" = Prostate)
	        })

        optionInput <- reactive({
		switch(input$option,
		    "Data Summary" = summary,
		    "Features Description" = features,
		    "Number of Samples" = nrows)
		})

	att <- reactive({ 
	    validate( need(!is.numeric(input$attTable), "Please enter a number..."))
	    validate( need(input$attTable != "", "Please enter a number..."))
	    input$attTable })

	histo <- reactive({ 
	    validate( need(!is.numeric(input$attHist), "Please enter a number..."))
	    validate( need(input$attHist != "", "Please enter a number..."))
	    input$attHist })

	lin1 <- reactive({ 
	    validate( need(!is.numeric(input$attHist), "Please enter a number..."))
	    validate( need(input$attHist != "", "Please enter a number..."))
	    input$attLin1 })

	lin2 <- reactive({ 
	    validate( need(!is.numeric(input$attHist), "Please enter a number..."))
	    validate( need(input$attHist != "", "Please enter a number..."))
	    input$attLin2 })


	# Display the summary of the dataset
        output$summary <- renderPrint({
	    dataset <- datasetInput()
	    summary(dataset)
	    })

	# Display the name of the features of the dataset
	output$features <- renderPrint({
	    dataset <- datasetInput()
	    names(dataset)
	    })

	# Display the number of observations
	output$samples <- renderPrint({
	    dataset <- datasetInput()
	    nrow(dataset)
	    })

	# Display the table of an attribute
        output$attTable <- renderPrint({
	    dataset <- datasetInput()
	    myatt <- att()
	    print(myatt)
	    table(dataset[as.integer(myatt)])
	    })

	# Display the histogram of an attribute
        output$attHist <- renderPlot({
	    dataset <- datasetInput()
	    myhist <- histo()
	    hist(as.numeric(dataset[,as.numeric(myhist)]))
	    })

	# Display a Linear Regression Plot
        output$attReg <- renderPlot({
	    dataset <- datasetInput()
	    mylin1 <- lin1()
	    mylin2 <- lin2()
	    plot(dataset[,as.numeric(mylin1)], dataset[,as.numeric(mylin2)])
	    })
    }
)
