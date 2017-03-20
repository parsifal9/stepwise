#stepwise

##Several function for doing stepwise linear regression in R.

Based on an original function by  Paul A. Rubin which was written for teaching purposes 
(see his comments at http://orinanobworld.blogspot.com.au/2011/02/stepwise-regression-in-r.html).

I have added two other functions, forward.stepwise.Bonferroni() and forward.stepwise.FDR(),
which do forward stepwise model selection with respectively a Bonferroni and False Discovery rate stopping rule.
My interest in doing this was to replicate some of the work in 
David Donoho and Victoria Stodden *Breakdown point of model selection when the number of variables exceeds the number of observations,*
IEEE International Joint Conference on Neural Network Proceedings, 2006, pp 1916-1921.

A Matlab library is provided by the authors but I felt more comfortable working in R.

To install the package in R, first check if you have the libraries
````
library("R.rsp")
library("devtools")
````
if not
````
install.packages("R.rsp")
install.packages("devtools")
````
then
````
library("devtools")
install_github("parsifal9/stepwise")
library(stepwise)
````

To see the plots exploring the breakdown point type
````
vignette("donoho_tanner_change")
````

