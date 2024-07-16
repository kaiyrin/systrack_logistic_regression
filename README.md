# systrack_logistic_regression
This work focuses on the application of supervised learning, specifically logistic regression, in predicting the power health status of machines in the SysTrack platform.  The goal of this study is to utilize supervised learning techniques to predict the power health status of these machines.
This repository contains the code and analysis for applying supervised learning, specifically logistic regression, in predicting the power health status of machines in the SysTrack platform. The SysTrack platform, developed by Lakesake, provides valuable insights into machine performance across different tracks. The dataset used in this analysis is obtained from SysTrack and is of great interest due to its relevance to IoT and operational performance KPIs.

## Dataset

The dataset used in this analysis is the SysTrack Machines Power Consumption data. It includes various features such as CPU, memory, storage, and health, which are automatically captured by the globally deployed machines. The goal of this study is to utilize supervised learning techniques to predict the power health status of these machines.

## Logistic Regression

Logistic regression is a commonly used method for binary classification problems, making it suitable for predicting the power health status (good or bad) of the machines. By analyzing the coefficients of the logistic regression model, we can identify the features that have the greatest impact on the power health status. This information can then be used to make informed decisions regarding machine maintenance and sustainability.

## Assumptions

While no solid hypothesis statements are provided, there are some assumptions regarding the variables that might play a role in predicting power health. These assumptions could contribute to the effectiveness and robustness of the predictive model:

1. Power Consumption: Variables such as power_average_.w., elec_cost_monthly, cooling_cost_monthly, and total_power_cost_monthly might have a significant impact on the power health status. Machines with higher power consumption or cost might be more likely to have poor power health.

2. Operational Time: Variables such as on_time_observed_... and on_time_if_managed_... could be related to power health. Machines that are operational for longer periods might have a higher risk of power health issues.

## Conclusion

This analysis demonstrates the application of logistic regression in predicting the power health status of machines in the SysTrack platform. By understanding the relationship between machine features and power health status, informed decisions can be made regarding machine maintenance and sustainability. The provided assumptions regarding variables can further enhance the effectiveness of the predictive model.

For more details, please refer to the full report and code in this repository.
