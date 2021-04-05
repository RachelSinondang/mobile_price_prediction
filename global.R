library(tidyverse)
library(caret)
library(randomForest)
library(e1071)
library(shiny)
library(shinydashboard)
library(plotly)
library(scales)
library(glue)
library(DT)

price <- read.csv("train.csv")

colSums(is.na(price))

price <- price %>%
  mutate(blue = as.factor(blue),
         dual_sim = as.factor(dual_sim),
         four_g = as.factor(four_g),
         touch_screen = as.factor(touch_screen),
         wifi = as.factor(wifi),
         price_range = as.factor(price_range))

price_forest <- readRDS("model_price_forest.RDS")
