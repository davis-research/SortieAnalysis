## This is a script to exapnd on the vaildation stuff and make graphs for my poster.
library(disperseR)
getwd()
setwd("112515-validation/outfiles/orig/means")
store <- readCSVs(".")
head(store)
eval(parse(text=store))
head(ccrpipoadultabsba)
str(ccrpipoadultabsba)
adultabsba <- rbind(ccrpipoadultabsba, crcrpipoadultabsba, emslopeadultabsba, suabcoadultabsba)
adultabsden <- rbind(ccrpipoadultabsden, crcrpipoadultabsden, emslopeadultabsden, suabcoadultabsden)
saplabsden <- rbind(ccrpiposaplabsden, crcrpiposaplabsden, emslopesaplabsden, suabcosaplabsden)
sdlabsden <- rbind(ccrpiposdlabsden, crcrpiposdlabsden, emslopesdlabsden, suabcosdlabsden)

adultabsba$Species <- as.factor(adultabsba$Species)
adultabsden$Species <- as.factor(adultabsden$Species)
saplabsden$Species <- as.factor(saplabsden$Species)
sdlabsden$Species <- as.factor(sdlabsden$Species)


## sort adultabsba
adultabsba <- adultabsba[order(adultabsba$Species),]
adultabsba <- adultabsba[adultabsba$simMean > 0,]
##box out years
yearsbox <- c(1,6, 11, 16, 32)
species <- unique(adultabsba$Species)

boxedYrSpp <- data.frame(years=c(rep("1-5", 8), rep("6-10", 8), 
                                 rep("11-15", 8), rep("16+", 8)), 
                          species=rep(species, 4), realBA=0, simBA=0)

boxedYrSpp <- boxedYrSpp[order(boxedYrSpp$species),]

## for each species
finalAbsBA <- c()
simAbsBA <- c()
for(i in 1:length(species)){
  
  for(j in 1:(length(yearsbox)-1)){
  rawr <- adultabsba[adultabsba$Species == species[i] &
                       adultabsba$Step >= yearsbox[j] & 
                       adultabsba$Step < yearsbox[j+1], ]
  finalAbsBA <- c(finalAbsBA, mean(rawr$AdultAbsBA, na.rm=T))
  simAbsBA <- c(simAbsBA, mean(rawr$simMean, na.rm=T))
  }
}
boxedYrSpp$realBA <- finalAbsBA
boxedYrSpp$simBA <- simAbsBA

savedBoxes <- boxedYrSpp

realcols <- c("#4c0017", "#552800", "#554000", "#555500", "#1A4000", "#003924", "#032436", "#0b083b")
simcols <- c("#721330", "#804715", "#806515", "#808015", "#336F12", "#0e563b", "#113B51", "#1d1959")


## do the plot

#png("notpine-adultba.png")

par(mar=c(5,5,4,2))
plot(as.numeric(boxedYrSpp$years), boxedYrSpp$realBA, 
     col=boxedYrSpp$species, type="n", xaxt="n", 
     ylab="Basal Area, m2", main="Firs, Cedar, and Oak", xlim=c(1, 4), ylim=c(0, 30), xlab="Years of Simulation", 
     cex.lab=2, cex.main=2)
axis(1, c(1:4), labels=as.character(unique(boxedYrSpp$years)), lwd=0)

lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="ABCO", "realBA"], type="o", col=realcols[1], pch=0, lty=1)
lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="ABCO", "simBA"], type="o", col=simcols[1], pch=0, lty=2)

lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="ABMA", "realBA"], type="o", col=realcols[2], pch=1, lty=1)
lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="ABMA", "simBA"], type="o", col=simcols[2], pch=1, lty=2)

lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="CADE", "realBA"], type="o", col=realcols[3], pch=2, lty=1)
lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="CADE", "simBA"], type="o", col=simcols[3], pch=2, lty=2)

lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="QUKE", "realBA"], type="o", col=realcols[8], pch=7, lty=1)
lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="QUKE", "simBA"], type="o", col=simcols[8], pch=7, lty=2)
#dev.off()



