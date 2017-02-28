
## Evaluates the rank biased overlap (rbo) of two ranked lists based
## on formula based on (32) from "A Similarity Measure for Indefinite
## Rankings" (Webber et al.). Two ranked lists with high rbo are very
## similar, wheras low rbo indicates dissimilar lists. rbo ranges
## between 0 and 1. 

## Usage:

##      rbo(s, t, p, k = floor(max(length(s), length(t))/2), side = c("top",
##        "bottom"), mid = NULL, uneven.lengths = TRUE)
     
## Arguments:

##        s: List 1

##        t: List 2

##        p: Weighting parameter in [0, 1]. High p implies strong emphasis
##           on top ranked elements

##        k: Evaluation depth for extrapolation

##     side: Evaluate similarity between the top or the bottom of the
##           ranked lists

##      mid: Set the mid point to for example only consider positive or
##           negative scores

## uneven.lengths: Indicator if lists have uneven lengths

rbo <- function(s, t, p, k=floor(max(length(s), length(t))/2), side=c("top", "bottom"), mid=NULL, uneven.lengths = TRUE) {
  side <- match.arg(side)
  if (!is.numeric(s) | !is.numeric(t))
    stop("Input vectors are not numeric.")
  if (is.null(names(s)) | is.null(names(t)))
    stop("Input vectors are not named.")
  ids <- switch(side,
                "top"=list(s=select.ids(s, "top", mid), t=select.ids(t, "top", mid)),
                "bottom"=list(s=select.ids(s, "bottom", mid), t=select.ids(t, "bottom", mid))
  )
  min(1, rbo.ext(ids$s, ids$t, p, k, uneven.lengths = uneven.lengths))
}


select.ids <- function(x, side=c("top", "bottom"), mid=NULL) {
  side <- match.arg(side)
  if (side == "top")  {
    x <- sort(x, decreasing=TRUE)
    if (is.null(mid))
      return(names(x))
    else 
      return(names(x)[which(x > mid)])
  } else if (side == "bottom") {
    x <- sort(x, decreasing=FALSE)
    if (is.null(mid)) 
      return(names(x))
    else 
      return(names(x)[which(x < mid)])
  }
}

rbo.ext <- function(x, y, p, k, uneven.lengths = TRUE) {
  if (length(x) <= length(y)) {
    S <- x
    L <- y
  } else {
    S <- y
    L <- x
  }
  l <- min(k, length(L))
  s <- min(k, length(S))
  
  if (uneven.lengths) {
    Xd <- sapply(1:l, function(i) length(intersect(S[1:i], L[1:i])))
    ((1-p) / p) *
      ((sum(Xd[seq(1, l)] / seq(1, l) * p^seq(1, l))) +
         (sum(Xd[s] * (seq(s+1, l) - s) / (s * seq(s+1, l)) * p^seq(s+1, l)))) +
      ((Xd[l] - Xd[s]) / l + (Xd[s] / s)) * p^l  
  } else {
    #stopifnot(l == s)
    k <- min(s, k)
    Xd <- sapply(1:k, function(i) length(intersect(x[1:i], y[1:i])))
    Xk <- Xd[k]
    (Xk / k) * p^k + (((1-p)/p) * sum((Xd / seq(1,k)) * p^seq(1,k)))
  }
}

