library("forecast")
library("TTR")
library("xlsx")

par(mfrow=c(1,1))

iphones_till_2015 = iphones[0:34,]
q1 <- iphones_till_2015[which(iphones_till_2015$Quarter == "Q1"),]
q2 <- iphones_till_2015[which(iphones_till_2015$Quarter == "Q2"),]
q3 <- iphones_till_2015[which(iphones_till_2015$Quarter == "Q3"),]
q4 <- iphones_till_2015[which(iphones_till_2015$Quarter == "Q4"),]


q1_ts <- ts(q1$`Units sold (in millions)`)
ma_q1 <- SMA(q1_ts, 2)
ma_q1 <- append(ma_q1, NA, after = 0)

data = iphones_till_2015$`Units sold (in millions)`
iphones_ts_till_2015 = ts(data, start = c(2007, 3), end = c(2015, 4), frequency = 4)
plot(iphones_ts_till_2015)

iphones_ts_till_2015 <- append(iphones_ts_till_2015, NA, after = length(data))
ma_first <- SMA(na.omit(iphones_ts_till_2015), 2)
ma_first <- append(ma_first, NA, after = 0)


iphones$`Moving Average` = ma_4

write.xlsx(iphones, "C:/Users/ksjag/Documents/NUS/Sem 2/BT2102/Labs/Lab 5/modified.xlsx")
