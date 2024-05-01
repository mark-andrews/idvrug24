library(tidyverse)

# blank canvas with the correct axes
ggplot(data_df, 
       mapping = aes(x = var1, y = var2)
) 

# add a layer of points to those axes
ggplot(data_df, 
       mapping = aes(x = var1, y = var2)
) + geom_point()

# add a line layer instead of a layer of points
ggplot(data_df, 
       mapping = aes(x = var1, y = var2)
) + geom_line()

# add a line layer AND a layer of points
ggplot(data_df, 
       mapping = aes(x = var1, y = var2)
) + geom_line() + geom_point()

# map var3 to colour
ggplot(data_df,
       mapping = aes(x = var1, y = var2, colour = var3)
) + geom_point()

# coloured line plots
ggplot(data_df,
       mapping = aes(x = var1, y = var2, colour = var3)
) + geom_line()

# coloured line and points plots
ggplot(data_df,
       mapping = aes(x = var1, y = var2, colour = var3)
) + geom_line() + geom_point()

# increase/decrease the size of the points
ggplot(data_df, 
       mapping = aes(x = var1, y = var2)
) + geom_point(size = 10, colour = '#708090')

# less verbose aes mapping
ggplot(data_df, aes(var1, var2)) + geom_point() 


# Histograms --------------------------------------------------------------

# histogram with 2cm bins
# with red internal (fill) colour and white border
ggplot(weight_df, 
       mapping = aes(x = height)
) + geom_histogram(binwidth = 2, colour = 'white', fill = 'red')

# here, we specify number of bins
ggplot(weight_df, 
       mapping = aes(x = height)
) + geom_histogram(bins = 100, colour = 'white')

# map gender to the colour of the bars
# this makes a stacked histogram
ggplot(weight_df,
       mapping = aes(x = height, fill = gender)
) + geom_histogram(colour = 'white', binwidth = 2) 

# this is "dodged" histogram
ggplot(weight_df,
       mapping = aes(x = height, fill = gender)
) + geom_histogram(colour = 'white', 
                   binwidth = 2, 
                   position = 'dodge') 

# the identity histogram
ggplot(weight_df,
       mapping = aes(x = height, fill = gender)
) + geom_histogram(colour = 'white', 
                   binwidth = 2, 
                   position = 'identity') 

# the identity histogram
ggplot(weight_df,
       mapping = aes(x = height, fill = gender)
) + geom_histogram(colour = 'white', 
                   binwidth = 2, 
                   position = 'identity',
                   alpha = 0.8)

ggplot(weight_df,
       mapping = aes(x = height, fill = gender)
) + geom_histogram(colour = 'white', 
                   binwidth = 2, 
                   position = 'fill')
  


# barplot -----------------------------------------------------------------

ggplot(titanic_df, 
       mapping = aes(x = passengerClass)
) + geom_bar()


titanic_df <- mutate(titanic_df, 
                     passengerClass = factor(passengerClass, 
                                             levels = c('3rd', '1st', '2nd')
                     )
)

ggplot(titanic_df, 
       mapping = aes(x = passengerClass)
) + geom_bar()

# colour code bars by survival or not
ggplot(titanic_df, 
       mapping = aes(x = passengerClass, fill = survived)
) + geom_bar()

# colour code bars by survival or not
# explicitly state position = 'stack'
ggplot(titanic_df, 
       mapping = aes(x = passengerClass, fill = survived)
) + geom_bar(position = 'stack')

# colour code bars by survival or not
# explicitly state position = 'fill'
ggplot(titanic_df, 
       mapping = aes(x = passengerClass, fill = survived)
) + geom_bar(position = 'fill')

# colour code bars by survival or not
# explicitly state position = 'dodge'
ggplot(titanic_df, 
       mapping = aes(x = passengerClass, fill = survived)
) + geom_bar(position = 'dodge')



# colour code bars by survival or not
# explicitly state position = 'identity'
ggplot(titanic_df, 
       mapping = aes(x = passengerClass, fill = survived)
) + geom_bar(position = 'identity', alpha = 0.75)


# Boxplots ----------------------------------------------------------------

ggplot(swiss_df, mapping = aes(y = Fertility)) + geom_boxplot()


ggplot(swiss_df, mapping = aes(y = Fertility)) + geom_boxplot()

ggplot(swiss_df, mapping = aes(x = '', y = Fertility)) + 
  geom_boxplot(width = .25)

# box and jitter plot
ggplot(swiss_df, mapping = aes(x = '', y = Fertility)) + 
  geom_boxplot(width = .25, outlier.shape = NA) +
  geom_jitter(width = .1, size = 0.75)

# try a another jitter plot; not so good; too many points
ggplot(weight_df, mapping = aes(x = '', y = height)) + 
  geom_boxplot(width = .25, outlier.shape = NA) +
  geom_jitter(width = .1, size = 0.75)

# side by side boxplots
ggplot(swiss_df, mapping = aes(x = is_catholic, y = Fertility)) + 
  geom_boxplot(width = .25, outlier.shape = NA) +
  geom_jitter(width = .1, size = 0.75)

# side by side boxplots
ggplot(swiss_df, mapping = aes(x = is_catholic, y = Fertility)) + 
  geom_boxplot(width = .25, outlier.shape = NA, notch = TRUE) +
  geom_jitter(width = .1, size = 0.75)


# method of supply on x axis
ggplot(ToothGrowth,
       mapping = aes(x = supp, y = len)
) + geom_boxplot()

# dose on x axis; doesn't quite work ....
ggplot(ToothGrowth,
       mapping = aes(x = dose, y = len)
) + geom_boxplot()

ggplot(ToothGrowth,
       mapping = aes(x = dose, y = len, group = dose)
) + geom_boxplot()

# we must use "interaction" to group by two variables at once
ggplot(ToothGrowth,
       mapping = aes(x = dose, 
                     y = len, 
                     colour = supp, 
                     group = interaction(supp, dose))
) + geom_boxplot()

# add jitter plot
ggplot(ToothGrowth,
       mapping = aes(x = dose, 
                     y = len, 
                     colour = supp, 
                     group = interaction(supp, dose))
) + geom_boxplot(outlier.shape = NA, width = 1/3) + 
  geom_jitter(size = 0.5, 
              position = position_jitterdodge(dodge.width = 1/3,
                                              jitter.width = 1/6))


# barplot

ggplot(ToothGrowth,
       mapping = aes(x = dose, y = len, fill = supp)
) + geom_col(position = 'dodge')


ToothGrowth_2 <- summarise(group_by(ToothGrowth, dose, supp),
                           avg = mean(len),
                           upper = avg + sd(len)/sqrt(n()),
                           lower = avg - sd(len)/sqrt(n()))

# bar and errorbar; didn't quite work
ggplot(ToothGrowth_2,
       aes(x = dose, y = avg, fill = supp,  ymin = lower, ymax = upper)
) + geom_col(position = 'dodge') + 
  geom_errorbar(width = 0.2, position = position_dodge())

# fix it
ggplot(ToothGrowth_2,
       aes(x = dose, y = avg, fill = supp, ymin = lower, ymax = upper)
) + geom_col(position = 'dodge2') + 
  geom_errorbar(position = position_dodge2(width = 0.2,padding = 0.8))
