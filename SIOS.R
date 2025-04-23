
#           SOCIAL INFLUENCE ON SHOPPING (DATASET). 



library(dplyr)
library(readr)
library(ggplot2)
library(IRdisplay)



setwd("C:/Users/Home/Documents/R")

shopping=read.csv("shopping.csv",header=TRUE,sep=',')

View(shopping)
dim(shopping)  #  Dimension of the Dataset

str(shopping)   # Structure of the Dataset

summary(shopping) # Summary of the Dataset
summary(shopping,na.rm=TRUE)  

names(shopping) # Column Names of the Data set, TOP 4 Rows and Bottom 5 Rows.
head(shopping, n = 4)
colnames(shopping) # column of the Dataset
tail(shopping, n=5)


class(shopping)
table(shopping$Question)
is.na(shopping) # IS there is NA in the Dataset ?
Y=length(which(is.na(shopping)))
Y


# we found there is no NA in data set as all cell contain False Output as well as the value of c is zero 
# In Case if there is NA in Data set then we can remove it 


nashopping= filter(shopping,complete.cases(shopping))


#  DIMENSION OF SHOPPING(SHOPPING TEMPORARY REMOVED NA) is
dim(nashopping)


## Since there is no NA in original data set that why we have same DIMENSION of SHOPPING AND NASHOPPING


#  central Tendency :-
#  1) MEAN of each column(NUMERIC or INTEGER datatype)  
#  2) MEDIAN  of each column(NUMERIC or INTEGER datatype)


attach(shopping)


#1 )Mean
print(" mean Shopping Percentage")
mean(`Percentage`)
print(" mean of Shopping Count")
mean(`Influenced`)

# 2 ) Median
print("  Median of shopping Percentage")
median(`Percentage`)
print("  Median of shopping count")
median(`Influenced`)


#  Plotting the given dataset.

plot(Percentage,Influenced)

barplot(Influenced)


# use which command to fetch some data
which(Segment.Description=='Web')
which(`Answer`=='Facebook')


# List All the different Socail Meida 
View(unique(Answer))


# Make a List with Answer which includes only Facebook.
View(select(shopping,Answer,contains("Facebook")))


# Arrange the dataset in descending order of Influenced Count
View(arrange(shopping,desc(Influenced)))


# Total Influenced done by each Social Media
shopping %>% group_by(Answer) %>% summarize(sum(Influenced))


# Which Social media has most No of Data.
View(filter(shopping,Answer %in% c(max(Answer))))


# Make pie chart of given dataset using ggplot.
data <- shopping %>% 
  group_by(Answer) %>% 
  summarize(Influenced= n(),
            Percentage = n()/nrow(shopping))

colors <- c("#FFFFFF","#F5FCC2","#E0ED87","#CCDE57",
            "#B3C732","#94A813","#718200")


pie <- ggplot(data = data, aes(x="", y = Percentage, fill = Influenced)) +
  geom_col(color = "black") +
  coord_polar("y", start = 0) + 
  geom_text(aes(label = paste0(round(Percentage*100), "%")), 
            position = position_stack(vjust = 0.5)) +
  theme(panel.background = element_blank(),
        axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(), 
        plot.title = element_text(hjust = 0.5, size = 18)) +
  ggtitle("Pie chart of Socal Influenced on Shopping (ggplot2)") +
  scale_fill_manual(values = colors)

pie


# Total amount of segment type of each social 
View(count(group_by(shopping,Segment.Type)))





