require(markdown)
shinyUI(
  fluidPage(
    tabsetPanel(type = "tabs", 
                tabPanel("Application",
                         headerPanel('E-Learning Country Overview 2015'),
                         sidebarPanel(
                           uiOutput("countriesSelect")
                         ),
                         mainPanel(
                           plotOutput('plot1', height = "600px"),
                           p("Data Source: The Networked Readiness
                              Index Historical Dataset © 2012-2015
                             World Economic Forum")
                         )
                ), 
                tabPanel("Documentation",
                         includeMarkdown("documentation.md")
                         )
    )
  )
)