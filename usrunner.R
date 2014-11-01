# Article in Runnersworld 
# 2014-10-29 Speed Demons: Massachusetts Has the Fastest Runners in America, According to Running App Data
# http://bdcwire.com/speed-demons-massachusetts-has-the-fastest-runners-in-america-according-to-running-app-data/
# http://rw.runnersworld.com/clean/states.html
# http://www.runnersworld.com/general-interest/how-does-your-state-stack-up 

library(ggplot2)
library(ggmap)
library(maps)


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

#### map
all_states <- map_data("state")

#### merge
usrunner$State <- tolower(usrunner$State)
Total <- merge(all_states, usrunner, by.x = "region", by.y= "State")
head(Total)

#### overall rank
p1 <- ggplot()
p1 <- p1 + geom_polygon(data=Total, aes(x=long, y=lat, group = group, fill=Total$Overall.Rank), colour="white") 
       + scale_fill_continuous(low = "thistle2", high = "darkred", guide="colorbar")

P1 <- p1 + theme_bw()  + labs(fill = "Overall Rank", 
                              title = "Runners World Ranking for all 50 States", x="", y="")
P1 + scale_y_continuous(breaks=c()) + scale_x_continuous(breaks=c()) + theme(panel.border =  element_blank())

#### miles per run
p2 <- ggplot()
p2 <- p2 + geom_polygon(data=Total, aes(x=long, y=lat, group = group, fill=Total$Miles.per.Run), colour="white") 
+ scale_fill_continuous(low = "thistle2", high = "darkred", guide="colorbar")

P2 <- p2 + theme_bw()  + labs(fill = "Miles per Run", 
                              title = "Runners World Ranking for all 50 States", x="", y="")
P2 + scale_y_continuous(breaks=c()) + scale_x_continuous(breaks=c()) + theme(panel.border =  element_blank())

#### pace per mile
p3 <- ggplot()
p3 <- p3 + geom_polygon(data=Total, aes(x=long, y=lat, group = group, fill=Total$Pace.per.Mile), colour="white") 
+ scale_fill_continuous(low = "thistle2", high = "darkred", guide="colorbar")

P3 <- p3 + theme_bw()  + labs(fill = "Pace per Mile", 
                              title = "Runners World Ranking for all 50 States", x="", y="")
P3 + scale_y_continuous(breaks=c()) + scale_x_continuous(breaks=c()) + theme(panel.border =  element_blank())
