stepwise

Several function for doing stepwise linear regression in R.

Based on an original function by  Paul A. Rubin whihc was written for teaching purposes 
(see his comments at http://orinanobworld.blogspot.com.au/2011/02/stepwise-regression-in-r.html).

I have added two other functions, forward.stepwise.Bonferroni() and forward.stepwise.FDR().
which do forward stepwise model selection with respectively a Bonferroni and False Doiscovery rate stopping rule.
My interest in doing this was to replicate some of the work in Donoho and Stodden (2006).
A Matlab library is provided by the authors but I felt more comfortable working in R.




@InProceedings{Donoho.and.Stodden.2006,
  Title                    = {Breakdown point of model selection when the number of variables exceeds the number of observations},
  Author                   = {Donoho, David and Stodden, Victoria},
  Booktitle                = {The 2006 IEEE International Joint Conference on Neural Network Proceedings},
  Year                     = {2006},
  Organization             = {IEEE},
  Pages                    = {1916-1921}
}
