library('readxl')
library(ggplot2)
library(ThemePark)
data <- read_excel('/Users/zach/Documents/Education/Undergrad_UWEC/Summer_2023/UCLA/cfu_counting_amelia/23-08-2023/cfu_counting_xcel_data.xlsx'
                   )
adriann_data <- read_excel('/Users/zach/Documents/Education/Undergrad_UWEC/Summer_2023/UCLA/cfu_counting_amelia/23-08-23-adriann/cfu-counting-with-adriann-23-08-23.xlsx')

amelia_resuscitated_data <-read_excel("/Users/zach/Documents/Education/Undergrad_UWEC/Summer_2023/UCLA/cfu_counting_amelia/25-08-2023-amelia/cfu-counts-amelia-25-08-2023.xlsx")

# Set x-axis limits
x_limits <- c(min(data$dilution), max(data$dilution))

# Custom modeling function for a non-linear fit (e.g., quadratic)
nonlinear_model <- function(x, y) {
  lm(y ~ poly(x, 2))
}

# Create the plot using ggplot2 with different colors, shapes, and legend
p <- ggplot(data, aes(x = dilution, color = class)) +
  geom_point(aes(y = `manual count`, shape = "Manual Count"), size = 3) +
  geom_point(aes(y = `open count`, shape = "Open Count"), size = 3) +
  geom_errorbar(aes(y = `open count`, ymin = `open count` - `open excluded`, ymax = `open count` + `open excluded`, color = class), width = 0.2) +
  geom_point(aes(y = `backside count`, shape = "Backside Count"), size = 3) +
  geom_errorbar(aes(y = `backside count`, ymin = `backside count` - `backside excluded`, ymax = `backside count` + `backside excluded`, color = class), width = 0.2) +
  labs(x = "Sample", y = "CFU Count", title = 'OpenCFU compared to Manual Count') +
  scale_color_manual(values = c("pink", "black", "red")) +
  scale_shape_manual(
    values = c("Manual Count" = 16, "Open Count" = 17, "Backside Count" = 2),
    guide = guide_legend(title = "Y-Value Groups",
                         keywidth = 0.2,
                         keyheight = 0.1)
  ) +
  theme_barbie() +
  theme(legend.position = "top",
        title = element_text(size=100),
        axis.title = element_text(size=100),
        text= element_text(size=100))

p
ggsave('cfu-counting-with-amelia.png', p, width = 10, height = 8, dpi = 600)


# Create the plot using ggplot2 with different colors, shapes, and legend
plot<- ggplot(data, aes(x = `manual count`, y = `manual count`, color = class)) +
  geom_line() +
  geom_point(aes(y = `open count`, shape = "Open Count"), size = 3) +
  geom_point(aes(y = `backside count`, shape = "Backside Count"), size = 3) +
  geom_point(aes(shape = "Manual Count"), size = 3, color = "black") +  # Add circles for manual count
  labs(x = "Manual Count", y = "Manual Count", title = "Manual Count vs Open CFU count") +
  scale_color_manual(values = c("pink", "black", "red")) +
  scale_shape_manual(
    values = c("Open Count" = 17, "Backside Count" = 2, "Manual Count" = 1),  # Define shape for manual count
    guide = guide_legend(title = "Y-Value Groups",
                         keywidth = 0.2,
                         keyheight = 0.1)
  ) +
  theme_barbie() 
  
ggsave('bad_text_size_graph.png', dpi=600)





#adriann data graph
# Create the plot using ggplot2 with different colors, shapes, and legend
# Your ggplot code with modified color scale
plot<-ggplot(adriann_data, aes(x = dilution, color = class)) +
  geom_point(aes(y = `manual count`, shape = "Manual Count"), size = 3) +
  geom_point(aes(y = `open count`, shape = "Open Count"), size = 3) +
  geom_errorbar(aes(y = `open count`, ymin = `open count` - `open excluded`, ymax = `open count` + `open excluded`, color = class), width = 0.2) +
  geom_point(aes(y = `backside count`, shape = "Backside Count"), size = 3) +
  geom_errorbar(aes(y = `backside count`, ymin = `backside count` - `backside excluded`, ymax = `backside count` + `backside excluded`, color = class), width = 0.2) +
  labs(x = "Sample", y = "CFU Count", title = 'OpenCFU compared to Manual Count') +
  scale_color_manual(values = c("pink", "black", "red", "blue")) +  # Adjust colors according to your classes
  scale_shape_manual(
    values = c("Manual Count" = 16, "Open Count" = 17, "Backside Count" = 2),
    guide = guide_legend(title = "Y-Value Groups",
                         keywidth = 0.2,
                         keyheight = 0.1)
  ) +
  theme_barbie() 
ggsave('adriann_cfu_data.pdf', plot)



#plotting adrian data and amelia data
both_data<- rbind(data, adriann_data)
# Create the plot using ggplot2 with different colors, shapes, and legend
plot2<-ggplot(both_data, aes(x = `manual count`, y = `manual count`, color = class)) +
  geom_line() +
  geom_point(aes(y = `open count`, shape = "Open Count"), size = 3) +
  geom_point(aes(y = `backside count`, shape = "Backside Count"), size = 3) +
  geom_point(aes(shape = "Manual Count"), size = 3, color = "black") +  # Add circles for manual count
  labs(x = "Manual Count", y = "Manual Count", title = "Manual Count vs Open CFU count") +
  scale_shape_manual(
    values = c("Open Count" = 17, "Backside Count" = 2, "Manual Count" = 1),  # Define shape for manual count
    guide = guide_legend(title = "Y-Value Groups",
                         keywidth = 0.2,
                         keyheight = 0.1)
  ) +
  theme_barbie() 
ggsave("/Users/zach/Documents/Education/Undergrad_UWEC/Summer_2023/UCLA/cfu_counting_amelia/manual_open_cfu_count_both_data.pdf", plot2)


#plotting 2x amelia data and adriann data
all_the_data_so_far <- rbind(data, adriann_data, amelia_resuscitated_data)

# Create the plot using ggplot2 with different colors, shapes, and legend
plot3<-ggplot(all_the_data_so_far, aes(x = `manual count`, y = `manual count`, color = class)) +
  geom_line() +
  geom_point(aes(y = `open count`, shape = "Open Count"), size = 3) +
  geom_point(aes(y = `backside count`, shape = "Backside Count"), size = 3) +
  geom_point(aes(shape = "Manual Count"), size = 3, color = "black") +  # Add circles for manual count
  labs(x = "Manual Count", y = "Manual Count", title = "Manual Count vs Open CFU count") +
  scale_shape_manual(
    values = c("Open Count" = 17, "Backside Count" = 2, "Manual Count" = 1),  # Define shape for manual count
    guide = guide_legend(title = "Y-Value Groups",
                         keywidth = 0.2,
                         keyheight = 0.1)
  ) +
  theme_barbie() 

ggsave("/Users/zach/Documents/Education/Undergrad_UWEC/Summer_2023/UCLA/cfu_counting_amelia/manual_open_cfu_count_all_the_data.pdf", plot3)


