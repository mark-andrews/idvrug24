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

ggplot(data_df,
       mapping = aes(x = var1, y = var2, colour = var3)
) + geom_line()

ggplot(data_df,
       mapping = aes(x = var1, y = var2, colour = var3)
) + geom_line() + geom_point()

