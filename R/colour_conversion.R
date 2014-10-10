#' Convert R colors to RGBA hexadecimal color values
#' @param x character for color, for example: "white"
#' @param alpha alpha
#' @return hexadecimal color value (if is.na(x), return "none" for compatibility with JavaScript)
#' @export
toRGB <- function(x, alpha=1) {
  if(is.null(x))return(x)
  if (alpha!=1) {
    rgb.matrix <- col2rgb(x, TRUE)
    rgb.matrix["alpha", 1] <- alpha
    ch.vector <- "rgba(%s)"
  } else {
    rgb.matrix <- col2rgb(x)
    ch.vector <- "rgb(%s)"
  }
  rgb.text <- apply(rgb.matrix, 2, paste, collapse=",")
  rgb.css <- sprintf(ch.vector, rgb.text)
  ifelse(is.na(x), "none", rgb.css)
}