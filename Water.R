library(data.table)
library(readr)
library(ggplot2)
data <- read_csv("water.csv")
data$廠名2 <- sapply(data$廠名, function(x) ifelse(x %in% c("大發", "永安", "林園", "台南科技", "臨海", "大甲幼獅", "屏南", "觀音", "新營"), x, "Others"))
data$導電度 <- data$導電度 * (1.02)^(25-data$水溫)
data$日期 <- as.Date(data$日期)
ggplot() +
  geom_point(data = data[data$廠名2 != "Others",], aes(x = 日期, y = 導電度, color = 廠名2)) +
  geom_point(data = data[data$廠名2 == "Others",], aes(x = 日期, y = 導電度, color = 廠名2), alpha = 0.1)
ggplot(data) +
  geom_histogram(aes(x = 導電度), fill = "deepskyblue", binwidth = 300) +
  geom_vline(xintercept = 750, linetype = "dashed", color = "red") +
  annotate("text", x = 1200, y = -20, label = "750", color = "red", size = 9)

?geom_histogram
