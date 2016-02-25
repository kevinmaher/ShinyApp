Shiny App for analysing the airquality Dataset
========================================================
author: Kevin Maher
date: February 24th, 2016

Introduction to the airquality dataset
========================================================

The airquality dataset details the daily air quality 
measurements in New York, May to September 1973.

- It is made up of a data frame with 154 observations on 6 variables

- The six variables are Ozone, Solar Radiation, Wind, Temp, Month & Day

- The data were obtained from the New York State Department of 
Conservation (ozone data) and the National Weather Service (meteorological data).

Introduction to the Shiny App
========================================================

This shinyapp lets you explore the relationship between Ozone and the
five other variables recorded in the airquality dataset. 

- Choose any variable to see a scatter plot of the linear relationship between Ozone and the Chosen Variable. 

    The next slide shows an example of one of the plots - Ozone versus Solar Radiation
    
- Tick the 'Show all...' box to see the summary statistics for the chosen linear relationship.

    The final slide shows an example of the generated statistics for Ozone versus Solar Radiation

ShinyApp Scatter Plot Example - Ozone Versus Solar Radiation(Generated from R)
========================================================

![plot of chunk unnamed-chunk-1](AirQuality-figure/unnamed-chunk-1-1.png)

ShinyApp Summary Statistics Example - Ozone Versus Solar Radiation 
========================================================


```r
library(datasets)
fitmod <- lm(Ozone ~ Solar.R,  data=airquality)
summary(fitmod)   
```

```

Call:
lm(formula = Ozone ~ Solar.R, data = airquality)

Residuals:
    Min      1Q  Median      3Q     Max 
-48.292 -21.361  -8.864  16.373 119.136 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 18.59873    6.74790   2.756 0.006856 ** 
Solar.R      0.12717    0.03278   3.880 0.000179 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 31.33 on 109 degrees of freedom
  (42 observations deleted due to missingness)
Multiple R-squared:  0.1213,	Adjusted R-squared:  0.1133 
F-statistic: 15.05 on 1 and 109 DF,  p-value: 0.0001793
```


