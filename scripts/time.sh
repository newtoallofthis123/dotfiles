#!/bin/bash
local_line=$(timedatectl | grep "^ *Local time:")

# Example Local time line:
# Local time: Tue 2025-02-04 00:50:35 IST

# Extract fields using awk. The fields are:
# $1: Local, $2: time:, $3: weekday, $4: date, $5: time, $6: timezone
read -r weekday date_part time_part tz <<<"$(echo "$local_line" | awk '{print $3, $4, $5, $6}')"

# Subtract one day from the date using GNU date arithmetic
adjusted_date=$(date -d "${date_part} ${time_part} -1 day" +"%d/%m")

# Prepare tooltip: "date | time"
tooltip="${time_part} on ${adjusted_date}"

# Create JSON output
json_output=$(printf '{"text": "%s", "tooltip": "%s" }' "${tooltip}" "${tooltip}")

# Print JSON output
echo "${json_output}"
