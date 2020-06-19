#' Toy datasets for lifegame
#'
#' @name datasets

#' @rdname datasets
#' @export
blinker <- matrix(c(
  0, 0, 0, 0, 0,
  0, 0, 1, 0, 0,
  0, 0, 1, 0, 0,
  0, 0, 1, 0, 0,
  0, 0, 0, 0, 0
), nrow = 5, byrow  = TRUE)

#' @rdname datasets
#' @export
frog <- matrix(c(
  0, 0, 0, 0, 0, 0,
  0, 0, 1, 1, 0, 0,
  0, 1, 0, 0, 0, 0,
  0, 0, 0, 0, 1, 0,
  0, 0, 1, 1, 0, 0,
  0, 0, 0, 0, 0, 0
), nrow = 6, byrow = TRUE)

#' @rdname datasets
#' @export
diehard <- cbind(
  matrix(c(
    0, 0,
    1, 1,
    0, 1
  ), ncol = 2, byrow = TRUE),
  0, 0, 0,
  matrix(c(
    0, 1, 0,
    0, 0, 0,
    1, 1, 1
  ), ncol = 3, byrow = TRUE)
)
diehard <- do.call(rbind, c(rep(list(0L), 5L), list(diehard), rep(list(0L), 15L)))
diehard <- cbind(0, 0, 0, 0, 0, 0, 0, diehard, 0, 0, 0, 0, 0)
