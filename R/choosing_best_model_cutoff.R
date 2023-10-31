library(tidyverse)
library(caret)
library(dslabs)
data(heights)


# define the outcome and predictors
y <- heights$sex

x <- heights$height

# generate training and test sets
set.seed(2007)
test_index <- createDataPartition(y, times = 1, p = 0.5, list = FALSE)
test_set <- heights[test_index, ]
train_set <- heights[-test_index, ]

# guess the outcome
y_hat <- sample(c("Male","Female"), length(test_index), replace = TRUE) %>%
  factor(levels = levels(test_set$sex))

# compute accuracy
mean(y_hat == test_set$sex)

# compare heights in males and females in our data set
heights %>% group_by(sex) %>% summarise(mean(height), sd(height))

# now try predicting "male" if the height is within 2 sd of the average male
y_hat <- ifelse(x > 62, "Male", "Female") %>% factor(levels = levels(test_set$sex))
mean(y == y_hat)

# examine the accuracy of 10 cutoffs
cutoff <- seq(61, 70)
accuracy <- map_dbl(cutoff, function(x){
  y_hat <- ifelse(train_set$height > x, "Male", "Female") %>% 
    factor(levels = levels(test_set$sex))
  mean(y_hat == train_set$sex)
})

data.frame(cutoff, accuracy) %>%
  ggplot(aes(cutoff, accuracy)) +
  geom_point() +
  geom_line() +
  theme_bw(base_size = 14) +

  labs(
    title = "Model Accuracy by Cutoff",
    subtitle = "As you can observe, the accuracy reaches its peak at a cutoff of 64. 
    Beyond this optimal cutoff level, accuracy starts to decline as the cutoff increases.",
    y= "Accuracy",
    x = "Cutoff"
  ) +
  theme(
    
    legend.position = "none",
    #plot.title = element_textbox_simple(face = "bold"),
   # plot.subtitle = element_textbox_simple(margin = margin(t = 10), lineheight = 1.5),
    plot.title.position = "plot",
    plot.margin = margin(15,10,10,15),
    #panel.grid = element_blank(),
    panel.grid.major = element_line(colour = "#FDD49E", linetype = "dashed"),
    # panel.border = element_rect(colour = "#FDD49E"),
    panel.background = element_rect(colour = "#FDD49E", fill = "#FFF7EC"),
    axis.text.x = element_blank(),
    # mudando a cor do fundo do gráfico
    plot.background = element_rect(fill =   "#FFF7EC"),
    
    # mudando a cor de fundo dos eixos
    strip.background = element_rect(fill =   "#FFF7EC")
  )
  
  
  
  
max(accuracy)

best_cutoff <- cutoff[which.max((accuracy))]
best_cutoff


y_hat <- ifelse(test_set$height > best_cutoff, "Male", "Female") %>% 
  factor(levels = levels(test_set$sex))
y_hat <- factor(y_hat)
mean(y_hat == test_set$sex)


##############################################################################

mnist <- read_mnist()

View(mnist_27)

ncol(mnist)


mnist <- read_mnist(download = TRUE)

# and then, going forward, read from disk 
mnist <- read_mnist("~/Downloads")


ncol(mnist)

ncol(mnist$train$labels)

mnist$test$labels
