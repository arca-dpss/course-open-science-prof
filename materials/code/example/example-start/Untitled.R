library('tidyverse')

raw_data_file <- "raw-data.csv"

my_data <- read.csv(file = raw_data_file)

ggplot(my_data, aes(x = x, y = y, fill = x)) +
  ggdist::stat_halfeye(adjust = .5, width = .5, .width = 0, alpha = .8,
                       justification = -.15, point_colour = NA) +
  geom_boxplot( width = .25, position = position_nudge(x = -.15),
                outlier.shape = NA, alpha = .8) +
  geom_point(size = 1.3, alpha = .7,
             position = position_jitter(seed = 1, width = .1)) +
  theme_bw() +
  theme(legend.position = "top",
        legend.background = element_rect(fill = "transparent"))

lm_fit <- lm(y ~ x, data = my_data)

