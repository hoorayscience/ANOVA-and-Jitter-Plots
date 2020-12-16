# OPC - Plots for Stratum vs Anti-AR percent inhibition - Sediment
#Ellie Wenger 
#12/14/2020

#### Intro ####
#import teh data

#load packages 
library(readr)
library(ggplot2)
library(tidyverse)
library(gridExtra)
library(ggplot2)
library(dplyr)
library(tidyr)
library(forcats)
library(hrbrthemes)
library(viridis)

#load the data
Anti.AR.Data <- read_csv("Anti-AR.Strata.csv")
head(Anti.AR.Data)

Anti.AR.Data.No.Spike <- read_csv("Anti-AR.Strata.No.Spike.csv")
head(Anti.AR.Data)
#boxplot with jitter AhR

Anti.AR.Data %>%
  ggplot(aes(x=reorder(Stratum,inhibition,na.rm = TRUE), y=inhibition, fill=Stratum)) +
  geom_boxplot() +
  geom_hline(yintercept=0.12, linetype="dashed", color = "black") +
  geom_jitter(color="black", size=1.5, alpha=0.9, width = 0.1) +
  theme_classic() +
  theme(legend.position="none", plot.title = element_text(size=18)) +
  ylab("% inhibition relative to Cyp. ac.") +
  theme(axis.title.x=element_blank())+
  theme(axis.text=element_text(size=16))+
  theme(axis.title.y=element_text(size=16, vjust=5))+
  theme(plot.margin = unit(c(1,1,1,1), "cm"))

Anti.AR.Data.No.Spike %>%
  ggplot(aes(x=reorder(Stratum,inhibition,na.rm = TRUE), y=inhibition, fill=Stratum)) +
  geom_boxplot() +
  geom_jitter(color="black", size=1.5, alpha=0.9, width = 0.1) +
  theme_classic() +
  theme(legend.position="none", plot.title = element_text(size=18)) +
  ylim(0,40)+
  ylab("% inhibition relative to Cyproterone acetate") +
  theme(axis.title.x=element_blank())+
  theme(axis.text=element_text(size=16))+
  theme(axis.title.y=element_text(size=16, vjust=5))+
  theme(plot.margin = unit(c(1,1,1,1), "cm"))


