update_class <- function(x, n) {
  class(x) <- c(c("continue", "end")[c(n > 0L, TRUE)][1L], "matrix")
  x
}

#' Lifegame
#'
#' @param input An matrix composed of `0L` and `1L`.
#' @param n Number of generations to calculate.
#' @param ... Other parameters passed down to methods
#'
#' @return A lifegame class `data.frame` with 4 integer columns.
#'  The `x` and `y` columns indicate their coordinates.
#'  The `generation` column indicates n-th generation of lifegame.
#'  The `life` column indicates if the cell is dead (`0`) or alive (`1L`).
#'
#' @export
lifegame <- function(input = first_generation(), n = 1, ...) {
  UseMethod("lifegame", input)
}

#' @export
lifegame.matrix <- function(input = first_generation(), n = 1, ...) {
  n <- as.integer(n) - 1L
  lifegame(update_class(input, n), n = n, tidy_results = tidy(input, n))
}

#' @export
lifegame.continue <- function(input = first_generation(), n = 1, tidy_results = NULL, ...) {
  n <- n - 1L
  output <- next_generation(input)
  lifegame(
    update_class(output, n),
    n = n,
    tidy_results = rbind(tidy_results, tidy(output, n))
  )
}

#' @export
lifegame.end <- function(input, n, tidy_results, ...) {
  tidy_results$generation <-
    max(tidy_results$generation) - tidy_results$generation + 1L
  class(tidy_results) <- c("lifegame", class(tidy_results))
  tidy_results
}

tidy <- function(input, n) {
  nx <- ncol(input)
  ny <- nrow(input)
  x <- 1L:nx
  y <- 1L:ny

  data.frame(
    x = rep(x, each = ny),
    y = rep.int(y, times = nx),
    generation = n,
    life = c(input[ny:1L, ])
  )
}

