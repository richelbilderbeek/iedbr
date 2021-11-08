#' Convert a `query` to a string
#'
#' Convert a `query` to a string,
#' with one line per key-value pair
#' @inheritParams default_params_doc
#' @return the `query` as a string
#' @examples
#' query_to_str(create_healthy_human_query())
#' @author Richèl J.C. Bilderbeek
#' @export
query_to_str <- function(query) {
  iedbr::check_query(query)
  s <- list()
  n <- length(query)
  for (i in seq_len(n)) {
    s[[i]] <- paste0(names(query)[i], ": ", query[i], ", \n")
  }
  # Get rid of the last comma
  s[[n]] <- stringr::str_replace(s[[n]], ", \n", " \n")
  text <- c(
    "{ \n",
    paste0("  ", unlist(s)),
    "} \n"
  )
  text
}
