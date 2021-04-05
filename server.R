#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$prediction <- renderValueBox({

        battery_power <- input$batery
        blue <- input$blue
        clock_speed <- input$clock
        dual_sim <- input$sim
        fc <- input$fc
        four_g <- input$forg
        int_memory <- input$int
        m_dep <- input$dep
        mobile_wt <- input$weight
        n_cores <- input$core
        pc <- input$pcam
        px_height <- input$px_h
        px_width <- input$px_w
        ram <- input$ram
        sc_h <- input$sch
        sc_w <- input$scw
        talk_time <- input$talk
        three_g <- input$trig
        touch_screen <- input$touch
        wifi <- input$wifi
        
        price_test <- data.frame(battery_power,blue,clock_speed,dual_sim,fc,four_g,int_memory,m_dep,mobile_wt,n_cores,pc,px_height,px_width,ram,sc_h,sc_w,talk_time,three_g,touch_screen,wifi)

        price_forest <- readRDS("model_price_forest.RDS")
        
        forest_class <- predict(price_forest, price_test, type = "raw")
        
        valueBox(value = forest_class,
                 subtitle = "Prediction",
                 color = "purple",
                 icon = icon("money-bill-alt"))
        
    })

})
