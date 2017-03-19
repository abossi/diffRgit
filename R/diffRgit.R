#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
diffRgit <- function(diff, inputFormat = 'diff', outputFormat = 'side-by-side', showFiles = TRUE, matching = "lines", width = NULL, height = NULL, elementId = NULL) {
  
  # create a list that contains the settings
  settings <- list(
    inputFormat = inputFormat,
    outputFormat = outputFormat,
    showFiles = showFiles,
    matching = matching
  )
  
  # forward options using x
  x = list(
    diff = diff,
    settings = settings
  )
  
  # create widget
  htmlwidgets::createWidget(
    name = 'diffRgit',
    x,
    width = width,
    height = height,
    package = 'diffRgit',
    elementId = elementId
  )
}

#' Shiny bindings for diffRgit
#'
#' Output and render functions for using diffRgit within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a diffRgit
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name diffRgit-shiny
#'
#' @export
diffRgitOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'diffRgit', width, height, package = 'diffRgit')
}

#' @rdname diffRgit-shiny
#' @export
renderDiffRgit <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, diffRgitOutput, env, quoted = TRUE)
}
