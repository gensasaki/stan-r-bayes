library(readr)
library(ggplot2)

dat <- read_csv("data-salary.txt")

ggplot(data = dat, aes(x = X, y = Y)) +
  geom_point()

res_lm <- lm(Y ~ X, data = dat)

X_new <- data.frame(X = 23:60)

# 95% confidence interval
conf95 <- predict(res_lm, X_new, interval = "confidence", level = 0.95) # mu - 1.96 * S.E.
# 95% prediction interval
pred95 <- predict(res_lm, X_new, interval = "prediction", level = 0.95) # mu - 1.96 * S.D.
pred95_no_dat <- predict(res_lm, interval = "prediction", level = 0.95)

pre95_dat <- cbind(dat, pred95_no_dat)

ggplot(data = pre95_dat, aes(x = X, y = Y)) +
  geom_point() +
  geom_smooth(method = lm) + 
  geom_line(aes(y = lwr), color = "red", linetype = "dashed") +
  geom_line(aes(y = upr), color = "red", linetype = "dashed")
