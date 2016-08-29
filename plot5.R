nei<-readRDS("d:/documents/r/data/summarySCC_PM25.rds")
scc<-readRDS("d:/documents/r/data/Source_Classification_Code.rds")
nei_scc<-merge(nei, scc, by = "scc")

library(ggplot2)

subsetNEI <- nei[nei$fips=="24510" & nei$type=="ON-ROAD",  ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)



png("plot5.png", width=840, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()