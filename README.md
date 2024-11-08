# UNESCO Sites and Tourism Arrivals Analysis

This project analyzes the correlation between UNESCO World Heritage sites and tourism arrivals using data from 2007–2018. The analysis explores several hypotheses related to the impact of UNESCO sites on tourism, as well as forecasting future arrivals using machine learning.

## Project Structure

- **Data Cleaning and Preprocessing**:
  - Cleaned and merged the data in Python.
  - Used SQL to gain additional insights before returning to Python for hypothesis testing.
  
- **Hypothesis Testing**:
  - Conducted multiple hypothesis tests to examine the correlation between UNESCO site counts and tourism arrivals, using tools like Pearson and Spearman correlation coefficients and t-tests.
  
- **Tourism Arrivals Forecasting**:
  - Implemented Linear Regression to predict tourism arrivals for 2018.
  - Evaluated model performance with metrics such as Mean Squared Error (MSE), Root Mean Squared Error (RMSE), and R² score.

## Hypotheses Tested

1. **UNESCO Sites and Tourism Arrivals**:
   - H₀: No significant correlation between the number of UNESCO sites and tourism arrivals.
   - H₁: Significant positive correlation between the number of UNESCO sites and tourism arrivals.

2. **Low Tourism Arrivals and Fewer UNESCO Sites**:
   - H₀: No association between lower tourism arrivals and fewer UNESCO sites.
   - H₁: Countries with lower tourism arrivals tend to have fewer UNESCO sites.

3. **Tourism Arrivals Based on UNESCO Site Count**:
   - H₀: No significant difference in tourism arrivals between countries with 10 or more UNESCO sites and those with fewer.
   - H₁: Countries with 10 or more UNESCO sites attract significantly higher tourism arrivals.

4. **Impact of New UNESCO Sites on Tourism**:
   - H₀: No significant increase in tourism arrivals in the year following the announcement of a new UNESCO site.
   - H₁: Tourism arrivals significantly increase in the year following the announcement of a new UNESCO site.

## Key Results

- **Hypothesis 1**: Significant positive correlation between UNESCO sites and tourism arrivals (Pearson’s correlation: 0.7863, p-value: 0.0000).
- **Hypothesis 2**: Significant association between lower tourism arrivals and fewer UNESCO sites (Spearman’s correlation: 0.6794, p-value: 0.0000).
- **Hypothesis 3**: Countries with 10 or more UNESCO sites attract significantly higher tourism arrivals (T-statistic: 4.9610, p-value: 0.0000).
- **Hypothesis 4**: Significant increase in tourism arrivals following the announcement of a new UNESCO site (T-statistic: -7.6707, p-value: 0.0000).

## Forecasting

A Linear Regression model was developed to forecast tourism arrivals for 2018. The model demonstrated strong prediction accuracy with an R² score of 0.996, indicating that 99.6% of the variance in tourism arrivals is explained by the model. The RMSE was 861,401, indicating minimal error considering the high magnitude of the data (tourism arrivals are in the millions).

## Technologies Used

- **Python**: For data cleaning, hypothesis testing, and forecasting.
- **Libraries**: pandas, numpy, scikit-learn, scipy, matplotlib, seaborn.
- **SQL**: Used for additional data analysis and gaining insights.
- **Tableau**: For data visualization and creating an interactive dashboard.

## Presentation Slides

The presentation slides can be accessed [here](https://www.canva.com/design/DAGVzErwUzc/G5FmKI0SA8FEOOVuXLEHwg/view?utm_content=DAGVzErwUzc&utm_campaign=designshare&utm_medium=link&utm_source=editor)
