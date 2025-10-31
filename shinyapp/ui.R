

# ------------------------------------------------------------------------------
# User-interface definition of the Shiny application
# ------------------------------------------------------------------------------

# -- Define & return UI
page_navbar(

  # -- Footer
  fillable = FALSE,
  footer = p(style = "font-size:9pt;margin-top:20px;", "© 2025 Philippe Peret"),

  # -- Theme
  theme = bs_theme(
    bg = "#2d3037",
    fg = "#FFF",
    primary = "orange",
    secondary = "#ececec",
    base_font = font_google("Quicksand")),

  # -- Title
  title = "R Template",

  # -- First tab
  nav_panel(title = "Filter",
            class = "p-5",

            # -- text & inputs
            layout_columns(

              # -- details
              tagList(
                p("Goal: pass filter condition to a module server,", br(),
                  "happen a module internal condition and apply the filter on a data.frame"),

                p("The module server internal condition is work == TRUE", br(),
                  "original data.frame has rows with FALSE (see module server code)")),

              # -- input
              card(
                card_header("User filter"),
                p("Additional conditions may be added from outside the module server:"),
                checkboxGroupInput(inputId = "conditions",
                                   label = "Conditions",
                                   choices = NULL))),

            # -- tables
            layout_columns(

               # -- raw
              card(
                card_header("Raw table"),
                DT::DTOutput(NS(namespace = "data", id = "raw_df"))),

              # -- filter
              card(
                card_header("Filter table"),
                DT::DTOutput("filtered_df"))))

)
