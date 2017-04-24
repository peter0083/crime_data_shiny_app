# crime_data_shiny_app
a visualization exercise using R Shiny app

Please note that this shiny app is not yet optimized for mobile users.


Link to web app: [https://peter0083.shinyapps.io/crimedataviz/](https://peter0083.shinyapps.io/crimedataviz/)

| Considerations                   | Reasoning                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Overall goal of this shiny app   | The goal is to create a simple interactive plot to find trends in normalized crime data over time in selected US cities. Considering the growing tech demand in the US, this visualization tool will be useful for those who wish to relocate to major cities where most data science openings are present. The US marshall data set includes many cities. To create a more focused subset for tech job seekers to find a city with low crime rate, 10 cities that have the most job openings are selected based on the report released by Glassdoor.com in 2016.  |
| Scatter plot                     | Scatter plot expresses two quantitative attributes in the data. In the graph, year and crime per 100k people are the two quantitative attributes. Magnitude channels of horizontal and vertical position encode the quantitative attributes `crime per 100k people` and `year` in point marks. Point mark encodes a crime rate at a particular year. Scatter plot is effective in finding trends in data. Categorical attribute `city` is encoded using color hue. Each city has its own color.                                                                    |
| Line chart                       | Line chart encodes one quantitative attribute `crime per 100k people` and one ordered key attribute `year`. Points are a mark of the line chart that each point encodes a crime rate at a particular year. Line connection marks to link between points. A line chart is an effective visualization to help users in identifying trends.                                                                                                                                                                                                                           |
| Change parameters                | 5 different widgets are incorporated into the shiny app to assist users in viewing the plots in parameters of their choice. Although widgets take up screen space, the advantages of widgets are clear affordances and self-documenting with labels. The widgets in this shiny app have pre-defined choices to minimize user making erraneous inputs.                                                                                                                                                                                                              |
| Slider widget                    | Slider widget allows the user to indicate a range of years from the data set. Once the user specifies the range, the x-axis of the graph will change. It allows developers to set a default value as well. Date range and date input widgets are not as effective in this case because they do not display any visual information the maximum and minimum year range permitted in this data set. There are several ways a user can enter a date (ie. YYYY-MM-DD or DD/MM/YYYY). These variations may result in input errors.                                       |
| Select box widget                | The select box widget creates a drop down menu with pre-defined choices for 5 types of crime, and two cities. It allows developers to set a default value as well.                                                                                                                                                                                                                                                                                                                                                                                                 |
| Numeric input widget             | The numeric input widget has clickable buttons to increase the numeric value by a preset interval. It allows developers to set a default value as well.                                                                                                                                                                                                                                                                                                                                                                                                            |
| Checkbox widget                  | The choice of color vision deficiency adjustment is available for users to enable. Once enabled, the colors will be adjusted using `viridis` package.                                                                                                                                                                                                                                                                                                                                                                                                              |
| Radio button widget              | User can specify the graph type by clicking the two radio buttons: scatter plot or line chart.                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| Main panel/side bar panel layout | All parameter-changing widgets are grouped on the side bar panel for simplicity. Some additional interactive features are placed under the plot output in the main panel.                                                                                                                                                                                                                                                                                                                                                                                          |
| Graph title colour feature       | A font colour selector feature is present for users to pick a colour for graph title.                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Click/double click feature       | Click and double-click features are added to allow users to compare any two points of interest for a more accurate comparison in addition to overall trend observation.                                                                                                                                                                                                                                                                                                                                                                                            |


##### dependency information

```{r}
R version 3.3.2 (2016-10-31)
Platform: x86_64-apple-darwin13.4.0 (64-bit)
Running under: macOS Sierra 10.12.3

locale:
[1] en_CA.UTF-8/en_CA.UTF-8/en_CA.UTF-8/C/en_CA.UTF-8/en_CA.UTF-8

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] ggmap_2.7       gapminder_0.2.0 viridis_0.3.4   cowplot_0.7.0   readr_1.1.0     ggplot2_2.2.1   gganimate_0.1   dplyr_0.5.0     devtools_1.12.0
[10] shiny_1.0.0    

loaded via a namespace (and not attached):
 [1] Rcpp_0.12.8       plyr_1.8.4        base64enc_0.1-3   bitops_1.0-6      tools_3.3.2       digest_0.6.12     evaluate_0.10     jsonlite_1.2     
 [9] memoise_1.0.0     tibble_1.2        gtable_0.2.0      lattice_0.20-34   png_0.1-7         DBI_0.5-1         mapproj_1.2-4     yaml_2.1.14      
[17] proto_1.0.0       gridExtra_2.2.1   knitr_1.15.1      stringr_1.1.0     withr_1.0.2       maps_3.1.1        RgoogleMaps_1.4.1 hms_0.3          
[25] rprojroot_1.1     grid_3.3.2        R6_2.2.0          jpeg_0.1-8        rmarkdown_1.3     animation_2.5     RJSONIO_1.3-0     sp_1.2-4         
[33] reshape2_1.4.2    magrittr_1.5      backports_1.0.4   scales_0.4.1      htmltools_0.3.5   rsconnect_0.7     assertthat_0.1    mime_0.5         
[41] xtable_1.8-2      colorspace_1.3-2  geosphere_1.5-5   httpuv_1.3.3      labeling_0.3      stringi_1.1.2     RCurl_1.95-4.8    lazyeval_0.2.0   
[49] munsell_0.4.3     rjson_0.2.15  
```
