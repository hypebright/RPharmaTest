#' Should you take a break?
#'
#' This function takes in three inputs and returns a logical value
#' indicating whether you should take a break.
#'
#' @param weather A character string indicating the weather.
#' @param time A numeric value indicating the time of day.
#' @param workload A numeric value indicating the amount of work you have.
#'
#' @examples
#' take_break(weather = "sunny", time = 10, workload = 3)
#'
#'
#' @return A logical value indicating whether you should take a break.
#'
#' @export

take_break <- function(weather, time, workload) {
  # check if weather is accepted value
  weather <- match.arg(weather, c("sunny", "cloudy", "rainy"))

  # time should be between 0 and 24
  if (time < 0 | time > 24) {
    stop("time should be between 0 and 24")
  }

  # workload should be numeric
  if (!is.numeric(workload)) {
    stop("workload should be numeric")
  }

  # determine whether or not to take a break
  if (weather == "sunny" & time > 10 & workload > 5) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}