plot(as.numeric(boxedYrSpp$years), boxedYrSpp$realBA, 
     col=boxedYrSpp$species, type="n", xaxt="n", 
     ylab="Basal Area, m2", main="Pines", xlim=c(1,4), ylim=c(0,30),  xlab="Years of Simulation", 
     cex.lab=2, cex.main=2)
axis(1, c(1:4), labels=as.character(unique(boxedYrSpp$years)), lwd=0)

lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="PICO", "realBA"], type="o", col=realcols[4], pch=3, lty=1)
lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="PICO", "simBA"], type="o", col=simcols[4], pch=3, lty=2)

lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="PILA", "realBA"], type="o", col=realcols[5], pch=4, lty=1)
lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="PILA", "simBA"], type="o", col=simcols[5], pch=4, lty=2)

lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="PIMO", "realBA"], type="o", col=realcols[6], pch=5, lty=1)
lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="PIMO", "simBA"], type="o", col=simcols[6], pch=5, lty=2)

lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="PIPO", "realBA"], type="o", col=realcols[7], pch=6, lty=1)
lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="PIPO", "simBA"], type="o", col=simcols[7], pch=6, lty=2)


## adult abs den


## sort adultabsba
adultabsden <- adultabsden[order(adultabsden$Species),]
adultabsden <- adultabsden[adultabsden$simMean > 0,]

## for each species
finalAbsBA <- c()
simAbsBA <- c()
for(i in 1:length(species)){
  
  for(j in 1:(length(yearsbox)-1)){
    rawr <- adultabsden[adultabsden$Species == species[i] &
                          adultabsden$Step >= yearsbox[j] & 
                          adultabsden$Step < yearsbox[j+1], ]
    finalAbsBA <- c(finalAbsBA, mean(rawr$AdultAbsDen, na.rm=T))
    simAbsBA <- c(simAbsBA, mean(rawr$simMean, na.rm=T))
  }
}
boxedYrSpp$realDen <- finalAbsBA
boxedYrSpp$simDen <- simAbsBA


## do the plot
plot(as.numeric(boxedYrSpp$years), boxedYrSpp$simDen, 
     col=boxedYrSpp$species, type="n", xaxt="n", 
     ylab="Trees per hectare", main="Firs, Cedar, and Oak", xlim=c(1, 4), ylim=c(0, 1000), cex.lab=2, cex.main=2, xlab="Years of Simulation")

#lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="ABCO", "realDen"], type="o", col=realcols[1], pch=0, lty=1)
#lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="ABCO", "simDen"], type="o", col=simcols[1], pch=0, lty=2)

lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="ABMA", "realDen"], type="o", col=realcols[2], pch=1, lty=1)
lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="ABMA", "simDen"], type="o", col=simcols[2], pch=1, lty=2)

lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="CADE", "realDen"], type="o", col=realcols[3], pch=2, lty=1)
lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="CADE", "simDen"], type="o", col=simcols[3], pch=2, lty=2)

lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="QUKE", "realDen"], type="o", col=realcols[8], pch=7, lty=1)
lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="QUKE", "simDen"], type="o", col=simcols[8], pch=7, lty=2)


plot(as.numeric(boxedYrSpp$years), boxedYrSpp$simDen, 
     col=boxedYrSpp$species, type="n", xaxt="n", 
     ylab="Trees per hectare", main="Pines", xlim=c(1,4), ylim=c(0, 400), cex.lab=2, cex.main=2, xlab="Years of Simulation")

lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="PICO", "realDen"], type="o", col=realcols[4], pch=3, lty=1)
lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="PICO", "simDen"], type="o", col=simcols[4], pch=3, lty=2)

lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="PILA", "realDen"], type="o", col=realcols[5], pch=4, lty=1)
lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="PILA", "simDen"], type="o", col=simcols[5], pch=4, lty=2)

lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="PIMO", "realDen"], type="o", col=realcols[6], pch=5, lty=1)
lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="PIMO", "simDen"], type="o", col=simcols[6], pch=5, lty=2)

lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="PIPO", "realDen"], type="o", col=realcols[7], pch=6, lty=1)
lines(c(1:4), boxedYrSpp[boxedYrSpp$species=="PIPO", "simDen"], type="o", col=simcols[7], pch=6, lty=2)


