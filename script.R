library(readr)
library(tidyverse)
library(lubridate)
library(tsibble)

data <- read_delim("Estado de cultivo1.csv", 
                 delim = ";", escape_double = FALSE, trim_ws = TRUE) 

data$Fecha<- as_date(dmy(data$Fecha),tz = NULL, format = NULL)

data<-data %>% 
  mutate(DayMonth = format(as_date(Fecha), "%d-%m")) 

#### hasta aca works #####


data %>% as.Date(paste0(as.character(day(Date)), '-',as.character(month(Date))), format='%d-%m')

data$DayMonth <- format(as.Date(data$DayMonth), "%d-%m")


data<-data %>%
  mutate(DayMonth = format(as.Date(Fecha), "%d-%m"))

data$date <- as.Date(data$Fecha, format = '%m/%d')
str(data)
data<-mutate(data, b2= as.Date(Fecha,  format = '%m/%d'))
str(data)


########   plot ######


p <- ggplot(data = data, aes(x = DD, y = kc)) +
 geom_smooth(aes(group=Temporada, color=Temporada, fill=Temporada),method="loess",se=T) +
    
  geom_point(aes(color=Temporada)) +
 
  
  theme(legend.title=element_blank())+
facet_wrap(~Temporada)
p
