# Article in Runnersworld 
# 2014-10-29 Speed Demons: Massachusetts Has the Fastest Runners in America, According to Running App Data
# http://bdcwire.com/speed-demons-massachusetts-has-the-fastest-runners-in-america-according-to-running-app-data/
# http://rw.runnersworld.com/clean/states.html
# http://www.runnersworld.com/general-interest/how-does-your-state-stack-up 

library(ggplot2)

#### Data ---------------------------------------------------------------------
# http://rw.runnersworld.com/clean/states.html -> in .xls, .csv
path <- getwd()
usrunner <- read.csv(paste0(path, "/usrunner.csv"))

#### Quick View on Data
View(usrunner)
qplot(State,Pace.per.Mile, data= usrunner)
qplot(Miles.per.Run, Pace.per.Mile, data= usrunner)
qplot(Runs.per.Person, Pace.per.Mile, data= usrunner)
qplot(Miles.per.Run, Runs.per.Person, data= usrunner)
