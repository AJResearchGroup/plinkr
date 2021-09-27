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
    unlist(
      strsplit(
        x = string,
        split = " +"
      )
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
  # 1: stri_split_regex(string, pattern, n = n, simplify = simplify,     opts_regex = opts(pattern))
  # 2: stringr::str_split(as.character(string), pattern = pattern, simplify = simplify)
  # 3: doTryCatch(return(expr), name, parentenv, handler)
  # 4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
  # 5: tryCatchList(expr, classes, parentenv, handlers)
  # 6: tryCatch(return(stringr::str_split(as.character(string), pattern = pattern,     simplify = simplify)), error = function(e) {    testthat::expect_true(stringr::str_detect(e$message, "embedded nul in string"))})
  # 7: plinkr::safe_str_split(readr::read_lines(file = ped_filename,     skip_empty_rows = TRUE), pattern = "[:blank:]+", simplify = TRUE)
  # 8: read_plink_ped_file(ped_filename)
  # 9: eval(code, test_env)
  # 10: eval(code, test_env)
  # 11: withCallingHandlers({    eval(code, test_env)    if (!handled && !is.null(test)) {        skip_empty()    }}, expectation = handle_expectation, skip = handle_skip, warning = handle_warning,     message = handle_message, error = handle_error)
  # 12: doTryCatch(return(expr), name, parentenv, handler)
  # 13: tryCatchOne(expr, names, parentenv, handlers[[1L]])
  # 14: tryCatchList(expr, names[-nh], parentenv, handlers[-nh])
  # 15: doTryCatch(return(expr), name, parentenv, handler)
  # 16: tryCatchOne(tryCatchList(expr, names[-nh], parentenv, handlers[-nh]),     names[nh], parentenv, handlers[[nh]])
  # 17: tryCatchList(expr, classes, parentenv, handlers)
  # 18: tryCatch(withCallingHandlers({    eval(code, test_env)    if (!handled && !is.null(test)) {        skip_empty()    }}, expectation = handle_expectation, skip = handle_skip, warning = handle_warning,     message = handle_message, error = handle_error), error = handle_fatal,     skip = function(e) {    })
  # 19: test_code(desc, code, env = parent.frame(), reporter = reporter)
  # 20: test_that("read PLINK tutorial files", {    expect_equal(1 + 1, 2)    if (!is_plink_tutorial_data_installed())         return()    ped_filename <- stringr::str_subset(get_plink_tutorial_data_filenames(),         "hapmap1.ped")    t <- read_plink_ped_file(ped_filename)}
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
    if (verbose) {
      message(i)
    }
    i <- i + 1
  }
}
