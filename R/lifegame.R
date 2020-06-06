first_gen <- function(nrow=10, ncol=10, p = 0.4) {
  matrix(1 * (runif(nrow * ncol) > (1 - p)), nrow = nrow, ncol = ncol)
}

lifegame <- function(input=first_gen(), n = 1, ...) {
  UseMethod("lifegame")
}

lifegame.default <- function(input=first_gen(), n = 1, ...) {
  n <- as.integer(n)
  class(input) <- c(n, "integer", "matrix")
  n <- (n - 1L) * (n > 0L)
  lifegame(
    structure(
      next_generation(input),
      class = c(n, "lifegame", "matrix"),
      results = rbind(attributes(input)$results, tidy_lifegame(input, n))
    ),
    n
  )
}

lifegame.0 <- function(input, n, ...) {
  structure(
    input,
    results = rbind(attributes(input)$results, tidy_lifegame(input, n - 1)),
    class = c("lifegame", "matrix")
  )
}

tidy_lifegame <- function(input, n) {
  df <- expand.grid(y = 1:nrow(input), x = 1:ncol(input))
  df$survive <- c(input[nrow(input):1, ])
  df$n <- n
  df
}

