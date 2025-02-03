#!/bin/bash
# Run timedatectl and grab the line with Local time:
local_line=$(timedatectl | grep "^ *Local time:")

# Example Local time line:
# Local time: Tue 2025-02-04 00:50:35 IST

# Use awk to extract date (YYYY-MM-DD) and time (HH:MM:SS)
read -r weekday date_part time_part tz <<< "$(echo "$local_line" | awk '{print $3, $4, $5, $6}')"

# Subtract one day from the date
# Note: we combine the date and time to use GNU date arithmetic
new_date=$(date -d "${date_part} ${time_part} -1 day" +"%Y-%m-%d")

# Print out in desired format: YYYY-MM-DD | HH:MM:SS
echo "${new_date} | ${time_part}"
