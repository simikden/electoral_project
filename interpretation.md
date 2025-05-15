## Descriptive Statistics: 
 
<img width="328" alt="image" src="https://github.com/user-attachments/assets/cd35c54e-a317-40f0-aa33-35b7051a33d7" />

## Regression results: 


<img width="276" alt="image" src="https://github.com/user-attachments/assets/3793e466-f9f2-42e3-9456-580b8dc982ad" />
 
1. Are there any statistically significant independent variables in the regression?

- There are two statistically significant independent variables in the regression: Turnout and Invalid Share

2. What is the direction of relationship between each of the independent variables and dependent
variable?

- Between Edinaya_rasiya and Turnout there is a positive direction of relationship
- Between Edinaya_rasiya and Share_inValid there is a negative direction of relationship

3. What is the predictive capability of the model?

- “Multiple R-squared:  0.1079, Adjusted R-squared:  0.104” so the share of variability of the model is about 10,4%-10,8%

4. What does F-statistic say about the model’s characteristics?

- p-value: 5.483e-12 < 0.05 so the model has predictive capability




## Problems check

**1. Multicollinearity**

<img width="198" alt="image" src="https://github.com/user-attachments/assets/9dbad4e6-4ce2-41d5-9e56-675c1782a3db" />
 
Brief interpretation:  nothing is greater than 10 so there is no multicollinearity

**2. Heteroscedasticity**

 <img width="291" alt="image" src="https://github.com/user-attachments/assets/ffb67a92-7ee5-46a2-8fc2-0f18ef25e998" />

Brief interpretation: TEST:  p = < 2.22e-16 (<0.05) so the problem exists and it hinders the model’s characteristics | PLOT: the blue dashed trendline going up and pink reference line varying SO there is might be a problem of heteroscedasticity

Visualization:
 
  <img width="400" alt="image" src="https://github.com/user-attachments/assets/ed44dc6d-4ef7-4ea0-8576-a85abe6c43cf" />

**3. Outliers**

 <img width="291" alt="image" src="https://github.com/user-attachments/assets/afe6e0e9-9d45-4e1e-8b9f-aa75fcfb61b9" />

Brief interpretation: outliers are in the lines 341, 182, 195 because their Bonferroni p -value< 0.05

**4. Influential observations**

Brief interpretation: no influential observations in the graph because none of them is greater than 1
Visualization: 
 
<img width="360" alt="image" src="https://github.com/user-attachments/assets/e9efa91a-20b3-46c9-b2da-5945c0fa7dd4" />




**5. Interaction effect**
 <img width="401" alt="image" src="https://github.com/user-attachments/assets/e0b75fb2-0a44-4a11-b950-e23e9b7a390d" />

Brief interpretation: no interaction effect because p-value for “Share_inValid:Turnout”  is 0.375 > 0.05 so we can not reject the hypothesis 0  




## [Plot 1. Histograms combined in one line]  

<img width="458" alt="image" src="https://github.com/user-attachments/assets/d87ebb1b-7ee4-44fd-ad4c-07bed52d0bad" />

## [Plot 2. Graph combining boxplots]

 <img width="431" alt="image" src="https://github.com/user-attachments/assets/ec83bec6-5b4c-4102-9fa9-5c44fe2bef20" />



## [Plot 3. 5 unified scatterplots] 
 
 <img width="391" alt="image" src="https://github.com/user-attachments/assets/0753e1c8-44ca-40ed-9a28-a9bac2c26390" />

## [Plot 6. Q-Q plot]
 
 <img width="384" alt="image" src="https://github.com/user-attachments/assets/e9641bd4-7396-443f-b2d4-88feca1b2e3d" />

Brief interpretation: we can assume about the presence of problem because of points which are out of the confidence field

## [Plot 7. crPlots]
 
<img width="468" alt="image" src="https://github.com/user-attachments/assets/84d706f8-aea8-4fc3-823f-df1b8e1debf0" />

Brief interpretation: trendlines are not matching so there might be a problem of non-linear relationship between the IV and DV
