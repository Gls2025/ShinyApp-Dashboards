# ShinyApp-Dashboards

# 🩺 NCD Burden in Africa – ShinyApp Dashboard

This interactive **ShinyApp Dashboard** visualizes the burden of **Non-Communicable Diseases (NCDs)** across African countries. It aims to inform public health planning, policy advocacy, and academic research by showcasing trends and disparities in NCD indicators such as diabetes, cardiovascular disease, cancer, and chronic respiratory illnesses.

## 📊 Key Features

- **Country-level visualization** of NCD prevalence, mortality, and risk factors.
- **Interactive maps and charts** to explore:
  - NCD death rates by country
  - Age-standardized prevalence of key conditions
  - Risk factors (e.g., obesity, tobacco use, high blood pressure)
- **Filter by region, year, or disease category**
- **Downloadable datasets and graphs** for research use

## 📁 Project Structure

ShinyApp-NCD-Burden-Africa/
├── app.R # Main Shiny app script
├── data/
│ └── ncd_data.csv # Cleaned NCD dataset
├── www/
│ └── styles.css # Custom styling (optional)
├── README.md # Project description (this file)
└── screenshots/
└── dashboard.png # Optional UI preview


## 🛠️ Requirements

- R ≥ 4.0
- [Shiny](https://shiny.rstudio.com/)
- Tidyverse
- Leaflet (for maps)
- Plotly (for interactive charts)
- DT (for tables)

Install packages:

```r
install.packages(c("shiny", "tidyverse", "leaflet", "plotly", "DT"))

🚀 Running the App
# From within RStudio:
shiny::runApp("path/to/ShinyApp-NCD-Burden-Africa")

Or click Run App in RStudio after opening app.R.
