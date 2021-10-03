#' Call \link[stringr]{str_split} safely
#' stringi::stri_split_regex **sometimes** gives an
#' 'embedded nul in string' error.
#' This has been not been reported, yet a similar report is at
#' https://github.com/gagolews/stringi/issues/458 .
#' Until then, use the workaround
#' @param string one or more strings
#' @export
safe_str_split <- function(
  string
) {
  return(
    stringr::str_split(
      string,
      pattern = "[:blank:]+",
      simplify = TRUE
    )
  )

  stop("Old code")

  # See the stringr code below
  split_strs <- strsplit(
    x = string,
    split = "( |\\t)+"
  )
  n_rows <- length(split_strs)
  n_cols <- length(split_strs[[1]])
  return(
    matrix(
      data = unlist(split_strs),
      nrow = n_rows,
      ncol = n_cols,
      byrow = TRUE
    )
  )
  # Don't use stringr, nor stringi, as it may give a segfault,
  # for example, running the test 'read PLINK tutorial files':
  #
  # *** caught segfault ***
  #   address 0x55ed911eb200, cause 'memory not mapped'
  #
  # Traceback:
  #
  # 1: stri_split_regex(string, pattern, n = n, simplify = simplify,     opts_regex = opts(pattern)) # nolint this is no commented code
  # 2: stringr::str_split(as.character(string), pattern = pattern, simplify = simplify) # nolint this is no commented code
  # 3: doTryCatch(return(expr), name, parentenv, handler) # nolint this is no commented code
  # 4: tryCatchOne(expr, names, parentenv, handlers[[1L]]) # nolint this is no commented code
  # 5: tryCatchList(expr, classes, parentenv, handlers) # nolint this is not commented code
  # 6: tryCatch(return(stringr::str_split(as.character(string), pattern = pattern,     simplify = simplify)), error = function(e) {    testthat::expect_true(stringr::str_detect(e$message, "embedded nul in string"))}) # nolint this is no commented code
  # 7: plinkr::safe_str_split(readr::read_lines(file = ped_filename,     skip_empty_rows = TRUE), pattern = "[:blank:]+", simplify = TRUE) # nolint this is no commented code
  # 8: read_plink_ped_file(ped_filename) # nolint this is no commented code
  # 9: eval(code, test_env) # nolint this is no commented code
  # 10: eval(code, test_env) # nolint this is no commented code
  # 11: withCallingHandlers({    eval(code, test_env)    if (!handled && !is.null(test)) {        skip_empty()    }}, expectation = handle_expectation, skip = handle_skip, warning = handle_warning,     message = handle_message, error = handle_error) # nolint this is no commented code
  # 12: doTryCatch(return(expr), name, parentenv, handler) # nolint this is not commented code
  # 13: tryCatchOne(expr, names, parentenv, handlers[[1L]]) # nolint this is no commented code
  # 14: tryCatchList(expr, names[-nh], parentenv, handlers[-nh]) # nolint long line indeed
  # 15: doTryCatch(return(expr), name, parentenv, handler) # nolint this is not commented code
  # 16: tryCatchOne(tryCatchList(expr, names[-nh], parentenv, handlers[-nh]),     names[nh], parentenv, handlers[[nh]]) # nolint this is no commented code
  # 17: tryCatchList(expr, classes, parentenv, handlers) # nolint this is not commented code
  # 18: tryCatch(withCallingHandlers({    eval(code, test_env)    if (!handled && !is.null(test)) {        skip_empty()    }}, expectation = handle_expectation, skip = handle_skip, warning = handle_warning,     message = handle_message, error = handle_error), error = handle_fatal,     skip = function(e) {    }) # nolint indeed a long line
  # 19: test_code(desc, code, env = parent.frame(), reporter = reporter) # nolint this is not commented code
  # 20: test_that("read PLINK tutorial files", {    expect_equal(1 + 1, 2)    if (!is_plink_tutorial_data_installed())         return()    ped_filename <- stringr::str_subset(get_plink_tutorial_data_filenames(),         "hapmap1.ped")    t <- read_plink_ped_file(ped_filename)} # nolint indeed a long line

  if (1 == 2) {
    i <- 1
    while (i < 100) {
      tryCatch(
        return(
          stringr::str_split(
            as.character(string),
            pattern = "[:blank:]+",
            simplify = TRUE
          )
        ),
        error = function(e) {
          testthat::expect_true(
            stringr::str_detect(e$message, "embedded nul in string"))
        }
      )
      message(i)
      i <- i + 1
    }
  }
}
