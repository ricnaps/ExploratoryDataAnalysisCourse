nei<-readRDS("d:/documents/r/data/summarySCC_PM25.rds")
scc<-readRDS("d:/documents/r/data/Source_Classification_Code.rds")
require(dplyr)

subsetNEI  <- nei[nei$fips=="24510", ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png('plot2.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()