# May 9, 2022
# compare.R
# Chris Warren and Jali Purcell
# For Programming Languages 
library(ggplot2)
data(mtcars)

# compares two attributes from mtcars dataframe
compare<-function(desc1,desc2, data1, data2){
  # make the dataframe to see exact values
  Data<-data.frame(
    desc1=data1,
    desc2=data2
  )
  Data2<-setNames(Data,c(desc1,desc2))
  print(Data2)
  
  # print the ggplot scatterplot with customizations
  title=paste(desc2,"vs",desc1)
  print(ggplot(mtcars, aes(x = data1, y = data2)) +geom_smooth(method = "lm", se = FALSE)+
          geom_point()+ggtitle(title)+xlab(desc1)+ylab(desc2)+labs(subtitle="produced from mtcars dataset")
        +theme(plot.background = element_rect(fill="#96FF9C"), panel.background=element_rect(fill="#2EE0DC"),
               text=element_text(family="Courier")))
}

# prompt the user for input
print(noquote("Welcome to compare"))
print(noquote("We have imported a sample dataset about cars"))
print(noquote("Here are the variables you can compare: "))
nameslist<-noquote(paste(names(mtcars)))
print(nameslist)

compare1<-readline(prompt="What do you want to compare first?")
compare1_parse<-paste("mtcars$",compare1)
compare_data_1<-eval(parse(text=compare1_parse))

compare2<-readline(prompt="What do you want to compare it against?")
compare2_parse<-paste("mtcars$",compare2)
compare_data_2<-eval(parse(text=compare2_parse))

# call compare with data and descriptions
compare(compare1,compare2, compare_data_1, compare_data_2)