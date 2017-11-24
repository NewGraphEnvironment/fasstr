
<!-- README.md is generated from README.Rmd. Please edit that file -->
<a rel="Exploration" href="https://github.com/BCDevExchange/docs/blob/master/discussion/projectstates.md"><img alt="Being designed and built, but in the lab. May change, disappear, or be buggy." style="border-width:0" src="https://assets.bcdevexchange.org/images/badges/exploration.svg" title="Being designed and built, but in the lab. May change, disappear, or be buggy." /></a>

fasstr
======

The Flow Analysis Summary Statistics Tool for R (`fasstr`) is a set of [R](http://www.r-project.org) functions to summarize, analyze, trend, and visualize streamflow data. This package summarizes continuous daily mean streamflow datasets into various daily, monthly, annual, and long-term statistics, completes annual trends and frequency analyses, and provides output tables and plots.

Features
--------

Useful features of this package include the of utilization of the [tidyhydat](https://github.com/bcgov/tidyhydat) package to extract Water Survey of Canada historical streamflow data from a locally saved [HYDAT](https://www.canada.ca/en/environment-climate-change/services/water-overview/quantity/monitoring/survey/data-products-services/national-archive-hydat.html) database for analyses, the filtering of years included in analyses (start and end years, excluded years), option to choose water years for analyses instead of calendar years, streamflow data preparation functions, options to save/write plots directly to your computer within the functions, and customizing how missing dates are handled.

Installation
------------

To install the `fasstr` package, you need to install the `devtools` package then the `fasstr` package

``` r
install.packages("devtools")
devtools::install_github("bcgov/fasstr")
```

Then to call the `fasstr` functions you can either load the package using the `library()` function or access a specific function using a double-colon (e.g. `fasstr::fasstr_daily_stats()`). Several other packages will be installed in addition to this package including [zyp](https://cran.r-project.org/web/packages/zyp/index.html) for trending, [ggplot2](https://cran.r-project.org/web/packages/ggplot2/index.html) for creating plots, and [dplyr](https://cran.r-project.org/web/packages/dplyr/index.html) and [tidyr](https://cran.r-project.org/web/packages/tidyr/index.html) for various data wrangling and summarizing functions, amongst others.

To use the `HYDAT` arguments of the `fasstr` functions, you will need to download the `tidyhydat` package and a HYDAT database. Installation instructions for both can be found [here](https://github.com/bcgov/tidyhydat).

Usage
-----

### Flow Data Input

All functions in `fasstr` require a dataset of daily mean streamflow. Flow data can be provided to the functions through either the `HYDAT` or `flowdata` arguments. When using the `HYDAT` argument, a Water Survey of Canada station number is required (e.g. `HYDAT="08NM116"`) and its corresponding historical daily streamflow record is extracted from HYDAT using `tidyhydat`. [Installation](https://github.com/bcgov/tidyhydat) of both `tidyhydat` and a HYDAT database is required to use this argument.

Data can alternatively be provided using the `flowdata` argument as a dataframe with columns of 'Date' (YYYY-MM-DD in date format) and 'Value' (mean daily discharge in cubic metres per second in numeric format). The `fasstr` functions will not recognize your dates and flow data if the columns are not appropriately named 'Date' and 'Value'.

### Year Options

To customize your analyses for specific time periods, you can designate the start and end years of your analysis using the `start_year` and `end_year` arguments and remove any unwanted years (for partial datasets for example) by listing them in the `excluded_years` argument (e.g. `excluded_years=c(1990,1992:1994)`). Leaving these arguments blank will result in the summary/analysis of all years of the provided dataset.

To group analyses by water, or hydrologic, years instead of calendar years, if desired, you can use `water_year=TRUE` within most functions (default is `water_year=FALSE`). A water year can be defined as a 12-month period that comprises a complete hydrologic cycle (wet seasons can typically cross calendar year), typically starting with the month with minimum flows (the start of a new water recharge cycle). As water years commonly start in October, the default water year is October for `fasstr`. If another start month is desired, you can choose is using the `water_year_start` argument (numeric month) to designate the water year time period. The water year label is designated by the year it ends in (e.g. water year 2000 goes from Oct 1, 1999 to Sep 30, 2000). Start, end and excluded years will be based on the specified water year.

### Drainage Basin Area

For annual yield runoff statistics calculated in the annual statistics functions, a upstream drainage basin area (in sq. km) is required with the `basin_area` argument. If no area is supplied, all yield results will be `NA`. If using the `HYDAT` argument to supply streamflow data, the function will automatically use the basin area of the station provided in HYDAT, if available, as a result `basin_area` is not required. To override the basin area from HYDAT, just set the `basin_area` to your choosing and it will replace the HYDAT number.

### Handling Missing Dates

Coming soon.

### Writing/saving plots and tables

In most functions that compute statistics or create plots, there is an option to directly write or save the tables and plots to your computer without additional functions. The default directory is your working directory, but you can choose your directory using the `report_dir` argument. Tables are saved in '.csv' format and plots can be saved several formats (including "pdf","png","jpeg","tiff", or "bmp"), with the default being '.pdf'.

### Example

Coming soon.

``` r
## example code coming soon
```

Project Status
--------------

This package is under development. This package is maintained by the Water Protection and Sustainability Branch of the [British Columbia Ministry of Environment and Climate Change Strategy](https://www2.gov.bc.ca/gov/content/governments/organizational-structure/ministries-organizations/ministries/environment-climate-change).

Getting Help or Reporting an Issue
----------------------------------

To report bugs/issues/feature requests, please file an [issue](https://github.com/bcgov/fasstr/issues/).

How to Contribute
-----------------

If you would like to contribute to the package, please see our [CONTRIBUTING](CONTRIBUTING.md) guidelines.

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

License
-------

    Copyright 2017 Province of British Columbia

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at 

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
