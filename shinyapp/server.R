

# ------------------------------------------------------------------------------
# Server logic of the Shiny application
# ------------------------------------------------------------------------------

# -- Define server function
function(input, output, session) {

  # --------------------------------------
  # Init
  # --------------------------------------

  cat("Starting application server... \n")

  # -- available conditions
  choices <- c("value == 20" = 1, "name == mango" = 2, "id == 1" = 3)
  conditions <- c(rlang::expr(value == 20),
                  rlang::expr(name == "mango"),
                  rlang::expr(id == 1))

  # -- init input
  updateCheckboxGroupInput(inputId = "conditions",
                           choices = choices)

  # --------------------------------------
  # Observe input
  # --------------------------------------

  # -- get the expression(s)
  cond <- reactive(conditions[as.numeric(input$conditions)])

  # -- call module server
  rv <- module_server(id = "test", cond = cond)

  # -- output (table)
  output$filtered_df <- DT::renderDT(rv())

}
