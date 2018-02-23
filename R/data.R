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

#' CCME Water Quality Index User's Manual Example Data
#'
#' The Canadian Council of Ministers of the Environment (CCME)
#' Water Quality Index 1.0 User's Manual example dataset in tidy format.
#'
#' @format A data frame with 120 rows and 7 columns:
#' \describe{
#'   \item{Date}{The date of the reading.}
#'   \item{Variable}{The name of the variable.}
#'   \item{Value}{The value of the reading.}
#'   \item{DetectionLimit}{The detection limit.}
#'   \item{LowerLimit}{The minimum permitted value.}
#'   \item{UpperLimit}{The maximum permitted value.}
#'   \item{Units}{The units of the value, detection limit and lower and upper limits.}
#' }
#' @examples
#' demo(ccme)
"ccme"

#' Dummy Water Quality Data
#'
#' A dummy data set to illustrate various data cleaning functions.
#'
#' @format A data frame with 4 columns:
#' \describe{
#'   \item{Date}{The date of the reading.}
#'   \item{Variable}{The name of the variable.}
#'   \item{Value}{The value of the reading.}
#'   \item{Units}{The units of the value.}
#' }
#' @examples
#' demo(dummy)
"dummy"
