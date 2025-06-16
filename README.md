#  Student Performance & Satisfaction Analysis
This project provides a comprehensive statistical analysis pipeline involving multiple datasets and techniques, including;
1. Correlation Analysis of Student Performance
2. Frequency Distribution Analysis of Customer Satisfaction
3. Chi-square Test for Independence
4. Multiple Linear Regression on Synthetic Sales Data

## Correlation Analysis of Student Performance
- **Objective** : Examine the relationships between numerical variables in a student performance dataset.
- **Dataset** : ```https://stat4ds.rwth-aachen.de/data/Students.dat```
- **Techniques Used** :
Pearson correlation matrix computed using cor()
Visualization using corrplot
- **Libraries** : ```Hmisc```, ```corrplot```

## Frequency Distribution Analysis
- **Objective:** Analyze the frequency of satisfaction levels from survey data.
- **Dataset**: Custom-created data with 25 responses including Age, Gender, Income Level, and Satisfaction Level.
- **Analysis Includes**: Absolute frequency count, Relative frequency percentages, Bar chart visualization using ggplot2
- **Output**: A saved plot (customer satisfaction barplot.png) showing satisfaction distribution, Detailed frequency table, Summary statistics of satisfaction levels

## Chi Square Test for Independence
- **Objective** : Determine whether satisfaction level is independent of income level.
- **Approach** : Cross-tabulation between Income Level and Satisfaction Level, Chi-square test for independence using chisq.test(), Fisher’s Exact Test for small expected counts
- **Output** :Test statistics, P-values indicating statistical significance

## Multiple Linear Regression Model
- **Objective**: Predict sales based on advertising spend, product price, and competitor price.
- **Dataset**: Synthetic dataset of 100 observations created with rnorm()
- **Model**: Linear regression using lm()
- **Diagnostics**: Model summary statistics (R², coefficients, p-values), Residual plot for model assumption checks
- **Prediction**: Sales predictions for new input values

## Dependencies
Install the following R packages before running the script:
```
install.packages("Hmisc")
install.packages("corrplot")
install.packages("ggplot2")
```

## License
This project is licensed under the MIT License.
