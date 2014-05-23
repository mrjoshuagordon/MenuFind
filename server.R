
data = read.csv("fooddata.csv")

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
    
    
    
    
  })
  
  
  
#   
#   
#   dataInput1 = reactive({
#     
#     if(length(input$calories_inSlider) == 0){
#       
#       
#       data
#       
#     } else{
#     
#     
#     data[which(   
#       data$Calories   >= min(input$calories_inSlider)
#       & data$Calories <= max(input$calories_inSlider)
#       & data$Protein  >= min(input$protein_inSlider) 
#       & data$Protein  <= max(input$protein_inSlider) 
# 
#     ), ]  
#     
#     }
#     
#     
#   })
#   
  
    
  
  
#   output$mytable5 = renderDataTable({ 
#     
# 
#   #  data.frame(c(1,2,3))
# 
#     dataInput()
#     
#     
# 
#     
#   }, options = list(aLengthMenu = c(5, 20, 30), iDisplayLength = 10))
  
  
  output$mytable6 = renderDataTable({ 
    
    
    #  data.frame(c(1,2,3))
    
#data.frame(min(input$calories_inSlider), max(input$calories_inSlider))
    
 
    if(nrow(  dataInput() ) ==0){
      
    out =   data.frame(t(rep("", ncol(data))))
    names(out) = names(data)
    out[,1] = "Please Change Your Criteria..."
    out  
      
    } else{
    dataInput()
    
    }
    
  }, options = list(aLengthMenu = c(5, 20, 30), iDisplayLength = 10))
  
#   
#   
#   
#   
#   output$slider_calories <- renderUI({
#     
#   if(length(min(dataInput1()$Calories)>0)){  
#   
#     
#     sliderInput("calories_inSlider", "Slider", min=min(dataInput1()$Calories) , max=max(dataInput1()$Calories), 
#                 value=c(min(data$Calories),max(data$Calories))
#                 
#     )
#     
#     
#   } else{
#     
#     
#     sliderInput("calories_inSlider", "Slider", min=min(data$Calories) , max=max(data$Calories), 
#                 value=c(min(data$Calories),max(data$Calories))
#                 
#     ) 
#   }
#   
#   
#   
#   
#   
#   }) 
#   
#   
#   
#   output$slider_protein <- renderUI({
#     
#     
#     sliderInput("protein_inSlider", "Slider", min=min(dataInput1()$Protein) , max=max(dataInput1()$Protein), 
#                 value=c(min(dataInput1()$Protein),max(dataInput1()$Protein)))
#   }) 
#   
#   
#   
  
  
  
}) 