# utility function for data input and output
# functions for converting data.frames/csv into (compressed) vowpal wabbit format
# maybe add some svm-light formatting too.

#' @export
vw_data <- function(x, type=c("existence", "count")){
}


existence_to_num <- function(x, sep=","){
  ex <- strsplit(x, split = sep)
  lapply(ex, function(item){
    setNames(rep(1L, length(item)), item)
  })
}

existence_to_df <- function(x, sep=","){
  ex <- strsplit(x, split = sep)
  r <- 0
  l <- lapply(ex, function(item){
    r <<- r + 1
    data.frame(row=r, item=item, count=1, stringsAsFactors = FALSE)
  })
  dplyr::bind_rows(l)
}

existence_to_Matrix <- function(x, sep=","){
  df <- existence_to_df(x, sep=sep)
  df$item <- factor(df$item)
  Matrix::sparseMatrix( i = df$row
                      , j = unclass(df$item)
                      , x = df$count
                      , dimnames = list(NULL, levels(df$item))
                      )
}

# x <- c("trousers","skirt,blue")
# existence_to_Matrix(x)
