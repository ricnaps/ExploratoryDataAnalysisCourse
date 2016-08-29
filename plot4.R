nei<-readRDS("d:/documents/r/data/summarySCC_PM25.rds")
scc<-readRDS("d:/documents/r/data/Source_Classification_Code.rds")
nei_scc<-merge(nei, scc, by = "scc")

library(ggplot2)

coalMatches  <- grepl("coal", nei_scc$Short.Name, ignore.case=TRUE)
subsetNEISCC <- nei_scc[coalMatches, ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)

png("plot4.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()