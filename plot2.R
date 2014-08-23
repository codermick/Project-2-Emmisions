#  Read Data 
NEI <- readRDS("summarySCC_PM25.rds")

#  Create Plot Data from Baltimore 
baltimore<- subset(NEI, fips == "24510")
plotD <- aggregate(baltimore[c("Emissions")], list(year = baltimore$year), sum)

#  Create Plot
png('plot2.png', width=480, height=480)
plot(plotD$year, plotD$Emissions, type = "l", 
     main = "Total Emissions from PM2.5 in Baltimore City",
     xlab = "Year", ylab = "Emissions")
dev.off()
