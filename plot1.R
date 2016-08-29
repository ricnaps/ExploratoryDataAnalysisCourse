nei<-readRDS("d:/documents/r/data/summarySCC_PM25.rds")
scc<-readRDS("d:/documents/r/data/Source_Classification_Code.rds")
require(dplyr)

aggregatedTotalByYear <- aggregate(Emissions ~ year, nei, sum)

png('plot1.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()