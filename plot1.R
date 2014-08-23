#  Read Data 
NEI <- readRDS("summarySCC_PM25.rds")

#  Create Plot Data
plotD <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)

#  Create Plot
png('plot1.png', width=480, height=480)
plot(plotD$year,plotD$Emissions, type = "l", 
     main = "Total Emissions from PM2.5 in the US",
     xlab = "Year", ylab = "Emissions")
dev.off()
