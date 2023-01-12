# Load packages
library(fs)
library(readr)
library(purrr)

# Get file paths for all .csv outputs
outputs_path <- dir_ls(path = "output", glob = "*output/input_2*.csv$")

# Read all .csv files (introduced in purrr version 0.3.0)
# use .id argument from purrr::map_dfr to provide var name for file path
df_joined <- map_dfr(outputs_path,
  readr::read_csv,
  .id = "filename"
)


# Read all .csv files (from readr version 2.0.0, Jul 2021 onwards)
# use id argument from readr::read_csv to provide var name for file path
# df_joined <- map_dfr(outputs_path,
#   read_csv,
#   id = "filename"
# )

# Write joined csv file
write_csv(df_joined, "output/input_joined.csv")

# Write .txt file with sessionInfo
writeLines(capture.output(sessionInfo()), "output/session_info.txt")
