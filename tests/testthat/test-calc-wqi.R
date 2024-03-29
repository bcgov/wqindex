# Copyright 2015 Province of British Columbia
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.

context("calc-wqis")

test_that("categorize_wqi ", {
  expect_true(is.na(as.character(categorize_wqi(-1))))
  expect_equal(as.character(categorize_wqi(0)), "Poor")
  expect_equal(as.character(categorize_wqi(44)), "Poor")
  expect_equal(as.character(categorize_wqi(45)), "Marginal")
  expect_equal(as.character(categorize_wqi(64)), "Marginal")
  expect_equal(as.character(categorize_wqi(65)), "Fair")
  expect_equal(as.character(categorize_wqi(79)), "Fair")
  expect_equal(as.character(categorize_wqi(80)), "Good")
  expect_equal(as.character(categorize_wqi(94)), "Good")
  expect_equal(as.character(categorize_wqi(95)), "Excellent")
  expect_equal(as.character(categorize_wqi(100)), "Excellent")
  expect_true(is.na(as.character(categorize_wqi(101))))
})

test_that("ccme", {
  opts <- options()
  on.exit(options(opts))
  options(wqbc.messages = FALSE)

  data(ccme)

  x <- calc_wqi(ccme)

  expect_is(x, "data.frame")
  expect_equal(nrow(x), 1)
  expect_equal(colnames(x), c("WQI", "Lower", "Upper", "Category", "Variables", "Tests", "F1", "F2", "F3"))
  expect_equal(round(x$WQI), 88)
  expect_equal(round(x$Lower), 87)
  expect_equal(round(x$Upper), 94)
  expect_equal(as.character(x$Category), "Good")

  is.na(ccme$Value[ccme$Variable == "DO" & ccme$Date == as.Date("1997-03-04")]) <- TRUE
  x <- calc_wqi(ccme)
  expect_equal(x$Variables, 10)
  expect_equal(x$Tests, 102)
  expect_equal(x$WQI, 88.1)
  is.na(ccme$Value[ccme$Variable == "As"]) <- TRUE
  x <- calc_wqi(ccme)
  expect_equal(x$Variables, 9)
  expect_equal(x$Tests, 90)
  expect_equal(x$WQI, 86.8)
  is.na(ccme$Value[ccme$Variable == "As"]) <- TRUE
})

test_that("ccme 4x4", {
  opts <- options()
  on.exit(options(opts))
  options(wqbc.messages = FALSE)

  data(ccme)

  expect_equal(nrow(calc_wqi(ccme)), 1)
  expect_equal(nrow(calc_wqi(ccme[ccme$Variable == "DO",])), 0)
  expect_equal(nrow(calc_wqi(ccme[ccme$Variable %in% c("DO","pH","TP"),])), 0)
  expect_equal(nrow(calc_wqi(ccme[ccme$Variable %in% c("DO","pH","TP","TN"),])), 1)
  ccme <- plyr::ddply(ccme, "Variable", function (x) x[1:4,])
  ccme <- ccme[ccme$Variable %in% c("DO","pH","TP","TN"),]
  expect_equal(nrow(calc_wqi(ccme)), 1)
  expect_equal(nrow(calc_wqi(ccme[-1,])), 0)
})

test_that("calc_wqi by", {
  opts <- options()
  on.exit(options(opts))
  options(wqbc.messages = FALSE)

  data(ccme)
  x <- calc_wqi(ccme, by = "Date")

  expect_is(x, "data.frame")
  expect_equal(nrow(x), 0)
  expect_equal(colnames(x), c("Date", "WQI", "Lower", "Upper", "Category", "Variables", "Tests", "F1", "F2", "F3"))
})

test_that("calc_wqi missing columns", {
  opts <- options()
  on.exit(options(opts))
  options(wqbc.messages = FALSE)

  expect_error(calc_wqi(data.frame()), regexp = "x must contain at least one of LowerLimit and UpperLimit columns", fixed = TRUE)
  expect_error(calc_wqi(data.frame(UpperLimit = 1, Value = 1)), regexp = "`names(x)` must include 'Variable'.", fixed = TRUE)
  expect_error(calc_wqi(data.frame(UpperLimit = 1, Variable = "a")), regexp = "`names(x)` must include 'Value'.", fixed = TRUE)
  expect_error(calc_wqi(data.frame(UpperLimit = 1, Units = "a")), regexp = "`names(x)` must include 'Variable' and 'Value'.", fixed = TRUE)
  expect_error(calc_wqi(data.frame(Units = "a", Value = 1, Variable = "a")), regexp = "x must contain at least one of LowerLimit and UpperLimit columns", fixed = TRUE)
})

test_that("calc_wqi zero values", {

  opts <- options()
  on.exit(options(opts))
  options(wqbc.messages = FALSE)

  data(ccme)
  x <- data.frame(Variable = "Zinc Total", Value = 0, Units = "ug/L")
  expect_is(calc_wqi(ccme), "data.frame")
  ccme$Value <- 0
  expect_error(calc_wqi(ccme), regexp = "Variables DO and pH have a LowerLimit and one or more zero Values with no defined DetectionLimit")
  ccme$DetectionLimit <- 1
  expect_is(calc_wqi(ccme), "data.frame")
})
