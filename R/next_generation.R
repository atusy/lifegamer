stat_neighbor <- function(x) {
  .nrow <- nrow(x)
  .ncol <- ncol(x)

  up <- rbind(0, x[-.nrow, ])
  down <- rbind(x[-1,], 0)
  right <- cbind(x[, -1], 0)
  left <- cbind(0, x[, -.ncol])

  upright <- cbind(up[, -1], 0)
  upleft <- cbind(0, up[, -.ncol])
  downright <- cbind(down[, -1], 0)
  downleft <- cbind(0, down[, -.ncol])

  down + up + right + left + upright + upleft + downright + downleft
}

birth <- function(x, neighbor = stat_neighbor(x)) {
  (neighbor * (x == 0)) == 3
}

survive <- function(x, neighbor = stat_neighbor(x)) {
  (neighbor %in% c(2, 3)) * x
}

next_generation <- function(x) {
  neighbor <- stat_neighbor(x)
  birth(x, neighbor) + survive(x, neighbor)
}
