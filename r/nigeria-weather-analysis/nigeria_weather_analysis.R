library(dplyr)
library(tidyr)
library(ggplot2)

weather <- data.frame(
  city = rep(c("Lagos", "Abuja", "Port Harcourt", "Kano"), each = 5),
  day = rep(1:5, times = 4),
  temperature = c(32, 34, 33, 35, 36, 
                  30, 31, 32, 33, 34,
                  31, 32, 33, 34, 35,
                  35, 36, 37, 38, 39),
  rainfall = c(10, 5, 8, 2, 0,
               2, 0, 1, 0, 0, 
               12, 10, 8, 6, 4,
               0, 0, 0, 0, 0)
) 

head(weather) 
      
weather_clean <- weather %>%
  mutate(temp_status = case_when(
       temperature >= 37 ~ "Very Hot",
       temperature >= 33 ~ "Hot",
       TRUE ~ "Normal"))

View(weather_clean)


weather_long <- weather_clean %>%
  pivot_longer(
    cols = c(temperature, rainfall),
    names_to = "variable",
    values_to = "value"
  )

View(weather_long) 
      

summary_table <- weather_clean %>%
  group_by(city) %>%
  summarise(
    avg_temp_per_city = mean(temperature),
    total_rainfall_per_city = sum(rainfall),
    max_temp_per_city = max(temperature), .groups = "drop") %>%
    arrange(desc(avg_temp_per_city)) %>%
    mutate(
      metric = case_when(total_rainfall_per_city > 20 ~
                              "High Rainfall",
                            TRUE ~ "Low Rainfall"
)
  )

View(summary_table) 
      


ggplot(data = summary_table,
       aes(x = reorder(city, avg_temp_per_city),
           y = avg_temp_per_city, 
           fill = city)) +
  geom_col(show.legend = FALSE) +
  geom_text(aes(label = round(avg_temp_per_city, 1)), 
            vjust = -0.5,
            size = 4) +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title = "Average Temperature by City",
    subtitle = "5-day observation period across Nigerian cities",
    x = "City",
    y = "Average Temperature (°C)"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(size = 10, color = "gray40")
  )


ggplot(data = weather_clean, 
       aes(x = day, y = temperature, color = city, group = city)) +
  geom_line(size = 1) +
  geom_point(size = 2.5) +
  scale_color_brewer(palette = "Set1") +
  labs(
    title = "Temperature Trends by City",
    subtitle = "Daily temperature patterns across 5 days",
    x = "Day",
    y = "Temperature (°C)",
    color = "City"
  ) +
  facet_wrap(~ city, scales = "free_y") +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(size = 10, color = "gray40"),
    legend.position = "none",
    strip.text = element_text(face = "bold", size = 11)
  )

ggplot(data = summary_table, 
       aes(x = reorder(city, total_rainfall_per_city), 
           y = total_rainfall_per_city, 
           fill = city)) +
  geom_col(show.legend = FALSE) +
  geom_text(aes(label = total_rainfall_per_city), 
            vjust = -0.5, 
            size = 4) +
  labs(
    title = "Total Rainfall by City",
    subtitle = "Cumulative rainfall over 5-day period",
    x = "City",
    y = "Total Rainfall (mm)"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(size = 10, color = "gray40"),
    legend.position = "top"
  )


















