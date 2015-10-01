
# sum every x cases and time

aggcases <- as.numeric(tapply(data$cases, (seq_along(data$cases)-1) %/% x, sum))
aggtime <- data$time[seq(1, length(data$time), IP)]


