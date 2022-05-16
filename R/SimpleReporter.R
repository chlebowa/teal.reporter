#' Simple Reporter User Interface
#' @description three buttons for adding views, downloading and resetting the Report.
#'
#' For more details see the vignette: `vignette("simpleReporter", "teal.reporter")`.
#' @param id `character`
#' @return `shiny::tagList`
#' @export
simple_reporter_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    add_card_button_ui(ns("add_report_card_simple")),
    download_report_button_ui(ns("download_button_simple")),
    reset_report_button_ui(ns("reset_button_simple"))
  )
}

#' Simple Reporter Server
#' @description three buttons for adding views, downloading and resetting the Report.
#' The add module has `add_report_card_simple` id, the download module the `download_button_simple` id
#' and the reset module the `reset_button_simple` id.
#'
#' For more details see the vignette: `vignette("simpleReporter", "teal.reporter")`.
#' @param id `character`
#' @param reporter `Reporter` instance.
#' @param card_fun `function` which returns a `ReportCard` instance,
#' the function have at`card`argument and optional `comment`.
#' @return `shiny::moduleServer`
#' @export
simple_reporter_srv <- function(id, reporter, card_fun) {
  shiny::moduleServer(
    id,
    function(input, output, session) {
      add_card_button_srv("add_report_card_simple", reporter = reporter, card_fun = card_fun)
      download_report_button_srv("download_button_simple", reporter = reporter)
      reset_report_button_srv("reset_button_simple", reporter = reporter)
    }
  )
}