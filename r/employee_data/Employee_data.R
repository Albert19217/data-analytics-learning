library(tidyverse)
library(ggplot2)
library(ggrepel)

employee_data <- data.frame(
  employee = c("John", "Mary", "David", "Sarah", "Daniel", 
               "Grace", "Michael", "Linda", "James", "Sophia"),
  department = c("IT", "HR", "IT", "Finance", "IT", 
                 "HR", "Finance", "IT", "HR", "Finance"),
  experience = c(3, 5, 2, 6, 4, 
                 7, 3, 5, 4, 6),
  salary = c(4500, 5200, 4000, 6000, 4800, 
             6500, 4700, 5300, 5000, 6200),
  project = c(5, 6, 3, 7, 4, 
              8, 5, 6, 5, 7),
  hoursworked = c(160, 170, 150, 180, 165, 
                  175, 160, 172, 168, 178)
    )


employee_data_clean <- employee_data %>%
  mutate(salary_per_project = salary / project,
         productivity = project / hoursworked,
         performance = ifelse(project >= 7, "Excellent",
                              ifelse(project >= 5 & project <= 6, "Good",
                                     "Average")))
print(employee_data_clean)


summary <- employee_data_clean %>%
  group_by(department) %>%
  summarise(
    avg_salary = mean(salary),
    max_salary = max(salary),
    min_salary = min(salary),
    total_project = sum(project),
    employeecount = n(),
    avg_productivity = mean(productivity)
  )

summary

employee_data_clean <- factor(employee_data_clean$Employee,
                              levels = c("John", "Mary", "David", "Sarah", "Daniel", 
                                         "Grace", "Michael", "Linda", "James", "Sophia") )


  ggplot(data = summary, aes(x = reorder(department, avg_salary),
                             y = avg_salary, fill = department)) +
   geom_col(show.legend = FALSE) +
    geom_text(aes(label = round(avg_salary, 1)), vjust = -0.5, size = 4) +
    scale_fill_brewer(palette = "Set2") +
    labs(
      title = "Average Salary By Department",
      x = "Department",
      y = "Salary"
    ) +
    theme_minimal(base_size = 12) +
    theme(
      plot.title = element_text(face = "bold", size = 14)
    )
    
  
   ggplot(data = employee_data_clean, aes(x = reorder(employee, project), 
                                          y = project)) +
     geom_col(fill = "steelblue") +
     geom_text(aes(label = project), vjust = -0.5) +
     labs(
       title = "Number of Project Per Employee",
       x = "Employee",
       y = "Project"
     ) +
     theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
    
   ggplot(data = employee_data_clean,
          mapping = aes(x = experience,
                        y = salary, color = department)) +
     geom_point(size = 3) +
     geom_text_repel(aes(label = employee)) +
     scale_color_brewer(palette = "Set2") +
     labs(
       title = "Salary vs Experience",
       x = "Years of Experience",
       y = "Monthly Salary"
     ) +
     theme_minimal(base_size = 12)
  
    
   ggplot(data = employee_data_clean, mapping = aes(x = hoursworked,
                                                    y = project, color = department)) +
     geom_point(size = 3) +
     geom_text_repel(aes(label = employee)) +
     scale_color_brewer(palette = "Set2") +
     labs(
       title = "Project vs Hours Worked",
       x = "Number of Hours Worked",
       y = "Project"
     ) +
     theme_minimal(base_size = 12)
 
     
   ggplot(data = employee_data_clean, aes(x = department,
                                    y = salary, fill = department)) +
     geom_boxplot(show.legend = FALSE) +
     labs(
       title = "Salary Distribution by Department",
       x = "Department",
       y = "Salary"
     ) +
     theme_minimal(base_size = 12)
   
   ggplot(employee_data_clean, aes(x = performance, fill = performance)) +
     geom_bar(show.legend = FALSE) +
     geom_text(stat = "count", aes(label =  after_stat(count)), vjust = -0.5) +
     scale_fill_brewer(palette = "Set2") +
     labs(
       title = "Employee Performance Distribution", 
       x = "Rating", 
       y = "Count") +
     theme_minimal(base_size = 12)
   
   