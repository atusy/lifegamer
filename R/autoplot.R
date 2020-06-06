#' @export
ggplot2::autoplot

.data <- rlang::.data

#' @export
autoplot.lifegame <- function(x, ...) {
  ggplot2::ggplot(tidy_lifegame(x, n = 0)) +
    ggplot2::aes(.data$x, .data$y, fill = .data$survive) +
    ggplot2::geom_raster() +
    ggplot2::coord_fixed()
}

animate <- function(x) {
  df <- attr(x, 'results')
  df$n <- max(df$n) - df$n
  ggplot2::ggplot(df) +
    ggplot2::aes(.data$x, .data$y, fill = .data$survive) +
    ggplot2::geom_raster() +
    ggplot2::coord_fixed() +
    #gganimate::transition_states(n)
    ggplot2::facet_wrap(~ n)
}
