#' @importFrom ggplot2 autoplot
#' @export
ggplot2::autoplot

.data <- rlang::.data

#' @export
autoplot.lifegame <- function(x, generation = NULL, ...) {
  ggplot2::ggplot(x[x$generation == max(x$generation), ]) +
    ggplot2::aes(.data$x, .data$y, fill = .data$life) +
    ggplot2::geom_raster() +
    ggplot2::coord_fixed()
}

#' @export
plot.lifegame <- function(x, ...) {
  print(autoplot.lifegame(x, ...))
}

#' @export
animate <- function(x, ...) {
  ggplot2::ggplot(x) +
    ggplot2::aes(.data$x, .data$y, fill = .data$life) +
    ggplot2::geom_raster(show.legend = FALSE) +
    ggplot2::coord_fixed() +
    ggplot2::facet_wrap(~generation, ...) +
    ggplot2::theme_void()
}
