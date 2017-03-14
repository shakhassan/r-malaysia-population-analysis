groupM <- c(19483.60, 6648.00, 1992.00, 3255.60)
labels <- c("Bumiputra", "Chinese", "Indians", "Others", "Non Msia Citizen")

pie(groupM, labels, main = "Malaysia Population 2016", col = rainbow(length(groupM)))


#with legend and percentage

piepercent<- round(100*groupM/sum(groupM), 2)

pie(groupM, labels = piepercent, main = "Malaysia Population 2016",col = rainbow(length(groupM)))
legend("topright", c("Bumiputra", "Chinese", "Indians", "Others", "Non Msia Citizen"), cex = 0.8,
       fill = rainbow(length(groupM)))

