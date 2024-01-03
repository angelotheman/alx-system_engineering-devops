#!/usr/bin/env ruby

log_entry = ARGV[0]

# Define the regular expression pattern
pattern = /\[from:(.+?)\]\s\[to:(.+?)\]\s\[flags:(.+?)\]/

# Match the pattern in the log entry
matches = log_entry.match(pattern)

# Extract and print the captured groups
if matches
  sender = matches[1]
  receiver = matches[2]
  flag = matches[3]
  puts "#{sender},#{receiver},#{flag}"
else
  puts "No match found"
end
