renv::restore(clean = TRUE, prompt = FALSE, rebuild = FALSE)

time <- Sys.time()

fname <- paste0("output/",as.character(Sys.Date()), ".txt")

write(time, fname)