#' @export
first_generation_kinds = c("random", "grider", "segment10", "octagon")

#' @export
first_generation <- function(kind = first_generation_kinds, ...) {
  UseMethod("first_generation", kind)
}

#' @export
first_generation.character <- function(kind = "random", ...) {
  first_generation(structure(kind, class = kind[1L]), ...)
}

#' @export
first_generation.random <- function(kind = "random", nrow = 50, ncol = 50, ...) {
  x <- 1 * (runif(nrow * ncol) > (1 - p))
  dim(x) <- c(ncol, nrow) # because x will be transposed
  t(x)
}

#' @export
first_generation.grinder <- function(kind = "grider", nrow = 50, ncol = 50, ...) {
  x <- rep(0L, nrow * ncol)
  dim(x) <- c(nrow, ncol)
  x[1, 1:3] <- c(0, 1, 0)
  x[2, 1:3] <- c(0, 0, 1)
  x[3, 1:3] <- c(1, 1, 1)
  x
}

#' @export
first_generation.segment10 <- function(kind = "segment50", ...) {
  nr <- 11
  nc <- 18
  x <- rep(0, nr * nc)
  dim(x) <- c(nr, nc)
  x[6, 5:14] <- 1L
  x
}

#' @export
first_generation.octagon <- function(kind = "octagon", ...) {
  x <- c(0, 0, 0, 1, 1, 0, 0, 0,
         0, 0, 1, 0, 0, 1, 0, 0,
         0, 1, 0, 0, 0, 0, 1, 0,
         1, 0, 0, 0, 0, 0, 0, 1,
         1, 0, 0, 0, 0, 0, 0, 1,
         0, 1, 0, 0, 0, 0, 1, 0,
         0, 0, 1, 0, 0, 1, 0, 0,
         0, 0, 0, 1, 1, 0, 0, 0)
  dim(x) <- c(8, 8)
  t(x)
}

