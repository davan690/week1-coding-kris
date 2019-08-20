This repository contains the resources needed for the statistics coding sessions at the University of Canberra. The first dataset looks at the effect of ticks on running speed of lizards. 

## Contributors

Kris Wilde and Anthony Davidson

## Packages needed

```r
# install.packages("car")
# car
# compute.es
# effects
# ggplot2
# multcomp
# pastecs
# WRS2
```

## Import data

Import tick data

```r
tick <- read.csv("./data/tickdata.csv",header=T)
glimpse(tick)
#> Observations: 51
#> Variables: 13
#> $ ï..Site            <fct> R, R, R, R, R, R, R, R, R, C, C, C, C, C, C...
#> $ Sex                <fct> M, M, M, M, M, M, M, M, M, M, M, M, M, M, M...
#> $ SVL                <int> 46, 66, 68, 55, 65, 63, 58, 64, 62, 64, 71,...
#> $ TL                 <int> 69, 93, 99, 80, 49, 96, 90, 100, 66, 89, 74...
#> $ HLL                <int> 35, 44, 46, 40, 44, 46, 39, 44, 42, 42, 50,...
#> $ Mass               <dbl> 3.25, 10.00, 10.75, 5.75, 9.00, 9.50, 7.25,...
#> $ Ticks              <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0...
#> $ Max_25cm           <dbl> 2.070, 2.849, 2.687, 2.655, 2.652, 2.668, 2...
#> $ Max_2m             <dbl> 1.830, 1.934, 1.886, 1.839, 1.985, 1.783, 1...
#> $ Yes1N0             <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0...
#> $ Residuals_Mass_OLS <dbl> -0.01090481, -0.68025639, -0.67219155, -0.8...
#> $ Log_SVL            <dbl> 1.662758, 1.819544, 1.832509, 1.740363, 1.8...
#> $ Log._Mass          <dbl> 0.5118834, 1.0000000, 1.0314085, 0.7596678,...
```

### Raw data table


```r
kableExtra::kable(head(tick))
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> ï..Site </th>
   <th style="text-align:left;"> Sex </th>
   <th style="text-align:right;"> SVL </th>
   <th style="text-align:right;"> TL </th>
   <th style="text-align:right;"> HLL </th>
   <th style="text-align:right;"> Mass </th>
   <th style="text-align:right;"> Ticks </th>
   <th style="text-align:right;"> Max_25cm </th>
   <th style="text-align:right;"> Max_2m </th>
   <th style="text-align:right;"> Yes1N0 </th>
   <th style="text-align:right;"> Residuals_Mass_OLS </th>
   <th style="text-align:right;"> Log_SVL </th>
   <th style="text-align:right;"> Log._Mass </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> R </td>
   <td style="text-align:left;"> M </td>
   <td style="text-align:right;"> 46 </td>
   <td style="text-align:right;"> 69 </td>
   <td style="text-align:right;"> 35 </td>
   <td style="text-align:right;"> 3.25 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2.070 </td>
   <td style="text-align:right;"> 1.830 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -0.0109048 </td>
   <td style="text-align:right;"> 1.662758 </td>
   <td style="text-align:right;"> 0.5118834 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R </td>
   <td style="text-align:left;"> M </td>
   <td style="text-align:right;"> 66 </td>
   <td style="text-align:right;"> 93 </td>
   <td style="text-align:right;"> 44 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2.849 </td>
   <td style="text-align:right;"> 1.934 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -0.6802564 </td>
   <td style="text-align:right;"> 1.819544 </td>
   <td style="text-align:right;"> 1.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R </td>
   <td style="text-align:left;"> M </td>
   <td style="text-align:right;"> 68 </td>
   <td style="text-align:right;"> 99 </td>
   <td style="text-align:right;"> 46 </td>
   <td style="text-align:right;"> 10.75 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2.687 </td>
   <td style="text-align:right;"> 1.886 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -0.6721915 </td>
   <td style="text-align:right;"> 1.832509 </td>
   <td style="text-align:right;"> 1.0314085 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R </td>
   <td style="text-align:left;"> M </td>
   <td style="text-align:right;"> 55 </td>
   <td style="text-align:right;"> 80 </td>
   <td style="text-align:right;"> 40 </td>
   <td style="text-align:right;"> 5.75 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2.655 </td>
   <td style="text-align:right;"> 1.839 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -0.8496130 </td>
   <td style="text-align:right;"> 1.740363 </td>
   <td style="text-align:right;"> 0.7596678 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R </td>
   <td style="text-align:left;"> M </td>
   <td style="text-align:right;"> 65 </td>
   <td style="text-align:right;"> 49 </td>
   <td style="text-align:right;"> 44 </td>
   <td style="text-align:right;"> 9.00 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2.652 </td>
   <td style="text-align:right;"> 1.985 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -1.3092888 </td>
   <td style="text-align:right;"> 1.812913 </td>
   <td style="text-align:right;"> 0.9542425 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> R </td>
   <td style="text-align:left;"> M </td>
   <td style="text-align:right;"> 63 </td>
   <td style="text-align:right;"> 96 </td>
   <td style="text-align:right;"> 46 </td>
   <td style="text-align:right;"> 9.50 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2.668 </td>
   <td style="text-align:right;"> 1.783 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -0.0673537 </td>
   <td style="text-align:right;"> 1.799341 </td>
   <td style="text-align:right;"> 0.9777236 </td>
  </tr>
</tbody>
</table>

### Plot data

```r
plot(x = tick$HLL,
     y = tick$Max_2m,
     col = tick$Yes1N0,
     pch = 5,
     xlab = "HLL"
     ,ylab = "m/s")
```

![First basic figure for the relationhip we are interested in.]