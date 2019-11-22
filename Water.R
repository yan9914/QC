library(data.table)
library(readr)
library(ggplot2)
data <- read_csv("water.csv")
data$�t�W2 <- sapply(data$�t�W, function(x) ifelse(x %in% c("�j�o", "�æw", "�L��", "�x�n���", "�{��", "�j�ҥ���", "�̫n", "�[��", "�s��"), x, "Others"))
data$�ɹq�� <- data$�ɹq�� * (1.02)^(25-data$����)
data$��� <- as.Date(data$���)
ggplot() +
  geom_point(data = data[data$�t�W2 != "Others",], aes(x = ���, y = �ɹq��, color = �t�W2)) +
  geom_point(data = data[data$�t�W2 == "Others",], aes(x = ���, y = �ɹq��, color = �t�W2), alpha = 0.1)
ggplot(data) +
  geom_histogram(aes(x = �ɹq��), fill = "deepskyblue", binwidth = 300) +
  geom_vline(xintercept = 750, linetype = "dashed", color = "red") +
  annotate("text", x = 1200, y = -20, label = "750", color = "red", size = 9)

?geom_histogram