#From minimal examples to improved version. Each Code gives you
#an minimal example based on implemented data; Start simple and improve
#it step by step
library(ggplot2)

#Here we use the mtcars cars data set and we make a scatterplot to examine whether
#hp (horsepower) increase the consumption of cars (Miles/(US) gallon)
head(mtcars)

#The minimal example
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point() +
  geom_smooth() 

?geom_smooth

#Adjust appearance of points and line
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(color="black", size=2, shape=3) +
  geom_smooth(color="red", size=1, linetype=3) 

#Adjust functional association =>
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point() + #Adds the points
  geom_smooth(method="loess", se=TRUE)

#span: small numbers make a wigglier curve, 
#larger numbers make a smoother curve.
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point() + #Adds the points
  geom_smooth(span = 0.5)

#Is it a linear association?
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point() + #Adds the points
  geom_smooth(method=lm)   # Adds linear regression line

#Increase visibility and reduce overplotting
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(color = "gray40", alpha = .5)+
  geom_smooth(method="loess", se=FALSE)

#Or use a jitter to reduce overplotting
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(color = "gray40", alpha = .5,
             position=position_jitter(width=1,height=.5))+
  geom_smooth(method="loess", se=FALSE)


#Do you expect to see the same pattern for different subgroups? Adjust color and
#shape for another third group variable
ggplot(mtcars, aes(x=hp, y=mpg,
                   color=as.factor(am),
                   shape=as.factor(am))) +
  geom_point(alpha = .5)+
  geom_smooth(method="loess", se=F)


#Effect may depend on a third variable, adjust the size of your points depending
#on this third variable

ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(aes(size = cyl),alpha = .5)+
  geom_smooth(method="loess", se=TRUE)



