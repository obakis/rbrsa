#' Fetch single period Finturk data
#'
#' Retrieves quarterly data from the BDDK Finturk website
#'
#' @param year Year as 4-digit integer (YYYY).
#' @param month Month as integer (3,6,9,12 for quarterly data).
#' @param table_no Table number to fetch (1-7). No default.
#' @param grup_kod Group code (10001-1007). Default 10001.
#' @param il plaka (license plate) number (0-81, 99). Default 0.
#'   0=HEPSİ (All Cities), 1=Adana, 6=Ankara, 34=İstanbul, 35=İzmir, etc.
#'   See \code{\link{list_cities}} for full list.
#' @return Data frame with data and period metadata.
#' @export
#' @examples
#' \donttest{
#'   # Fetch Table 1 (Loans) for Q1 2024
#'   data <- fetch_finturk1(2024, 3, 1)
#' }
fetch_finturk1 <- function(year, month, table_no, 
                           grup_kod = 10001, il = 0) {
  if (!month %in% c(3, 6, 9, 12)) {
    stop("Finturk requires quarterly months (3,6,9,12)")
  }
  if (!is.numeric(il)) {
    stop("Finturk requires plaka (license plate) number: 0 (ALL), 1-81")
  }
  cities <- get("finturk_cities", envir = asNamespace("rbrsa"))
  city_name <- plaka_to_city(il)   #Convert plaka to city name for API
  
  base_url <- "https://www.bddk.org.tr/BultenFinturk/tr/Home/VeriGetir"
  req <- httr2::request(base_url) |>
    httr2::req_body_form(
        tabloNo = as.character(table_no),
        donem = sprintf("%d-%d", year, month),
        `tarafList[0]` = as.character(grup_kod),
        `sehirList[0]` = city_name
        ) |>
    httr2::req_headers(
      `Content-Type` = "application/x-www-form-urlencoded; charset=UTF-8",
      `X-Requested-With` = "XMLHttpRequest",
      `Referer` = "https://www.bddk.org.tr/BultenFinturk"
      ) |>
    httr2::req_timeout(30)
  
  resp <- tryCatch(
    httr2::req_perform(req),
    error = function(e) stop(sprintf("HTTP error: %s", e$message))
  )  
  parsed <- jsonlite::fromJSON(
    httr2::resp_body_string(resp, encoding = "UTF-8"), 
    simplifyVector = FALSE
  )  
  
  if (!isTRUE(parsed$success)) {
    warning("API reported unsuccessful request")
    return(data.frame())
  }
  
  # create data frame from JSON file
  df <- parse_bddk_json(parsed$Json)
  if (nrow(df) == 0) {
    warning(sprintf("No data for table %d, %d-%02d, grup_kod %d, plaka  %d", 
                    table_no, year, month, grup_kod, il))
    return(data.frame())
  }
  # Add metadata
  df$period <- sprintf("%d-%02d", year, month)
  df$grup_kod <- as.character(grup_kod)
  df$il <- il
  df$table_no <- as.character(table_no)
  
  df
}


#' Fetch multiple period Finturk data
#'
#' Fetches Finturk data for a range of quarters by calling fetch_finturk1 iteratively.
#'
#' @param start_year,end_year Starting/ending year (YYYY).
#' @param start_month,end_month Starting/ending month (3,6,9,12).
#' @param table_no Table number to fetch (1-7). No default. 
#' Use \code{\link{list_tables}} with \code{source = "finturk"} to see available options.
#' @param grup_kod Group code (10001-10007). Default 10001. 
#' Use \code{\link{list_groups}} with \code{source = "finturk"} to see available options.
#' @param il plaka (license plate) number (0-81, 99). Default 0.
#' @param delay Delay between requests in seconds. Default 0.5.
#' @param verbose Print progress messages. Default TRUE.
#' @return Combined data frame with "fetch_info" attribute.
#' @export
#' @examples
#' \donttest{
#'   # Fetch multiple quarters
#'   my_data <- fetch_finturk(2024, 3, 2024, 9, table_no = 1)
#' }
fetch_finturk <- function(start_year, start_month, end_year, end_month, 
                          table_no, grup_kod = 10001, il = 0,
                          delay = 0.5, verbose = TRUE) {
  
  valid_months <- c(3, 6, 9, 12)
  if (!start_month %in% valid_months || !end_month %in% valid_months) {
    stop("Start and end months must be one of 3,6,9,12 (quarterly)")
  }
  if (!is.numeric(il)) {
    stop("Finturk requires plaka (license plate) number: 0 (ALL), 1-81")
  }
  
  # Convert plate to city code for API
  city_name <- plaka_to_city(il)
  
  if (start_year > end_year || (start_year == end_year && start_month > end_month)) {
    stop("Start period must be before or equal to end period")
  }
  
  periods <- list()
  for (year in start_year:end_year) {
    for (month in valid_months) {
      if (year == start_year && month < start_month) next
      if (year == end_year && month > end_month) next
      periods <- c(periods, list(list(year = year, month = month)))
    }
  }
  
  if (verbose) {
    cat(sprintf("Fetching table %d for %d quarterly periods: %d-%02d to %d-%02d\n", 
                table_no, length(periods), start_year, start_month, end_year, end_month))
  }
  
  results <- list(); errors <- list()
  for (i in seq_along(periods)) {
    p <- periods[[i]]
    if (verbose) cat(sprintf("[%d/%d] %d-%02d... ", i, length(periods), p$year, p$month))
    
    tryCatch({
      df <- fetch_finturk1(p$year, p$month, table_no, grup_kod, il)
      if (nrow(df) > 0) {
        results[[length(results) + 1]] <- df
        if (verbose) cat(sprintf("%d rows\n", nrow(df)))
      } else {
        if (verbose) cat("No data\n")
      }
    }, error = function(e) {
      if (verbose) cat(sprintf("Error: %s\n", e$message))
      errors[[length(errors) + 1]] <- list(year = p$year, month = p$month, error = e$message)
    })
    
    if (i < length(periods) && delay > 0) Sys.sleep(delay)
  }
  
  if (length(results) == 0) {
    warning("No data retrieved")
    return(data.frame())
  }
  
  combined_df <- do.call(rbind, results)
  rownames(combined_df) <- NULL
  
  attr(combined_df, "fetch_info") <- list(
    start_date = sprintf("%d-%02d", start_year, start_month),
    end_date = sprintf("%d-%02d", end_year, end_month),
    table_no = table_no,
    grup_kod = grup_kod,
    il = il,
    # periods_requested = length(periods),
    # periods_successful = length(results),
    # periods_failed = length(errors),
    errors = errors
  )
  
  combined_df
}


