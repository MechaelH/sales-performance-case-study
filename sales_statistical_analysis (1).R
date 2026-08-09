sales <- read.csv("sales_rows.csv")
str(sales)

summary(sales$Sales)

region_model <- aov(Sales ~ Region, data = sales)
summary(region_model)

category_model <- aov(Sales ~ Category, data = sales)
summary(category_model)

segment_model <- aov(Sales ~ Segment, data = sales)
summary(segment_model)

combined_model <- lm(Sales ~ Region + Category + Segment, data = sales)
summary(combined_model)