

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

            # -- content
            p("Goal: pass filter condition to a module server,", br(),
              "happen a module internal condition and apply the filter on a data.frame"),

            p("The module server internal condition is work == TRUE", br(),
              "original data.frame has rows with FALSE (see module server code)"),

            p("Additional conditions may be added from outside the module server:"),

            # -- input
            checkboxGroupInput(inputId = "conditions",
                               label = "Conditions",
                               choices = NULL),

            # -- table
            DT::DTOutput("filtered_df"))

)
