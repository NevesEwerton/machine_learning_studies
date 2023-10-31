


Overall accuracy can sometimes be a deceptive measure beacuse of unbalanced classes

A general improvement to using overall accuracy is to study sensitivy and specificity 
separately. These will be defined in the next video

A confusion matrix tabulates each combination of prediction and actual value. You can 
create a confusion matrix in R using the table() function or the confusionMatrix() 
function from the caret package. The confusionMatrix() function will be covered in more
detail in a later video.

If your training data is biased in some way, you are likely to develop algorithms that
are biased as well. The problem of biased training sets is so common that are there are
groups dedicated to study.

table(predicted = y_hat, actual = test_set$sex)
test_set %>% 
  mutate(y_hat = y_hat) %>%
  group_by(sex) %>% 
  summarize(accuracy = mean(y_hat == sex))
prev <- mean(y == "Male")

confusionMatrix(data = y_hat, reference = test_set$sex)
