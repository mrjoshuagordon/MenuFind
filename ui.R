
shinyUI(navbarPage("Find me a Restaurant!",
                   tabPanel("Menu Item Finder",
                            
                            sidebarLayout(
                              
                              sidebarPanel(
                                
                                
                                tags$head(
                                  tags$style(type="text/css", "label.radio { display: inline-block; }", ".radio input[type=\"radio\"] { float: none; }"),
                                  tags$style(type="text/css", "select { max-width: 200px; }"),
                                  tags$style(type="text/css", "textarea { max-width: 185px; }"),
                                  tags$style(type="text/css", ".jslider { max-width: 200px; }"),
                                  tags$style(type='text/css', ".well { padding: 12px; margin-bottom: 5px; max-width: 280px; }"),
                                  tags$style(type='text/css', ".span4 { max-width: 200px; }")
                                ), 
                                
                                
                                
                                
                                uiOutput("slider_calories"),
                                uiOutput("slider_protein"),
                                
                                
                                sliderInput(inputId = "calories_input", 
                                            label = "Calories (kcal)", 
                                            min=0, max=4850, value=c(0,4850) ) ,
                                # X Value Input
                                sliderInput(inputId = "protein_input", 
                                            label = "Protein (g)", 
                                            min=0, max=179, value=c(0,179) ) ,
                                
                                # Y Value Input
                                sliderInput(inputId = "carb_input", 
                                            label = "Carb (g)", 
                                            min=0, max=414, value=c(0,414)),
                                
                                
                                sliderInput(inputId = "fat_input", 
                                            label = "Fat (g)", 
                                            min=0, max=277, value=c(0,277)),
                                
                                sliderInput(inputId = "fiber_input", 
                                            label = "Fiber (g)", 
                                            min=0, max=38, value=c(0,38))
                                
                                
                              ),
                              mainPanel( 
                                
                                tabsetPanel(
                                #dataTableOutput("mytable5"),
                                  div(tabPanel("Table", dataTableOutput("mytable6")), style = 'width:800px;')
                                  #dataTableOutput("mytable6")
                                )
                                
                              ) 
                            )
                   ),
                   
                   tabPanel("About",
                            fluidRow(
                              column(6,
                                     textOutput("text3"),
                                     column(6,
                                            tags$small(
                                              "I built this web app to improve upon menustat.org.  Please send bugs and enhancement requests to ",
                                              
                                              a(href="mailto:galaxy.josh@gmail.com",
                                                "galaxy.josh@gmail.com")
                                            )
                                     ),
                                     
                                     column(6,
                                            img(class="img-polaroid",
                                                src=paste0("https://googledrive.com/host/0BzKoMvuVz4xURU8xbk5YT3A2WUE/me.jpg")),
                                            tags$small(
                                              "Source: Photographed in Santa Monica, CA",
                                              a(href="http://www.everytrail.com/guide/los-liones-trail-to-parker-mesa",
                                                "Los Liones Trail")
                                            )
                                     )
                                     
                                     #                                    
                                     
                              )
                            )
                   )
))