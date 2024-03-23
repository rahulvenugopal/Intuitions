# Understand the difference between paired vs non paired tests in terms of power

# Load libraries
library(tidyverse)
library(ggpubr)

# Load data
spider_data <- readr::read_csv("big_hairy_spider.csv")

spider_data %>% 
  group_by(spider_type) %>% 
  summarise(mean = mean(anxiety),
            sd = sd(anxiety))

# Paired vs Unpaired
spidey_paired <- spider_data %>% 
  t.test(anxiety ~ spider_type, data = ., paired = TRUE)
report::report(spidey_paired)


spidey_unpaired <- spider_data %>% 
  t.test(anxiety ~ spider_type, data = ., paired = FALSE)
report::report(spidey_unpaired)

# What happened here
# The way in which standard error is calculated based on experimental design is the key here
# Let us jump in

# Visualise the mean and SE plots
p1 <- ggerrorplot(spider_data, x = "spider_type", y = "anxiety", 
            desc_stat = "mean_sd", 
            color = "spider_type", palette = "jco",
            position = position_dodge(0.3))  # Adjust the space between bars


p1 + labs(title = "Mean and Standard error is visualised",
          subtitle = "Visual scanning shows overlap of error bars",
          x= "Type of spider",
          y = "Anxiety") +
  theme(
  axis.ticks = element_line(color = "grey92"),
  axis.ticks.length = unit(0, "lines"),
  panel.grid.minor = element_blank(),
  legend.position = "none",
  plot.title.position="plot",
  axis.title = element_text(color = "grey20", size = 20),
  axis.text.x = element_text(color = "grey20", size = 16),
  axis.text.y = element_text(color = "grey20", size = 16))

ggsave("mean_se_viz.png",
       width = 6, height = 6,
       dpi = 600)


# Get to understand what happens with paired t test and repeated m --------

paired_data <- spider_data %>% 
  pivot_wider(names_from = "spider_type",
              values_from = "anxiety")

# Compute mean of each subject
paired_data <- paired_data %>% 
  mutate(subj_mean = (Real+Picture)/2)

# compute grand mean
paired_data <- paired_data %>% 
  mutate(grand_mean = mean(c(paired_data$Real,paired_data$Picture)))

paired_data <- paired_data %>% 
  mutate(adjustment_factor = grand_mean -subj_mean)

# Loftus and Mason in 1994 told us to adjust these
paired_data$Real_adj <- paired_data$Real + paired_data$adjustment_factor
  
paired_data$Picture_adj <- paired_data$Picture + paired_data$adjustment_factor

# The mean values does not change
print(c(mean(paired_data$Real), mean(paired_data$Real_adj)))
print(c(mean(paired_data$Picture), mean(paired_data$Picture_adj)))

# Convert the wide back to long
spider_data_adj <- paired_data %>% 
  pivot_wider(names_from = "spider_type",
              values_from = "anxiety")

# Visualise the mean and SE plots post adjustment
p2 <- ggerrorplot(paired_data, x = "spider_type", y = "anxiety", 
                  desc_stat = "mean_sd", 
                  color = "spider_type", palette = "jco",
                  position = position_dodge(0.3))  # Adjust the space between bars


p2 + labs(title = "Mean and Standard error is visualised",
          subtitle = "Visual scanning shows overlap of error bars",
          x= "Type of spider",
          y = "Anxiety") +
  theme(
    axis.ticks = element_line(color = "grey92"),
    axis.ticks.length = unit(0, "lines"),
    panel.grid.minor = element_blank(),
    legend.position = "none",
    plot.title.position="plot",
    axis.title = element_text(color = "grey20", size = 20),
    axis.text.x = element_text(color = "grey20", size = 16),
    axis.text.y = element_text(color = "grey20", size = 16))

ggsave("mean_se_viz.png",
       width = 6, height = 6,
       dpi = 600)