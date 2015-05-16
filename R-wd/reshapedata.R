library(reshape2)
print(head(mtcars))

# melting data frames
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars=c("mpg", "hp"))
print(head(carMelt, n=3))
print(tail(carMelt, n=3))

# casting data frames
cylData <- dcast(carMelt, cyl ~ variable)
print(cylData)
cylData <- dcast(carMelt, cyl ~ variable, mean)
print(cylData)

# averaging values
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)

# averaging values - another way
spIns =  split(InsectSprays$count,InsectSprays$spray)
spIns