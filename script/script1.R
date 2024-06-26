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

ggplot(ToothGrowth,
       mapping = aes(x = dose, 
                     y = len, 
                     colour = supp, 
                     group = interaction(supp, dose))
) + geom_violin(trim = FALSE)

ggplot(weight_df,
       mapping = aes(x = gender, 
                     y = height)
) + geom_violin(trim = FALSE)

# barplots -----------------------------------------------------------------

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
  geom_errorbar(width = 0.1, position = position_dodge())

# fix it
ggplot(ToothGrowth_2,
       aes(x = dose, y = avg, fill = supp, ymin = lower, ymax = upper)
) + geom_col(position = 'dodge2')# + 
  geom_errorbar(position = position_dodge2(width = 0.1,padding = 0.9))

# Scatterplots -------------------------------------------------------------

ggplot(weight_df,
       mapping = aes(x = height, y = weight)
) + geom_point()
  
ggplot(weight_df,
       mapping = aes(x = height, y = weight)
) + geom_point(size = 0.5, alpha = 0.6)

ggplot(weight_df,
       mapping = aes(x = height, y = weight, colour = gender)
) + geom_point(size = 0.5) + theme_classic()

# add rug plot too
ggplot(weight_df,
       mapping = aes(x = height, y = weight, colour = gender)
) + geom_point(size = 0.5) + theme_classic() +
  geom_rug(size = 0.1, alpha = 0.5)

# Marginal plots

library(ggExtra)

# default marginal plot using density estimations
p1 <- ggplot(weight_df,
             mapping = aes(x = height, y = weight, colour = gender)
) + geom_point(size = 0.5) + theme_classic() +
  geom_rug(size = 0.1, alpha = 0.5)


ggMarginal(p1)

# marginal plot with histograms for each axis
p2 <- ggplot(weight_df,
             mapping = aes(x = height, y = weight, colour = gender)
) + geom_point(size = 0.5) + theme_classic() +
  theme(legend.position = 'bottom')

ggMarginal(p2,
           type = 'histogram',
           groupColour = TRUE,
           position = 'identity',
           bins = 50,
           alpha = 0.5,
           groupFill = TRUE)

# contour plot

ggplot(weight_df,
             mapping = aes(x = height, y = weight, colour = gender)
) + geom_density2d()


# lines/curves of best fit ------------------------------------------------

ggplot(swiss_df, mapping = aes(x = Examination, y = Fertility)) +
  geom_point() +
  geom_smooth() # loess smoother

# line of best fit
ggplot(swiss_df, mapping = aes(x = Examination, y = Fertility)) +
  geom_point() +
  geom_smooth(method = 'lm')

# line of best fit, no confidence interval
ggplot(swiss_df, mapping = aes(x = Examination, y = Fertility)) +
  geom_point() +
  geom_smooth(method = 'lm', se = F)

# polynomial regression degree 2, i.e. quadratic
ggplot(swiss_df, mapping = aes(x = Examination, y = Fertility)) +
  geom_point() +
  geom_smooth(method = 'lm', se = F, formula = 'y ~ poly(x, 2)')

# nonlinear regression using generalized additive models (GAMs)
ggplot(swiss_df, mapping = aes(x = Examination, y = Fertility)) +
  geom_point() +
  geom_smooth(method = 'gam')

# with lots of data, nonlinear regression using gam by default
ggplot(weight_df, mapping = aes(x = height, y = weight)) +  
  geom_point(size = 0.5, alpha = 0.6) + geom_smooth()

# when we use colour = something, we get multiple curves or lines
ggplot(weight_df, 
       mapping = aes(x = height, y = weight, colour = gender)) +  
  geom_point(size = 0.5, alpha = 0.6) + 
  geom_smooth(fullrange = TRUE, se = F) +
  theme_classic()

# here are multiple lines of best fit; one per group
ggplot(weight_df, 
       mapping = aes(x = height, y = weight, colour = gender)) +  
  geom_point(size = 0.5, alpha = 0.6) + 
  geom_smooth(method = 'lm', fullrange = TRUE, se = F) +
  theme_classic()

# Labels on points --------------------------------------------------------

# labels on points
ggplot(swiss_df, 
       mapping = aes(x = Examination, y = Fertility, label = province)) +
  geom_point() +
  geom_text()

# using ggrepel tools
library(ggrepel)

# labels on points
ggplot(swiss_df, 
       mapping = aes(x = Examination, y = Fertility, label = province)) +
  geom_point() +
  geom_text_repel()

