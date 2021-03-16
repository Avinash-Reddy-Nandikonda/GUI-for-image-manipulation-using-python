# reading the url

url <- "https://github.com/SavioSal/datasets/raw/master/Bank%20Churn_Modelling.csv"
churn <- read.csv(url)

summary(churn)
View(churn)

#libraries to plot the graphs

library(ggplot2)
library(scales)
library(ggthemes)


churn$Exited <-  as.character(churn$Exited)
churn_customers <- ggplot(churn, aes(Exited, fill = Exited)) +
  geom_bar() +
  theme(legend.position = 'none')

churn_customers

table(churn$Exited)
round(prop.table(table(churn$Exited)),3)

#libraries to plot and manipulate the dataframe
library(tidyr)
library(dplyr)
library(ggthemes)
library(tidyverse)
churn %>% dplyr::select(-RowNumber, -CustomerId, -Surname,-Exited,-IsActiveMember,-HasCrCard,-NumOfProducts,-Tenure) %>% #remove unwanted column 
  keep(is.numeric) %>%
  gather() %>%
  ggplot() +
  geom_histogram(mapping = aes(x=value,fill=key), color="black") +
  facet_wrap(~ key, scales = "free") +
  theme_minimal() +
  theme(legend.position = 'none')

#balance 
balance_box <- ggplot(churn, aes(x = Exited, y = Balance, fill = Exited)) +
  geom_boxplot() + 
  theme_minimal() +
  theme(legend.position = 'none')

balance_box


#libraries to plot correlation matrix
library(corrplot)
library(ggcorrplot)
library(corrr)
library(dplyr)

corre <- churn %>% select(Age,Balance,CreditScore,EstimatedSalary)
numericVarName <- names(which(sapply(corre, is.numeric)))
corr <- cor(corre[,numericVarName], use = 'pairwise.complete.obs')
ggcorrplot(corr, lab = TRUE)


#Libraries to plot mosaic plot
library(tidyr)
library(tidyverse)
library(ggmosaic)

gender_mossaic <- churn %>%
  dplyr::select(Gender, Exited) %>% 
  table(.) %>% 
  as.data.frame() %>% 
  ggplot(.) +
  ggmosaic::geom_mosaic(aes(weight = Freq, x = product(Gender), fill = Exited)) +
  ggthemes::theme_tufte() +
  scale_fill_brewer(type = "qual") +
  labs(x = 'Gender')

gender_mossaic

#Average credit score of females and males in France

gender_avg_credit <- churn %>% select(CreditScore, Gender, Geography) %>% filter(Geography == "France") %>%
  dplyr::group_by(Gender) %>%
  dplyr::summarise(Gender_Average = mean(CreditScore))

gender_avg_credit

#credit score of people in the age brackets 20-30,31-40,41-50

age_brackets <- churn %>% select(CreditScore, Age) %>% mutate(agegroup = case_when(Age >= 41  & Age <= 50 ~ '3', Age >= 31  & Age <= 40 ~ '2', Age >= 20  & Age <= 30 ~ '1')) %>%
  filter(agegroup == "1" | agegroup == '2' | agegroup == '3') %>%
  dplyr::group_by(agegroup) %>%
  dplyr::summarise(Age_Average = mean(CreditScore))

age_brackets

#correlation between credit score and estimated salary
correlation <- churn %>% select(CreditScore, EstimatedSalary) %>% cor()

correlation


# Create the relationship model.
relationship_model <- lm(CreditScore ~Gender+Age+EstimatedSalary, data = churn)

# Show the model.
print(relationship_model)
summary(relationship_model)
