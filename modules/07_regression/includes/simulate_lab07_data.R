simulate_lab07_data <- function(n = 80, seed = 330) {
  if (!is.null(seed)) {
    set.seed(seed)
  }

  drought <- runif(n, min = 0, max = 5)
  noise <- rnorm(n, mean = 0, sd = 25)
  yield <- 170 - 12 * drought + noise

  tibble::tibble(
    drought = drought,
    yield = yield
  )
}
