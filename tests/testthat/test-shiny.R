library(shinytest2)

test_that("Shiny app works as expected", {

  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  example_app <- system.file("shiny", package = "RPharmaTest")

  app <- AppDriver$new(app_dir = example_app,
                       name = "take-break-app")

  # Test when break should be taken
  app$set_inputs(weather = "sunny", time = 11, workload = 6)
  app$expect_text("#result")

  # Test when break should not be taken
  app$set_inputs(weather = "sunny", time = 9, workload = 6)
  app$expect_text("#result")
})
