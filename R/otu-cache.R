#' provide a cache containing all parsed otu(s) during biom format generation
#' 
#' @description to avoid redundancy and improve the performance in biom format generation
#' @keywords internal
new_otu_cache <- function() {
  cache <- NULL    
  create_cache <- function() {
    cache <<- new.env(TRUE, emptyenv())
  }
  cache_set <- function(key, value) {
    assign(key, value, env = cache)
  }
  cache_get <- function(key) {
    get(key, env = cache, inherits = FALSE)
  }
  cache_has_key <- function(key) {
    exists(key, env = cache, inherits = FALSE)
  } 
  create_cache()
  list(
    reset = create_cache,
    set = cache_set,
    get = cache_get,
    has_key = cache_has_key
  )
}