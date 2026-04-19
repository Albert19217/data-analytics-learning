# Nigeria Weather Analysis Dashboard

> Which Nigerian city has the most extreme weather? This project explores temperature 
> patterns and rainfall distribution across major Nigerian cities using R.

![R](https://img.shields.io/badge/R-276DC3?style=flat&logo=r&logoColor=white)
![tidyverse](https://img.shields.io/badge/tidyverse-1A162D?style=flat&logo=r&logoColor=white)
![ggplot2](https://img.shields.io/badge/ggplot2-FC5200?style=flat)

---

## Project Overview

This project demonstrates a complete data analysis workflow including data cleaning,
transformation, aggregation, visualization, and insight generation — built entirely
using the tidyverse ecosystem in R.

> **Note:** The dataset was manually simulated for demonstration purposes using
> realistic Nigerian climate ranges.

---

## Dataset Description

The dataset covers weather conditions across four Nigerian cities — **Lagos**, **Abuja**,
**Port Harcourt**, and **Kano** — each with daily temperature values, rainfall
measurements, and a 5-day observation period.

---

## Key Insights

| City | Finding |
|------|---------|
| Kano | Recorded the highest overall temperatures |
| Port Harcourt | Experienced the highest rainfall levels |
| Abuja | Showed consistently lower rainfall patterns |
| Lagos | Maintained stable and moderate temperature trends |

---

## Skills Demonstrated

### Data Manipulation — `dplyr`
- `filter()` — subset data by condition
- `select()` — choose relevant variables
- `mutate()` — create new features
- `arrange()` — sort observations
- `group_by()` + `summarise()` — aggregate insights
- `left_join()` — combine datasets

### Data Reshaping — `tidyr`
- `pivot_longer()` — transformed data from wide to long format

### Data Visualization — `ggplot2`
- Bar charts for city comparisons
- Line charts for temperature trends across days
- Faceted plots for grouped analysis
- Data labels and custom themes for clarity

### Advanced R Concepts
- `case_when()` for conditional classification
- Pipe operator `%>%` for workflow structuring
- Grouped statistical summaries

---

## Visualizations Included

- Average temperature comparison by city
- Temperature trends across days
- Total rainfall distribution

> All charts were built with `ggplot2`. See the `/outputs/` folder for exported plots.

---

## How to Run

```r
# 1. Clone this repository
git clone https://github.com/Albert19217/nigeria-weather-analysis.git

# 2. Open the project in RStudio

# 3. Install required packages
install.packages(c("tidyverse"))

# 4. Run the analysis
source("nigeria_weather_analysis.R")

# Or knit the R Markdown report
rmarkdown::render("nigeria_weather_report.Rmd")
```

---

## Tools & Technologies

- R
- dplyr, tidyr, ggplot2
- R Markdown

---

## Future Improvements

- Use real-world meteorological datasets from NIMET or open climate APIs
- Build an interactive dashboard using Shiny
- Integrate SQL for data extraction and querying
- Automate reporting with parameterized R Markdown

---

## Author

**Samson O.** — Aspiring Data Analyst Spreadsheets | SQL | R | Python

- GitHub: [github.com/YOUR-USERNAME](https://github.com/Albert19217)

---

> This project is part of my continuous learning journey in data analytics using R.
> Feedback and contributions are welcome!