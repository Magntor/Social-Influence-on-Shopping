# Social Media Influence on Shopping  

**R analysis of how social platforms affect consumer behavior**  

## 📋 Overview  
Analyzes a dataset (`shopping.csv`) to understand which social media platforms most influence shopping decisions.  

## 🔍 Key Features  
- **Data Exploration**: Checks dimensions, structure, and missing values  
- **Statistical Analysis**: Calculates mean/median influence metrics  
- **Visualizations**:  
  - Scatter plot (`Percentage` vs `Influenced`)  
  - Pie chart of platform influence distribution  
  - Grouped analysis by social platform  

## 🛠️ Usage  
1. **Requirements**: R with `dplyr`, `ggplot2`, `readr`  
2. **Run**:  
   ```R
   install.packages(c("dplyr", "ggplot2", "readr"))
   source("project.R")  # Ensure shopping.csv is in working directory
   ```

## 📊 Sample Output  
![Pie chart showing Facebook dominates shopping influence](outputs/pie_chart.png)  

## 📌 Note  
Dataset not included – replace with your own `shopping.csv` formatted with:  
- `Answer` (social platform names)  
- `Percentage`/`Influenced` (impact metrics)  
- `Segment.Type` (demographic data)  