ggplot(swiss_df, 
       mapping = aes(x = Examination, y = Fertility, label = province)) +
  geom_point() +
  geom_text_repel(max.overlaps = 20)

ggplot(swiss_df, 
       mapping = aes(x = Examination, y = Fertility, label = province)) +
  geom_point() +
  geom_label_repel(max.overlaps = 20)

ggplot(swiss_df, 
       mapping = aes(x = Examination, 
                     y = Fertility, 
                     label = province,
                     colour = is_catholic)) +
  geom_point() +
  geom_text_repel(max.overlaps = 20)

# Facet plots -------------------------------------------------------------


# facet plots; one subplot per each gender
ggplot(weight_df, 
       mapping = aes(x = height, y = weight)) +  
  geom_point(size = 0.5, alpha = 0.6) + 
  geom_smooth(method = 'lm', fullrange = TRUE, se = F) +
  theme_classic() +
  facet_wrap(~gender)

# facet plots; two cols of subplots
ggplot(weight_df, 
       mapping = aes(x = height, y = weight)) +  
  geom_point(size = 0.5, alpha = 0.6) + 
  geom_smooth(method = 'lm', fullrange = TRUE, se = F) +
  theme_classic() +
  facet_wrap(~race, ncol = 2)

# facet plots: a grid of subplots; 
# each value of gender as rows, each value of race as cols
ggplot(weight_df, 
       mapping = aes(x = height, y = weight)) +  
  geom_point(size = 0.5, alpha = 0.6) + 
  geom_smooth(method = 'lm', fullrange = TRUE, se = F) +
  theme_classic() +
  facet_grid(gender ~ race)

# facet plots; both axes free to vary to range of values in each subplot
ggplot(weight_df, 
       mapping = aes(x = height, y = weight)) +  
  geom_point(size = 0.5, alpha = 0.6) + 
  geom_smooth(method = 'lm', fullrange = TRUE, se = F) +
  theme_classic() +
  facet_wrap(~gender, scales = 'free')

# facet plots; free x axis, y axis fixed
ggplot(weight_df, 
       mapping = aes(x = height, y = weight)) +  
  geom_point(size = 0.5, alpha = 0.6) + 
  geom_smooth(method = 'lm', fullrange = TRUE, se = F) +
  theme_classic() +
  facet_wrap(~gender, scales = 'free_x')

# facet plots; free y axis, x axis fixed
ggplot(weight_df, 
       mapping = aes(x = height, y = weight)) +  
  geom_point(size = 0.5, alpha = 0.6) + 
  geom_smooth(method = 'lm', fullrange = TRUE, se = F) +
  theme_classic() +
  facet_wrap(~gender, scales = 'free_y')



# Note 1: Is the line of best fit actually the line of best fit? ----------

# Get lm coefficients for gender = Male and gender = Female
weight_best_fit <- weight_df %>% 
  group_by(gender) %>% 
  nest() %>% 
  mutate(b = map(data, ~coef(lm(weight ~ height, data = .)))) %>% 
  unnest_wider(col = b) %>% 
  ungroup() %>% 
  select(gender, intercept = `(Intercept)`, slope = height)

# facet plots
ggplot(weight_df, 
       mapping = aes(x = height, y = weight)) +  
  geom_point(size = 0.5, alpha = 0.6) + 
  geom_smooth(method = 'lm', fullrange = TRUE, se = F) +
  # use a different data set and geom_abline
  # to show the lm model fit
  geom_abline(data = weight_best_fit,
              aes(slope = slope, 
                  intercept = intercept, group = gender),
              colour = 'red'
  ) + theme_classic() +
  facet_wrap(~gender)


# Note 2: Changing uncertainty intervals ----------------------------------

swiss_df2 <- bind_cols(
  swiss_df,
  # 95% confidence interval; change `level` inside `predict`
  # to get different confidence level
  predict(lm(Fertility ~ Examination, data = swiss_df), interval = 'conf')
)

# make your own ribbon
ggplot(swiss_df2,
       aes(x = Examination, y = Fertility)
) + geom_smooth(method = 'lm', se = F) + 
  geom_ribbon(aes(ymin = lwr, ymax = upr), alpha = 0.1)

# separate upper and lower interval lines
ggplot(swiss_df2,
       aes(x = Examination, y = Fertility)
) + geom_smooth(method = 'lm', se = F) + 
  geom_line(aes(y = upr), colour = 'red') + 
  geom_line(aes(y = lwr), colour = 'red')
