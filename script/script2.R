library(tidyverse)

# Line plots --------------------------------------------------------------

source("https://raw.githubusercontent.com/mark-andrews/idvrug24/main/data/get_data.R")

# line plot; doesn't quite work!
ggplot(nott_df,
       mapping = aes(x = month, y = value)
) + geom_point() + geom_line()

# use group = year in aes to fix
ggplot(nott_df,
       mapping = aes(x = month, y = value, group = year)
) + geom_point() + geom_line()

# use colour = year instead; doesn't quite work either
ggplot(nott_df,
       mapping = aes(x = month, y = value, colour = year)
) + geom_point() + geom_line()

# use factor(year) instead
ggplot(nott_df,
       mapping = aes(x = month, y = value, colour = factor(year))
) + geom_point() + geom_line()

ggplot(nott_df,
       mapping = aes(x = month, y = value, colour = year, group = year)
) + geom_point() + geom_line() + 
  scale_x_continuous(breaks = c(1, 2, 12),
                     labels = c('Jan', 'Feb', 'Dec'))

ggplot(nott_df,
       mapping = aes(x = month, y = value, colour = year, group = year)
) + geom_point() + geom_line() + 
  scale_x_continuous(breaks = seq(12),
                     labels = LETTERS[1:12])

# Heatmaps ----------------------------------------------------------------


ggplot(nott_df,
       aes(x = year, y = month, fill = value)
) + geom_tile() + 
  scale_y_continuous(
    breaks = seq(12),
    labels = c('Jan', 
               'Feb', 
               'Mar', 
               'Apr', 
               'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')
  ) + scale_fill_gradient(
    low = 'green', high = 'red'
  )




# Geospatial maps ---------------------------------------------------------

eu_mapdata <- inner_join(map_data, eu_ref, by = c('id' = 'Area_Code'))

ggplot(eu_mapdata,
       mapping = aes(x = long, y = lat, 
                     fill = Pct_Leave, 
                     group = group)
) + geom_polygon(colour = 'white', size = 0.1) +
  scale_fill_distiller(type = 'div', palette = 5, limits = c(21, 76)) +
  coord_equal() +
  theme_void()  # no axis grids +

  
