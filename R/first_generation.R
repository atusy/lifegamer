#' Available First Generation Kinds
#'
#' A character vector of available pattern kinds for generating the first
#' generation of a cellular automaton grid.
#'
#' @format A character vector with values: "random", "grider", "segment10", "octagon".
#' @export
first_generation_kinds = c("random", "grider", "segment10", "octagon")

#' Generate First Generation for Cellular Automaton
#'
#' Creates the initial state (first generation) of a cellular automaton grid
#' using various predefined patterns.
#'
#' @param kind A character string specifying the type of initial pattern.
#'   One of `first_generation_kinds`: "random", "grider", "segment10", or "octagon".
#' @param ... Additional arguments passed to methods.
#'
#' @return A numeric matrix representing the initial grid state, where 1
#'   indicates a live cell and 0 indicates a dead cell.
#'
#' @examples
#' # Generate a random first generation
#' first_generation("random", nrow = 10, ncol = 10, p = 0.3)
#'
#' # Generate a glider pattern
#' first_generation("grider")
#'
#' # Generate an octagon pattern
#' first_generation("octagon")
#'
#' @export
#' @rdname first_generation
first_generation <- function(kind = first_generation_kinds, ...) {
  UseMethod("first_generation", kind)
}

#' @export
#' @rdname first_generation
first_generation.character <- function(kind = "random", ...) {
  first_generation(structure(kind, class = kind[1L]), ...)
}

#' @param nrow Number of rows in the grid (default: 50).
#' @param ncol Number of columns in the grid (default: 50).
#' @param p Probability of a cell being alive in random generation (0 to 1).
#'
#' @export
#' @rdname first_generation
first_generation.random <- function(kind = "random", nrow = 50, ncol = 50, p = 0.3, ...) {
  x <- 1 * (runif(nrow * ncol) > (1 - p))
  dim(x) <- c(ncol, nrow) # because x will be transposed
  t(x)
}

#' @details
#' The "grider" pattern creates a classic glider in the top-left corner,
#' which moves diagonally across the grid over successive generations.
#'
#' @export
#' @rdname first_generation
first_generation.grider <- function(kind = "grider", nrow = 50, ncol = 50, ...) {
  x <- rep(0L, nrow * ncol)
  dim(x) <- c(nrow, ncol)
  x[1, 1:3] <- c(0, 1, 0)
  x[2, 1:3] <- c(0, 0, 1)
  x[3, 1:3] <- c(1, 1, 1)
  x
}

#' @details
#' The "segment10" pattern creates a horizontal line of 10 live cells
#' centered in an 11x18 grid. This pattern oscillates (blinker behavior).
#'
#' @export
#' @rdname first_generation
first_generation.segment10 <- function(kind = "segment10", ...) {
  nr <- 11
  nc <- 18
  x <- rep(0, nr * nc)
  dim(x) <- c(nr, nc)
  x[6, 5:14] <- 1L
  x
}

#' @details
#' The "octagon" pattern creates an 8x8 octagonal shape, which is a
#' stable "still life" pattern in Conway's Game of Life.
#'
#' @export
#' @rdname first_generation
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

