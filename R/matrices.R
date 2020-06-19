zeros <- function(n) rep(list(0L), n)
pad <- function(x, top, right, bottom, left) {
  do.call(
    cbind,
    c(
      zeros(left),
      list(do.call(rbind, c(zeros(top), list(x), zeros(bottom)))),
      zeros(right)
    )
  )
}

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
diehard <- pad(
  cbind(
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
  ),
  5L, 5L, 17L, 7L
)
