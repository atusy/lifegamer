blinker <- matrix(c(
  0, 0, 0, 0, 0,
  0, 0, 1, 0, 0,
  0, 0, 1, 0, 0,
  0, 0, 1, 0, 0,
  0, 0, 0, 0, 0
), nrow = 5, byrow  = TRUE)

frog <- matrix(c(
  0, 0, 0, 0, 0, 0,
  0, 0, 1, 1, 0, 0,
  0, 1, 0, 0, 0, 0,
  0, 0, 0, 0, 1, 0,
  0, 0, 1, 1, 0, 0,
  0, 0, 0, 0, 0, 0
), nrow = 6, byrow = TRUE)

diehard <- matrix(0, nrow = 6, ncol = 10)
diehard[c(9, 15, 16, 34, 38, 40, 46)] <- 1
