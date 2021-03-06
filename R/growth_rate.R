#' Calculate exponential growth rate
#'
#' @param p1 Value in period 1
#' @param p2 Value in period 2
#' @param t1 Time step for period 1 (i.e., 2010)
#' @param t2 Time step for period 2 (i.e., 2040)
#'
#' @details This function calculates an annualized exponential growth rate
#'   implied by measuring a value in two different time periods. Solves the
#'   elementary exponential growth equation, \deqn{p_2 = p_1 e^{r(t_2 - t_1)}}
#'   for \eqn{r}.
#'
#' @export
#' @examples
#' calc_exprate(10, 12, 2010, 2040)
calc_exprate <- function(p1, p2, t1, t2){
  # p2 = p1e^{r(t2 - t1)}

  (log(p2) - log(p1)) / (t2 - t1)
}


#' Exponentially interpolate around two data points
#'
#' @inheritParams calc_exprate
#' @param t0 The timepoint for interpolation (or extrapolation)
#'
#' @details This function first calculates the implied exponential growth rate
#'   between two points, and then predicts where the function would be in the
#'   intermediate year.
#'
#' @seealso calc_exprate
#'
#' @export
#' @examples
#' interpolate_exponential(10, 12, 2010, 2040, 2020)
#' interpolate_exponential(10, 12, 2010, 2040, 2008)
interpolate_exponential <- function(p1, p2, t1, t2, t0){
  # get implied growth rate
  r <- calc_exprate(p1, p2, t1, t2)

  # calculate new value at t0
  p1 * exp(r * (t0 - t1))
}
