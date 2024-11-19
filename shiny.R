library(shiny)
library(bs4Dash)
library(latex2exp)
library(ggplot2)
library(dplyr)

source('Edgeworth.R')
source('ui.R')
source('server.R')

shinyApp(ui, server)
