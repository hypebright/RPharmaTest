test_that("take_break returns correct values", {
  # Should return TRUE when it's sunny, after 10 AM, and workload > 5
  expect_true(take_break(weather = "sunny", time = 11, workload = 6))

  # Should return FALSE for other conditions
  expect_false(take_break(weather = "sunny", time = 9, workload = 6))
  expect_false(take_break(weather = "cloudy", time = 11, workload = 6))
  expect_false(take_break(weather = "sunny", time = 11, workload = 3))
})

test_that("take_break throws errors for invalid inputs", {
  expect_error(take_break("stormy", 11, 6))
  expect_error(take_break("sunny", -1, 6), "time should be between 0 and 24")
  expect_error(take_break("sunny", 11, "a lot"), "workload should be numeric")
})

