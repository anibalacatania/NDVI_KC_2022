library(readr)
library(readxl)
library(tidyverse)
library(lubridate)
library(tsibble)
library(ggpmisc)




########   plot ######



data <-  read_excel("datosok 20220611.xlsx")

  p <- ggplot(data = data, aes(x = DD, y = kc)) +
 geom_smooth(aes(group=Temporada, color=Temporada, fill=Temporada),
             formula=y ~ poly(x, 2),
             method="lm",se=T) + 
    stat_poly_eq(formula = y ~ poly(x, 2), 
                 label.y = "bottom", label.x = "right",
                 aes(label = paste(..eq.label..,
                                   ..rr.label.., 
                                   ..p.value.label..,
                                   
                                   sep = "~~~")), 
                 parse = TRUE, size=2) +    
    
  geom_point(aes(color=Temporada)) +

  
  theme(legend.title=element_blank())+
facet_wrap(~Temporada)
p
