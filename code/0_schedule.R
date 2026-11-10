# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 0_schedule.R
# Angus Morton
# 2024-12-17
# 
# R version 4.5.1 (2021-11-01)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### Step 0 : Housekeeping ----

# Import scheduling functions
source("job_scheduler/99_Launch_Scheduler.R")

#### Step 1 : Initial run ----

launch_workbench_job(
  job_name = "intial_run",
  project_path = getwd(),
  script = "code/script.R",
  n_ram = 4096
)

#### Step 2 : Schedule ----

# sets off a schedule to run at 
interval <- 86400 # 1 day

x <- 1

# Run at 0530 in the morning
last_time <- as.POSIXct(paste(Sys.Date(), "05:30"), tz = "")

while (x > 0) {
  
  if (Sys.time() > (last_time+interval)) {
    
    launch_workbench_job(
      job_name = "subsequent_run",
      project_path = getwd(),
      script = "code/script.R",
      n_ram = 4096
    )
    
    last_time <- last_time+interval
    
  }
  
  x <- x + 1
  
  print(x)
  
  Sys.sleep(30)
  
}

