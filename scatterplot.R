library(ggplot2)

head(mtcars)

ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point() +
  geom_smooth() 

#Adjust appearance
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(color="black", size=2, shape=3) +
  geom_smooth(color="red", size=1, linetype=3) 

#Adjust functional association
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point() + #Adds the points
  geom_smooth(method="loess", se=TRUE)

#span: small numbers make a wigglier curve, 
#larger numbers make a smoother curve.
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point() + #Adds the points
  geom_smooth(span = 0.5)

#Linear?
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point() + #Adds the points
  geom_smooth(method=lm)   # Adds linear regression line

#Increase visibility and reduce overplotting
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(color = "gray40", alpha = .5)+
  geom_smooth(method="loess", se=FALSE)

ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(color = "gray40", alpha = .5,
             position=position_jitter(width=1,height=.5))+
  geom_smooth(method="loess", se=FALSE)





#Same patter in different subgroups?
ggplot(mtcars, aes(x=hp, y=mpg,
                   color=as.factor(am),
                   shape=as.factor(am))) +
  geom_point(alpha = .5)+
  geom_smooth(method="loess", se=F)

#Size another varibale?
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(aes(size = cyl),alpha = .5)+
  geom_smooth(method="loess", se=TRUE)



