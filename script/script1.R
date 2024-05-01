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










