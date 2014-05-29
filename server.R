
data = read.csv("foodData.csv")

shinyServer(function(input, output,session) {
  
  
  dataInput = reactive({
    
    data[which(   
      data$Calories   >= min(input$calories_input) 
      & data$Calories <= max(input$calories_input) 
      & data$Protein  >= min(input$protein_input) 
      & data$Protein  <= max(input$protein_input) 
      & data$Carbs    >= min(input$carb_input) 
      & data$Carbs    <= max(input$carb_input)
      & data$Fat      >= min(input$fat_input) 
      & data$Fat      <= max(input$fat_input) 
      & data$Fiber    >= min(input$fiber_input) 
      & data$Fiber    <= max(input$fiber_input) 
    ), ]  
    
    
    
    
  }) # End dataInput
  
  getDrop = reactive({
    
    rest = dataInput()$Restaurant
    
    
 
    
    
  #  if( length( which(  rest %in%  input$foodName)    == T) > 0)   {
      
      f.out = c(input$foodName, "All", sort(as.character(rest)))
      
   # } else{
      
      
  #    f.out = c("All", as.character(rest))
 #   }
    
    
  }) #end  getDrop
  
  
  
  output$selectUI <- renderUI({ 
    
    out.food = unique(getDrop())
    
    selectInput("foodName", "Select Restaurant", out.food) 
    
    
  })
  
  
  

  
  
  output$mytable6 = renderDataTable({ 
    

    
 
    if(nrow(  dataInput() ) ==0){
      
    out =   data.frame(t(rep("", ncol(data))))
    names(out) = names(data)
    out[,1] = "Please Change Your Criteria..."
    out  
      
    } else{
      
      if(length(input$foodName) == 0) {
        dataInput() 
      
      } else{ 
      
      if(input$foodName=="All"){
        
        dataInput()
      } else{
      
  #  dataInput()[which(dataInput()==input$foodName),]
    
    
    if(nrow(    dataInput()[which(dataInput()==input$foodName),] )==0) {
      
      out =   data.frame(t(rep("", ncol(data))))
      names(out) = names(data)
      out[,1] = "Please Change Your Criteria..."
      out  
      
      
    } else{
      
      
      dataInput()[which(dataInput()==input$foodName),]
    }
    
    
      } #end else 2
    
    } #else lenght statment
  
  
    } # end else 1
    
  }, options = list(aLengthMenu = c(5, 20, 30), iDisplayLength = 10))  #End output

  
  
}) # end shinyServer