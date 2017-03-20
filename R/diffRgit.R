#' Create an HTML git diff widget using the diff2html library
#'
#' This function create an HTML widget to diplay a graphic view of a 'git diff' result.
#'
#' @param diff the result of a 'git diff'
#' @param inputFormat the format of the input data: 'diff' or 'json', default is 'diff'
#' @param outputFormat the format of the output data: 'line-by-line' or 'side-by-side', default is 'side-by-side'
#' @param showFiles boolean to display or not the header with files changed, default is FALSE
#' @param matching matching level: 'lines' for matching lines, 'words' for matching lines and words or 'none', default is 'none'
#' @param synchronisedScroll scroll both panes in side-by-side mode: TRUE or FALSE, default is TRUE
#' @param matchWordsThreshold similarity threshold for word matching, default is 0.25
#' @param matchingMaxComparisons perform at most this much comparisons for line matching a block of changes, default is 2500
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
#' l_diff <- "diff --git a/../diff2widget/file1 b/../diff2widget/file2\nindex ab63d51..eb01961 100644\n--- a/../diff2widget/file1\n+++ b/../diff2widget/file2\n@@ -1,5 +1,4 @@\n-hello!\n+hello world!\n Where is Bryan?\n+Bryan is in the kitchen.\n bye!\n-\n-oups!"
#' diffRgit(l_diff)
#'
#' #see diff line by line
#' diffRgit(l_diff, outputFormat = 'line-by-line')
#'
#' #remove header
#' diffRgit(l_diff, showFiles = FALSE)
#'
#' @import htmlwidgets
#'
#' @export
diffRgit <- function(diff, inputFormat = 'diff', outputFormat = 'side-by-side',
                     showFiles = TRUE, matching = "none", synchronisedScroll = TRUE,
                     matchWordsThreshold = 0.25, matchingMaxComparisons = 2500,
                     width = NULL, height = NULL, elementId = NULL) {

  # create a list that contains the settings
  settings <- list(
    inputFormat = inputFormat,
    outputFormat = outputFormat,
    showFiles = showFiles,
    matching = matching,
    synchronisedScroll = synchronisedScroll,
    matchWordsThreshold = matchWordsThreshold,
    matchingMaxComparisons = matchingMaxComparisons
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
