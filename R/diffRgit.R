#' Create an HTML git diff widget using the diff2html library
#'
#' This function create an HTML widget to diplay a graphic view of a 'git diff' result.
#'
#' @param diff the result of a 'git diff'
#' @param inputFormat 'diff' or 'json'
#' @param outputFormat 'side-by-side' or 'line-by-line'
#' @param showFiles boolean to display or not the header with files changed
#' @param matching 'lines' or 'words'
#' @param width width of the widget
#' @param height height of the widget
#' @param elementId ID of the widget div
#'
#' @note All parameters are directly send to diff2html function to be compatible with futures versions.
#'
#' @references See \url{https://diff2html.xyz} for more informations.
#'
#' @examples
#' library(diffRgit)
#'
#' #get git diff with system('git diff file1 file2", intern = TRUE) instead
#' diff <- "diff --git a/README.md b/README.md\r\nindex 132c8a2..46909f2 100644\r\n--- a/README.md\r\n+++ b/README.md\r\n@ -98,6 +98,9 @ The HTML output accepts a Javascript object with configuration. Possible options\r\n   - `synchronisedScroll`: scroll both panes in side-by-side mode: `true` or `false`, default is `false`\r\n   - `matchWordsThreshold`: similarity threshold for word matching, default is 0.25\r\n   - `matchingMaxComparisons`: perform at most this much comparisons for line matching a block of changes, default is `2500`\r\n+  - `templates`: object with previously compiled templates to replace parts of the html\r\n+  - `rawTemplates`: object with raw not compiled templates to replace parts of the html\r\n+  > For more information regarding the possible templates look into [src/templates](https://github.com/rtfpessoa/diff2html/tree/master/src/templates)\r\n \r\n ## Diff2HtmlUI Helper"
#' diffRgit(diff)
#'
#' #see diff line by line
#' diffRgit(diff, outputFormat = 'line-by-line')
#'
#' #remove header
#' diffRgit(diff, showFiles = FALSE)
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
