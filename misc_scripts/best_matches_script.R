## Looking at 923 and 910 and comparing them for how they did with the various adjustments

latest <- read.csv("092315-Sweave/adjusted.csv", header=T)
library(disperseR)
commands <- readCSVs("091015-Sweave")
eval(parse(text=commands))


finalEvals <- data.frame(species=latest$species, datatype=c(rep("BA", 10), rep("DN", 10)), run="923", var="all", response=c(latest$ba90, latest$den90))



finalEvals <- rbind(finalEvals, data.frame(species=growth$species, 
                         datatype=c(rep("BA", 30), rep("DN", 30)), 
                         run="910-growth", 
                         var=rep(c(rep("90", 10), rep("100", 10), rep("110", 10)),2), 
                         response=c(growth$ba90, growth$ba100, growth$ba110, 
                                    growth$den90, growth$den100, growth$den110)))

finalEvals <- rbind(finalEvals, data.frame(species=dispersalbeta$species, 
                                           datatype=c(rep("BA", 30), rep("DN", 30)), 
                                           run="910-beta", 
                                           var=rep(c(rep("90", 10), rep("100", 10), rep("110", 10)),2), 
                                           response=c(dispersalbeta$ba90, dispersalbeta$ba100, dispersalbeta$ba110, 
                                                      dispersalbeta$den90, dispersalbeta$den100, dispersalbeta$den110)))

finalEvals <- rbind(finalEvals, data.frame(species=dispersald$species, 
                                           datatype=c(rep("BA", 30), rep("DN", 30)), 
                                           run="910-d", 
                                           var=rep(c(rep("90", 10), rep("100", 10), rep("110", 10)),2), 
                                           response=c(dispersald$ba90, dispersald$ba100, dispersald$ba110, 
                                                      dispersald$den90, dispersald$den100, dispersald$den110)))

finalEvals <- rbind(finalEvals, data.frame(species=dispersalstr$species, 
                                           datatype=c(rep("BA", 30), rep("DN", 30)), 
                                           run="910-str", 
                                           var=rep(c(rep("90", 10), rep("100", 10), rep("110", 10)),2), 
                                           response=c(dispersalstr$ba90, dispersalstr$ba100, dispersalstr$ba110, 
                                                      dispersalstr$den90, dispersalstr$den100, dispersalstr$den110)))
finalEvals <- rbind(finalEvals, data.frame(species=mortalityadult$species, 
                                           datatype=c(rep("BA", 30), rep("DN", 30)), 
                                           run="910-adultMort", 
                                           var=rep(c(rep("90", 10), rep("100", 10), rep("110", 10)),2), 
                                           response=c(mortalityadult$ba90, mortalityadult$ba100, mortalityadult$ba110, 
                                                      mortalityadult$den90, mortalityadult$den100, mortalityadult$den110)))
finalEvals <- rbind(finalEvals, data.frame(species=mortalityyoung$species, 
                                           datatype=c(rep("BA", 30), rep("DN", 30)), 
                                           run="910-youngMort", 
                                           var=rep(c(rep("90", 10), rep("100", 10), rep("110", 10)),2), 
                                           response=c(mortalityyoung$ba90, mortalityyoung$ba100, mortalityyoung$ba110, 
                                                      mortalityyoung$den90, mortalityyoung$den100, mortalityyoung$den110)))

finalEvals$distFrom1 <- abs(finalEvals$response - 1)

bestFit <- aggregate(finalEvals$distFrom1, by=list(finalEvals$species, finalEvals$datatype), FUN=min)
colnames(bestFit) <- c("species", "datatype", "bestmatch")
testmerge <- merge(finalEvals, bestFit, by=c("species", "datatype"))
bestMatches <- testmerge[testmerge$distFrom1==testmerge$bestmatch,]
indexsort <- order(bestMatches[,1])
write.csv(bestMatches[indexsort,1:4], file="best_matches.csv")
