
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wqindex

[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://github.com/bcgov/repomountie/blob/master/doc/lifecycle-badges.md)[![Travis-CI
Build
Status](https://travis-ci.org/bcgov/wqindex.svg?branch=master)](https://travis-ci.org/bcgov/wqindex)[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Overview

The `wqindex` R package calculates the [CCME Water Quality
Index](http://www.ccme.ca/en/resources/canadian_environmental_quality_guidelines/index.html)
and plots water quality indices spatially and temporally for British
Columbia.

This functions in this package were originally written as a part of the
[wqbc](https://github.com/bcgov/wqbc) package for the B.C. Ministry of
Environment by [Poisson Consulting](http://www.poissonconsulting.ca/).
Ministry of Environment staff maintain the package. The original
**wqbc** package is currently being split into two smaller pacakge.
**wqbc** will be for cleaning, processing, and calculating
limits/thresholds for water qualtity data, while this package will be
for calculating the [CCME Water Quality
Index](http://www.ccme.ca/en/resources/canadian_environmental_quality_guidelines/index.html).

## Install

``` r
# install.packages("remotes") # if remotes is not installed
remotes::install_github("bcgov/wqindex")
library(wqindex)
```

## Project Status

This package is under active development and is not ready for use.

## Getting Help or Reporting an Issue

To report bugs/issues/feature requests, please file an
[issue](https://github.com/bcgov/wqindex/issues/).

## How to Contribute

If you would like to contribute to the package, please see our
[CONTRIBUTING](CONTRIBUTING.md) guidelines.

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree
to abide by its terms.

## License

    Copyright 2015 Province of British Columbia

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at 

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

This repository is maintained by [Environmental Reporting
BC](http://www2.gov.bc.ca/gov/content?id=FF80E0B985F245CEA62808414D78C41B).
Click [here](https://github.com/bcgov/EnvReportBC-RepoList) for a
complete list of our repositories on GitHub.
