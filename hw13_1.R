library(shiny)
library(ggplot2)

ui <- fluidPage(
    titlePanel("Homewor # 13_1"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("level",
                        "Level of Confidence Interval:",
                        min = 0.8,
                        max = 0.99,
                        value = 0.95,step=0.01),
            radioButtons("methods", "Smoothing method",
                         c("lm" = "lm",
                           "gam" = "gam",
                           "loess" = "loess",
                           "glm"="glm"))
        ),
        mainPanel(
            plotOutput("")
        )
    )
)

server <- function(input, output) {
    output$distPlot <- renderPlot({
        ggplot(data=mtcars,aes(x=wt,y=mpg))+
            geom_point()+
            stat_smooth(method ="lm" ,level=0.95)
    })
}

shinyApp(ui = ui, server = server)
