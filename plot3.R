#  Read Data 
NEI <- readRDS("summarySCC_PM25.rds")

#  Create Plot Data from Baltimore 
baltimore <- subset(NEI, fips == "24510") 
plotD <- aggregate(baltimore[c("Emissions")], list(type = baltimore$type, year = baltimore$year), sum)

#  Create Plot
png('plot3.png', width=480, height=480)
p <- ggplot(plotD, aes(x=year, y=Emissions, colour=type)) +
  geom_point(alpha=.3) +
  geom_smooth(alpha=.2, size=1, method="loess") +
  ggtitle("Total Emissions by Type in Baltimore City")
print(p)
dev.off()
