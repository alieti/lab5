context("myMap")


test_that("Wrong input throws an error.", {
  expect_error(mymap <- MapStamen$new("-125", 25.75, -67, 49, Zoom = 3))  
  expect_error(mymap <- MapStamen$new(-125, c(45,56), -67, 49, Zoom = 3))
  expect_error(mymap <- MapStamen$new(-125, 25.75, "-67", 49, Zoom = 3))
  expect_error(mymap <- MapStamen$new(-125, 25.75, -67, c(45,23)), Zoom = 3)
  expect_error(mymap <- MapStamen$new(-125, 25.75, -67, TRUE), Zoom = 3)
  expect_error(mymap <- MapStamen$new(mapType = 23))
})


test_that("class is correct.", {
  mymap <- MapStamen$new(left = -125, bottom = 25.75, right = -67, top = 49, Zoom = 3)
  expect_true(class(mymap)[1] == "MapStamen")
  expect_true(class(mymap)[2] == "R6")
})
