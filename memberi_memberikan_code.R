library(tidyverse)
# concord_others of `corplingr`
concords <- function(corpus_vector = "character vector of text loaded/read into console",
         pattern = "regular expressions",
         to_lower_corpus = TRUE,
         case_insensitive = TRUE,
         context_char = 50) {
  
  # subset the line/text containing the potential match
  regexpr <- pattern
  cat("Subsetting sentences containing the match...\n")
  m <- corpus_vector %>%
    stringr::str_subset(stringr::regex(regexpr, ignore_case = case_insensitive))
  
  if ((length(m) >= 1) == TRUE) {
    
    if (to_lower_corpus == TRUE) {
      cat("Lowercasing the sentences with the match...\n")
      m <- stringr::str_to_lower(m)
    }
    
    # detect the start and end character-location of the match
    #cat("Detecting the match/pattern...\n")
    match_location <- stringr::str_locate_all(m, stringr::regex(regexpr, ignore_case = case_insensitive)) %>%
      purrr::map(tibble::as_tibble) %>%
      purrr::map_df(dplyr::bind_rows)
    
    # duplicate the number of subset text as many as the number of the match
    m1 <- rep(m, stringr::str_count(m, stringr::regex(regexpr, ignore_case = case_insensitive)))
    
    # extract match
    cat("Generating the concordance for the match/pattern...\n")
    node <- stringr::str_sub(m1, start = match_location$start, end = match_location$end)
    node_tag <- stringr::str_c("\t<NODE>", node, "</NODE>\t", sep = "")
    left <- stringr::str_sub(m1, start = 1, end = (match_location$start - 1))
    right <- stringr::str_sub(m1, start = (match_location$end + 1), end = nchar(m1))
    
    # create concordance
    ## get left context whose character length is the same with the required context char
    if (any(nchar(left) == context_char)) {
      equal_left_context <- which(nchar(left) == context_char)
    } 
  
    if (any(nchar(left) < context_char)) {
      smaller_left_context <- which(nchar(left) < context_char)
    }
    
    starts <- (nchar(left) - context_char)
    starts[equal_left_context] <- 1
    starts[smaller_left_context] <- 1
    ends <- nchar(left)
    
    LEFT <- stringr::str_sub(left, start = starts, end = ends)
    LEFT <- replace(LEFT, nchar(LEFT) == 0, "~")
    NODE <- node
    RIGHT <- stringr::str_sub(right, start = 1, end = context_char)
    RIGHT <- replace(RIGHT, nchar(RIGHT) == 0, "~")
    concord_df <- tibble::tibble(LEFT, NODE, RIGHT)
    concord_df <- dplyr::mutate(concord_df,
                                LEFT = stringr::str_trim(.data$LEFT),
                                NODE = stringr::str_trim(.data$NODE),
                                RIGHT = stringr::str_trim(.data$RIGHT))
    cat("Done!\n")
    return(concord_df)
  } else {
    message("Sorry; no match found! Try another corpus/pattern!\n")
  }
}

# read in the 1M-tagged PAN corpus
corp <- readr::read_lines("/Users/Primahadi/Documents/Corpora/_corpusindo/PAN_corpus/UI-1M-tagged.txt")

# concordance for memberi
# m <- unlist(stringr::str_extract_all(corp, "((\\b[A-Za-z0-9-]+\\/[a-z]+\\s){1,})(\\bmemberi\\/[a-z]+\\b)((\\s\\b[A-Za-z0-9-]+\\/[a-z]+\\b){1,})"))
# beri <- tibble::tibble(matches = m)
# beri <- tidyr::extract(beri, matches, c("left", "node", "right"), "(.+?)\\s(\\bmemberi\\/[a-z]+\\b)\\s(.+)")
# # remove 'memberi tahu'
# beri <- dplyr::filter(beri, !stringr::str_detect(right, "^tahu\\/vbi"))
# beri <- dplyr::distinct(beri)
# beri
conc_beri <- concords(corpus_vector = corp, pattern = "\\bmemberi\\/[a-z]+\\b", context_char = 100)
conc_beri <- dplyr::distinct(conc_beri)
# remove 'memberi tahu'
conc_beri <- dplyr::filter(conc_beri, !stringr::str_detect(RIGHT, "^tahu\\/vbi"))
conc_beri


# concordance for memberikan
# m <- unlist(stringr::str_extract_all(corp, "((\\b[A-Za-z0-9-]+\\/[a-z]+\\s){1,})(\\bmemberikan\\/[a-z]+\\b)((\\s\\b[A-Za-z0-9-]+\\/[a-z]+\\b){1,})"))
# berikan <- tibble::tibble(matches = m)
# berikan <- tidyr::extract(berikan, matches, c("left", "node", "right"), "(.+?)\\s(\\bmemberikan\\/[a-z]+\\b)\\s(.+)")
# # remove duplicates
# berikan <- dplyr::distinct(berikan)
# berikan
conc_berikan <- concords(corpus_vector = corp, pattern = "\\bmemberikan\\/[a-z]+\\b", context_char = 150)
conc_berikan <- dplyr::distinct(conc_berikan)
conc_berikan

# set sample size
min(nrow(conc_beri), nrow(conc_berikan))
n_sample <- 200

# generate sample
conc_beri <- dplyr::sample_n(conc_beri, n_sample)
readr::write_delim(conc_beri, "memberi.txt", delim = "\t")

# generate sample equal to `memberi`
conc_berikan <- dplyr::sample_n(conc_berikan, n_sample)
readr::write_delim(conc_berikan, "memberikan.txt", delim = "\t")
