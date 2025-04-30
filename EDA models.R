
## Correlation Analysis of Student Performance ##

# Load necessary libraries
install.packages("Hmisc")  # Install Hmisc for correlation matrix
library(Hmisc)

# Load the dataset
url <- "https://stat4ds.rwth-aachen.de/data/Students.dat"
student_data <- read.table(url, header = TRUE)
head(student_data)
sum(is.na(student_data)) # Checking for missing values

# Compute the correlation matrix using the cor() function
cor_matrix <- cor(student_data, use = "complete.obs", method = "pearson")
print(cor_matrix)

# Visualize the correlation matrix
install.packages("corrplot")  # Install the corrplot package
library(corrplot)
corrplot(cor_matrix, method = "circle", type = "upper", tl.col = "black", tl.srt = 45)

## Frequency Distribution Analysis ##

# Create the dataset
satisfaction_data <- data.frame(
  ResponseID = 1:25,
  Age = c(28, 35, 42, 25, 50, 33, 45, 29, 38, 55, 
          26, 41, 47, 32, 36, 52, 30, 44, 49, 37, 
          40, 54, 31, 46, 53),
  Gender = c("Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male",
             "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male",
             "Female", "Male", "Female", "Male", "Female"),
  Income_Level = c("Low", "Medium", "High", "Low", "High", "Medium", "High", "Low", "Medium", "High",
                   "Low", "Medium", "High", "Low", "Medium", "High", "Low", "Medium", "High", "Low",
                   "Medium", "High", "Low", "Medium", "High"),
  Satisfaction_Level = c("Satisfied", "Very Satisfied", "Neutral", "Unsatisfied", "Very Satisfied",
                         "Satisfied", "Satisfied", "Unsatisfied", "Neutral", "Very Satisfied",
                         "Unsatisfied", "Satisfied", "Very Satisfied", "Neutral", "Satisfied",
                         "Very Satisfied", "Unsatisfied", "Neutral", "Satisfied", "Very Unsatisfied",
                         "Satisfied", "Very Satisfied", "Neutral", "Satisfied", "Very Satisfied")
)

# Frequency Distribution Analysis

# 2.1 Absolute Frequency
freq_abs <- table(satisfaction_data$Satisfaction_Level)
print("Absolute Frequency:")
print(freq_abs)

# 2.2 Relative Frequency (Percentage)
freq_rel <- prop.table(freq_abs) * 100
print("\nRelative Frequency (%):")
print(freq_rel)

# 2.3 Detailed Frequency Table
freq_table <- data.frame(
  Satisfaction_Level = names(freq_abs),
  Absolute_Frequency = as.vector(freq_abs),
  Relative_Frequency_Percent = as.vector(freq_rel)
)
print("\nDetailed Frequency Table:")
print(freq_table)

# Visualization
library(ggplot2)

# Convert to data frame
df <- as.data.frame(freq_abs)
colnames(df) <- c("Satisfaction", "Count")

# Plot with ggplot2
ggplot(df, aes(x = Satisfaction, y = Count, fill = Satisfaction)) +
  geom_bar(stat = "identity") +
  ggtitle("Distribution of Customer Satisfaction Levels") +
  xlab("Satisfaction Level") +
  ylab("Frequency") +
  theme_minimal()
ggsave("satisfaction_barplot.png", width = 8, height = 6)

# Statistical Summary
summary_satisfaction <- summary(satisfaction_data$Satisfaction_Level)
print("\nSatisfaction Level Summary:")
print(summary_satisfaction)

# Additional Analysis: Cross-tabulation with Income Level
income_satisfaction_crosstab <- table(
  satisfaction_data$Income_Level, 
  satisfaction_data$Satisfaction_Level
)
print("\nCross-tabulation of Income Level and Satisfaction:")
print(income_satisfaction_crosstab)

## Chi- Square Test ##

# Perform the chi-square test for independence
chi_square_test <- chisq.test(income_satisfaction_crosstab)
print("Chi-square Test Results:")
print(chi_square_test)

# Check the p-value
chi_square_test$p.value

# Since expected counts in some cells are too low, using fisher's exact test

fisher_test <- fisher.test(income_satisfaction_crosstab)
print(fisher_test)

## Multiple Regression Model ##

# Load necessary libraries
library(ggplot2)

# Create a synthetic dataset
set.seed(42)  # For reproducibility

# Sample dataset with 100 rows
sales_data <- data.frame(
  Sales = rnorm(100, mean = 200, sd = 50),  # Sales as a random variable (mean=200, sd=50)
  Advertising = rnorm(100, mean = 30, sd = 10),  # Advertising spend
  Price = rnorm(100, mean = 20, sd = 5),  # Product price
  Competition_Price = rnorm(100, mean = 19, sd = 4)  # Competitor's price
)
head(sales_data)

# Fit a multiple regression model
# Sales as the dependent variable, and Advertising, Price, and Competition_Price as independent variables
model <- lm(Sales ~ Advertising + Price + Competition_Price, data = sales_data)
summary(model)

# Plot the residuals to check model assumptions
plot(model$residuals, main = "Residuals of the Regression Model")

# Make predictions (for new data points)
new_data <- data.frame(Advertising = c(40, 50), Price = c(22, 25), Competition_Price = c(20, 23))
predictions <- predict(model, newdata = new_data)
print(predictions)

