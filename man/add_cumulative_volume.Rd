% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_cumulative_volume.R
\name{add_cumulative_volume}
\alias{add_cumulative_volume}
\title{Add daily cumulative volumetric flows on an annual basis}
\usage{
add_cumulative_volume(
  data,
  dates = Date,
  values = Value,
  groups = STATION_NUMBER,
  station_number,
  water_year_start = 1
)
}
\arguments{
\item{data}{A data frame of daily data that contains columns of dates, flow values, and (optional) groups (e.g. station numbers).
Leave blank if using \code{station_number} argument.}

\item{dates}{Column in \code{data} that contains dates formatted YYYY-MM-DD. Only required if dates column name is not '
Date' (default). Leave blank if using \code{station_number} argument.}

\item{values}{Column in \code{data} that contains numeric flow values, in units of cubic metres per second.
Only required if values column name is not 'Value' (default). Leave blank if using \code{station_number} argument.}

\item{groups}{Column in \code{data} that contains unique identifiers for different data sets, if applicable. Only required if
groups column name is not 'STATION_NUMBER'. Function will automatically group by a column named 'STATION_NUMBER' if present.
Remove the 'STATION_NUMBER' column beforehand to remove this grouping. Leave blank if using \code{station_number} argument.}

\item{station_number}{A character string vector of seven digit Water Survey of Canada station numbers (e.g. \code{"08NM116"}) of
which to extract daily streamflow data from a HYDAT database. Requires \code{tidyhydat} package and a HYDAT database.
Leave blank if using \code{data} argument.}

\item{water_year_start}{Numeric value indicating the month of the start of the water year for analysis. Default \code{1}.}
}
\value{
A tibble data frame of the source data with an additional column:
  \item{Cumul_Volume_m3}{cumulative volumetric flows for each day for each year, in units of cubic metres}
}
\description{
Add a column of rolling daily cumulative volumetric flows on an annual basis to a streamflow dataset. Adds the 
   volumetric discharge from each day with the previous day(s) for each year, in units of cubic metres. 
   The cumulative flows restart every year and are only calculated in years with complete data.
}
\examples{
# Run if HYDAT database has been downloaded (using tidyhydat::download_hydat())
if (file.exists(tidyhydat::hy_downloaded_db())) {

# Add a column based on water years starting in August
add_cumulative_volume(station_number = "08NM116", 
                      water_year_start = 8)
                      
}
}
