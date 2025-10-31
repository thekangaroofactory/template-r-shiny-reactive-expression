

# ------------------------------------------------------------------------------
# Module Server logic
# ------------------------------------------------------------------------------

module_server <- function(id, cond = NULL) {
  moduleServer(id, function(input, output, session) {

    # --------------------------------------
    # Init
    # --------------------------------------

    MODULE <- paste0("[", id, "]")
    cat(MODULE, "Starting module server... \n")

    # -- get namespace
    ns <- session$ns

    # -- the data
    df <- data.frame(id = c(1:10),
                     work = c(rep(TRUE, 5), rep(FALSE, 5)),
                     name = c("banana", "pear", "apple", "banana", "mango", "banana", "pear", "apple", "banana", "mango"),
                     value = c(10, 20, 30, 20, 20, 10, 20, 30, 20, 20))



    # -- check
    if(!is.null(cond))
      stopifnot(is.reactive(cond))


    # --------------------------------------------------------------------------
    # Outputs
    # --------------------------------------------------------------------------

    # -- apply filter
    df_filter <- reactive({

      # -- check
      cat("New condition received: \n")
      str(cond())

      # -- append internal condition
      cat("Adding internal condition: \n")
      extend_cond <- c(expr(work == TRUE), cond())
      str(extend_cond)

      # -- apply
      df %>%
        filter(!!!extend_cond)

    })


    # --------------------------------------------------------------------------
    # Return value
    # --------------------------------------------------------------------------

    df_filter


  })
}

