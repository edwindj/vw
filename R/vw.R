vw <- function(...){
  args <- list(...)
  print(args)
  #system("vw")
  system2("vw", args=c("--version"))
}


#vw(a=1)
