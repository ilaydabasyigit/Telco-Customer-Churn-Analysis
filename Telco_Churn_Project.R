install.packages("tidyverse")
# Load the tidyverse library for data analysis and visualization
library(tidyverse)

# Read the CSV file into a data frame named 'telco_data'
# The 'file.choose()' function will open a window for you to select the file.
telco_data <- read.csv(file.choose())

# Display the first 6 rows of the data frame to see its structure
head(telco_data)

# Get a summary of the data frame, including data types and statistics
str(telco_data)


# Display the first 6 rows of the data to get a sense of its structure
head(telco_data)

# Show a summary of the data, which includes data types and basic statistics
str(telco_data)


# Check the structure of the data again
str(telco_data)


# Use the file.choose() function to open a file selection window
telco_data <- read.csv2(file.choose())

# Check the structure of the data again
str(telco_data)


# Convert 'TotalCharges' column to numeric
# First, replace empty strings with NA
telco_data$TotalCharges <- replace(telco_data$TotalCharges, telco_data$TotalCharges == "", NA)

# Then, convert the column to numeric
telco_data$TotalCharges <- as.numeric(telco_data$TotalCharges)

# Convert 'MonthlyCharges' column to numeric as well
telco_data$MonthlyCharges <- as.numeric(telco_data$MonthlyCharges)

# Re-check the structure to confirm the changes
str(telco_data)


# Load the ggplot2 library for visualization
library(ggplot2)

# Create a bar chart showing the number of customers who churned
ggplot(data = telco_data, aes(x = Churn, fill = Churn)) +
  geom_bar() +
  labs(title = "Distribution of Customer Churn",
       subtitle = "Number of customers who stayed vs. left the company",
       x = "Churn Status",
       y = "Number of Customers") +
  theme_minimal()


# Run this code again:
ggplot(data = telco_data, aes(x = Contract, fill = Churn)) +
  geom_bar(position = "fill") +
  labs(title = "Churn Rate by Contract Type",
       x = "Contract Type",
       y = "Proportion of Customers") +
  theme_minimal()



# Create a density plot to compare churn by tenure
ggplot(data = telco_data, aes(x = tenure, fill = Churn, color = Churn)) +
  geom_density(alpha = 0.6) +
  labs(title = "Churn by Tenure",
       subtitle = "Density of customer tenure for churned vs. non-churned customers",
       x = "Tenure (Months)",
       y = "Density") +
  theme_minimal()


# Create a bar plot to analyze churn based on TechSupport service
ggplot(data = telco_data, aes(x = TechSupport, fill = Churn)) +
  geom_bar(position = "fill") +
  labs(title = "Churn Rate by Tech Support Status",
       x = "Tech Support",
       y = "Proportion of Customers") +
  theme_minimal()


# Create a box plot to compare monthly charges for churned vs. non-churned customers
ggplot(data = telco_data, aes(x = Churn, y = MonthlyCharges, fill = Churn)) +
  geom_boxplot() +
  labs(title = "Monthly Charges by Churn Status",
       subtitle = "Comparison of monthly charges for customers who stayed vs. left",
       x = "Churn Status",
       y = "Monthly Charges ($)") +
  theme_minimal()


# Create a bar plot to analyze churn based on Internet Service type
ggplot(data = telco_data, aes(x = InternetService, fill = Churn)) +
  geom_bar(position = "fill") +
  labs(title = "Churn Rate by Internet Service",
       x = "Internet Service Type",
       y = "Proportion of Customers") +
  theme_minimal()


# Create a scatter plot to visualize the relationship between MonthlyCharges and TotalCharges, colored by Churn status
ggplot(data = telco_data, aes(x = MonthlyCharges, y = TotalCharges, color = Churn)) +
  geom_point(alpha = 0.6) +
  labs(title = "Monthly Charges vs. Total Charges",
       subtitle = "Relationship between monthly and total charges by churn status",
       x = "Monthly Charges ($)",
       y = "Total Charges ($)") +
  theme_minimal()