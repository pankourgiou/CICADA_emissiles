library(RSQLite)
library(dplyr)
library(ggplot2)

# Create synthetic data for CICADA eMissiles
set.seed(42)
missile_data <- data.frame(
    id = 1:100,
    launch_angle = runif(100, 20, 80),  # Random launch angles between 20 and 80 degrees
    speed_kmh = rnorm(100, mean = 200, sd = 10),  # Normal distribution of speed
    accuracy_m = rnorm(100, mean = 2, sd = 0.5),  # Accuracy in meters
    time_to_target_s = rnorm(100, mean = 5, sd = 1),  # Time to target in seconds
    success_rate = runif(100, 0.8, 1)  # Success rate between 80% and 100%
)

# Perform basic statistics
summary_stats <- missile_data %>%
    summarise(
        avg_speed = mean(speed_kmh),
        sd_speed = sd(speed_kmh),
        avg_accuracy = mean(accuracy_m),
        sd_accuracy = sd(accuracy_m),
        avg_time = mean(time_to_target_s),
        sd_time = sd(time_to_target_s),
        avg_success_rate = mean(success_rate)
    )
print(summary_stats)

# Plot speed distribution
ggplot(missile_data, aes(x = speed_kmh)) +
    geom_histogram(binwidth = 5, fill = "blue", alpha = 0.7) +
    labs(title = "Speed Distribution of CICADA eMissiles", x = "Speed (km/h)", y = "Count")

# Correlation analysis
cor_matrix <- cor(missile_data[, c("launch_angle", "speed_kmh", "accuracy_m", "time_to_target_s", "success_rate")])
print(cor_matrix)
