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
) + geom_polygon(colour = 'white', linewidth = 0.1) +
  scale_fill_distiller(type = 'div', palette = 5, limits = c(21, 76)) +
  coord_equal() +
  theme_void() + # no axis grids +
  labs(fill = '% Vote leave')

  

# Fine tuning -------------------------------------------------------------

p1 <- ggplot(weight_df, 
             mapping = aes(x = height, y = weight, colour = gender)) + 
  geom_point()

p1 + theme_classic()
p1 + theme_minimal()
p1 + theme_bw()
p1 + theme_dark()
p1 + theme_light()

library(ggthemes)

p1 + theme_wsj()
p1 + theme_economist()
p1 + theme_economist_white()

p1 + theme_void() + theme_classic()

# labels of axes
p1 + labs(x = 'Height (cm)', y = 'Weight (kg)', colour = 'Sex')
p1 + xlab('Height') # see also ylab

# fig title
p1 + ggtitle('Scatterplot of weight on height')

# limits of the axes
p1 + lims(x = c(0, 250),
          y = c(0, 150))

p1 + xlim(100, 300) # see also ylim

# colours
p1 + scale_colour_manual(values = c('green', 'red'))

p1 + scale_colour_brewer(palette = 'Accent')
p1 + scale_colour_brewer(palette = 'BrBG')
p1 + scale_colour_brewer(palette = 'Dark2')
p1 + scale_colour_brewer(palette = 'Pastel1')
p1 + scale_colour_brewer(palette = 'Set2')
p1 + scale_colour_brewer(palette = 'Set1')

# breaks on axes
p1 + scale_x_continuous(breaks = c(150, 175, 200),
                        labels = c('A', 'B', 'C'))
  
  
p2 <- ggplot(weight_df, aes(x = gender, y = height)) + geom_boxplot()
  
p2 + scale_x_discrete(label = c('Women', 'Men'))

# change position of legend
p1 + theme(legend.position = 'bottom')
p1 + theme(legend.position = 'top')
p1 + theme(legend.position = 'left')
p1 + theme(legend.position = 'right')
p1 + theme(legend.position = 'none')

p1 + 
  labs(x = 'Height (cm)') +
  theme(axis.title.x = element_text(size = 25, angle = 45, colour = 'blue'))

p1 + 
  theme(axis.text.x = element_text(angle = 45))

