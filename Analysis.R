library(readxl)
data <- read_excel("HollywoodRules_Data.xls", sheet = "Exhibit 1")
View(data)
colnames(data)
# 7.
# a.
model = lm(data$`Total U.S. Gross` ~ data$`Opening Gross`, data = data)
summary(model)


library(ggplot2)
library(car)

# 1. Exploratory Data Analysis
# Scatter plot
ggplot(data, aes(x=`Opening Gross`, y=`Total U.S. Gross`)) + geom_point() + geom_smooth(method='lm')

# 2. Modeling
model <- lm(`Total U.S. Gross` ~ `Opening Gross`, data=data)

# 3. Check Assumptions
# Check residuals vs fitted values (for linearity and homoscedasticity)
plot(model, which=1)

# Check for normality of residuals
plot(model, which=2)

# Check for influential outliers
plot(model, which=5)

# Check multicollinearity (if there are multiple independent variables)
# car::vif(model)

# 4. Refinement (Example: log transformation if the relationship appears exponential)
model2 <- lm(log(`Total U.S. Gross`) ~ `Opening Gross`, data=data)
summary(model2)
plot(model2, which=1)
plot(model2, which=2)
plot(model2, which=3)
