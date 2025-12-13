#' Parse JSON response from BDDK/Finturk APIs
#' Shared parser for both API endpoints. Extracts non-hidden columns from JSON response.
#' @param parsed_json The parsed$Json object from API response.
#' @return Data frame with parsed data.
#' @importFrom stats setNames
#' @noRd
parse_bddk_json <- function(parsed_json) {
  # Identify non-hidden columns
  non_hidden <- which(!sapply(parsed_json$colModels, function(x) isTRUE(x$hidden)))
  if (length(non_hidden) == 0) non_hidden <- seq_along(parsed_json$colModels)

  # Extract and filter components
  col_models <- parsed_json$colModels[non_hidden]
  col_labels <- parsed_json$colNames[non_hidden]
  rows <- parsed_json$data$rows

  if (length(rows) == 0) return(data.frame())

  # Generate valid column names
  final_names <- ifelse(col_labels != "", col_labels,
                        sapply(col_models, function(x) x$name))

  # Extract cell data for non-hidden columns
  filtered_rows <- lapply(rows, function(row) row$cell[non_hidden])

  # Build column list, handling NULLs
  col_list <- lapply(seq_along(non_hidden), function(i) {
    col_vals <- sapply(filtered_rows, function(x) x[[i]])
    col_vals[sapply(col_vals, is.null)] <- NA
    unlist(col_vals)
  })

  # Create data frame using list2DF function in base R
  df <- list2DF(setNames(col_list, final_names))
  return(df)
}


#' Save Fetched Data to Multiple Formats
#'
#' @param df Data frame to save (with fetch_range attribute for auto-naming).
#' @param filename Base name for output file (without extension).
#' @param format Output format: "rds", "csv", or "xlsx". Default "rds".
#' @return Full file path (invisibly).
#' @importFrom utils write.csv
#' @export
#' @examples
#' \dontrun{
#'   my_data <- fetch_bddk1(2024, 1, 15)
#'   temp_file <- tempfile(fileext = ".csv")
#'   save_data(my_data, temp_file, format = "csv")
#' }
save_data <- function(df, filename = NULL, format = "rds") {
  valid_formats <- c("rds", "csv", "xlsx")
  if (!format %in% valid_formats) {
    stop("Invalid 'format'. Must be one of: ", paste(valid_formats, collapse = ", "))
  }

  if (is.null(filename)) {
    params <- attr(df, "fetch_range")
    if (is.null(params)) {
      stop("Data frame must have a 'fetch_range' attribute for automatic naming.")
    }
    filename <- sprintf("bddk_table%s_%s_%s.%s",
                        params$table_no,
                        params$start_date,
                        params$end_date,
                        format)
  } else {
    filename <- paste0(filename, ".", format)
  }

  switch(format,
         csv = {
           write.csv(df, filename, row.names = FALSE)
           message(sprintf("Data saved to %s", filename))
         },
         xlsx = {
           if (!requireNamespace("writexl", quietly = TRUE)) {
             stop("Please install 'writexl' package for Excel export")
           }
           writexl::write_xlsx(df, filename)
           message(sprintf("Data saved to %s", filename))
         },
         rds = {
           saveRDS(df, filename)
           message(sprintf("Data saved to %s", filename))
         })

  invisible(filename)
}


#' Convert plaka (license plate number)  to city code
#' Maps Turkish license plate numbers to city codes used in the Finturk API.
#'
#' @param plaka license plate number (0 for "HEPSI", 1-81 for cities,
#' 999 for "YURT DISI")
#' @return City code in ALL CAPS as required by API
#' @export
#' @examples
#' plaka_to_city(6)   # "ANKARA"
#' plaka_to_city(34)  # "ISTANBUL"
#' plaka_to_city(0)   # "HEPSI"
plaka_to_city <- function(plaka) {
  cities <- get("finturk_cities", envir = asNamespace("rbrsa"))
  if (!plaka %in% cities$plaka) {
    stop(sprintf("Invalid plaka number: %d. Valid plaka: 0 (HEPSI), 1-81,
                 999 (YURT DISI)", plaka))
  }
  cities$city[cities$plaka == plaka]
}

#' List Available Cities for Finturk
#' Print available cities for Finturk quarterly data with plaka (license plate) numbers.
#' @return Data frame of available cities
#' @export
#' @examples
#' list_cities()
list_cities <- function() {
  cities <- get("finturk_cities", envir = asNamespace("rbrsa"))

  cat("\nAvailable cities for Finturk quarterly data:\n")
  cat("(Use plate number in fetch_finturk functions)\n")
  cat("  Plate 0 = HEPSI (All Cities)\n")
  cat("  Plate 999 = YURT DISI (Foreign Countries)\n\n")

  df = data.frame(
    Plate = cities$plaka,
    City = cities$city
  )
  print(df, row.names = FALSE)
  invisible(df)
}

#' List available groups
#' Print available banking groups for a data source.
#'
#' @param source Either "bddk" or "finturk"
#' @param lang Either "tr" or "en" for names. "en" is default
#' @return Data frame of available groups (invisibly)
#' @export
#' @examples
#' list_groups("bddk")
#' list_groups("finturk","tr")

list_groups <- function(source = c("bddk", "finturk"), lang = c("en", "tr")) {
  source <- match.arg(source)
  lang <- match.arg(lang)

  if (source == "bddk") {
    groups <- get("bddk_groups", envir = asNamespace("rbrsa"))
    name_col <- if (lang == "tr") "name_tr" else "name_en"
  } else {
    groups <- get("finturk_groups", envir = asNamespace("rbrsa"))
    name_col <- if (lang == "tr") "name_tr" else "name_en"
  }

  df <- data.frame(
    Group_Code = groups$grup_kod,
    Name = groups[[name_col]],
    stringsAsFactors = FALSE
  )

  cat(sprintf("\nAvailable banking groups for %s data:\n", source))
  print(df, row.names = FALSE)

  invisible(df)
}

#' List Available Tables
#' Print available tables for a data source.
#'
#' @param source Either "bddk" or "finturk"
#' @param lang Either "tr" or "en" for column names. "en" is default
#' @return Data frame of available tables (invisibly)
#' @export
#' @examples
#' list_tables("bddk")
#' list_tables("finturk", "tr")

list_tables <- function(source = c("bddk", "finturk"), lang = c("en", "tr")) {
  source <- match.arg(source)
  lang <- match.arg(lang)

  if (source == "bddk") {
    tables <- get("bddk_tables", envir = asNamespace("rbrsa"))
    title_col <- if (lang == "tr") "title_tr" else "title_en"
  } else {
    tables <- get("finturk_tables", envir = asNamespace("rbrsa"))
    title_col <- if (lang == "tr") "title_tr" else "title_en"
  }

  df <- data.frame(
    Table_No = tables$table_no,
    Title = tables[[title_col]]
  )

  cat(sprintf("\nAvailable tables for %s data:\n", source))
  print(df, row.names = FALSE)

  invisible(df)
}


